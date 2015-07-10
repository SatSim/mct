#
# Mkcmdtlm is a utility for making COSMOS command and telemetry
# definition files for Core Flight System by parsing the CFS Doxygen
# documentation.
#
# Before use, remove the space in the "${CFS_ROOT}/cfe/doc/cFE UsersGuide"
# directory. ${CFS_ROOT} is assumed to be /home/${USERNAME}/cfs.
# Also, it is assumed that you are using all the open-source apps except SBN.
# If you're not, you will need to edit the "apps" list near the bottom.
# Your COSMOS project is assumed to be at /home/${USERNAME}/COSMOS/cfs,
# and your target is assumed to be named CFS.
# You will need a message ID database called msgids.txt in the directory
# where you run this script. It should come with the script.
# Then, simply run "ruby mkcmdtlm.rb" from wherever this script is, and the
# command and telemetry databases will be generated in your COSMOS target.
#
# Current issues:
# Can't build commands for CF app (dox is different)
# Need to document or otherwise parse CI and TO lab apps
# Need to implement checksums and packet data length for commands
# Would like to implement limits and formatting - maybe do this in screens, not here
#
# Author: Bryan Anderson
# NASA Goddard SFC / Embedded Flight Systems, Inc.




#Import gems that we need.
require 'rubygems' #So that gems are a thing
require 'nokogiri' #HTML parser
require 'dentaku' #Formula parser
require 'etc' #To get username




#This method writes the CCSDS header info to the file.
def ccsds(output, cmdtlm, parentname, msgid, cmdid)
  if cmdtlm == 0 #If this is telemetry
    thing = "ITEM"
    if parentname != nil #If this is a sub-packet
      ccsds1 = "  APPEND_" + thing + " " + parentname + "_CCSDS_STREAMID 16 UINT \"CCSDS Packet Identification\""
      ccsds2 = "  APPEND_" + thing + " " + parentname + "_CCSDS_SEQUENCE 16 UINT \"CCSDS Packet Sequence Control\""
      ccsds3 = "  APPEND_" + thing + " " + parentname + "_CCSDS_LENGTH 16 UINT \"CCSDS Packet Data Length\""
      ccsds4 = "  APPEND_" + thing + " " + parentname + "_CCSDS_TIME 48 UINT \"CCSDS Telemetry Secondary Header\""
      ccsds5 = nil;
    else #If this is an independent packet
      ccsds1 = "  APPEND_ID_" + thing + " CCSDS_STREAMID 16 UINT " + msgid + " \"CCSDS Packet Identification\""
      ccsds2 = "  APPEND_" + thing + " CCSDS_SEQUENCE 16 UINT \"CCSDS Packet Sequence Control\""
      ccsds3 = "  APPEND_" + thing + " CCSDS_LENGTH 16 UINT \"CCSDS Packet Data Length\""
      ccsds4 = "  APPEND_" + thing + " CCSDS_TIME 48 UINT \"CCSDS Telemetry Secondary Header\""
      ccsds5 = nil;
    end
  else #If this is a command
    thing = "PARAMETER"
    ccsds1 = "  APPEND_ID_" + thing + " CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 " + msgid + " \"CCSDS Packet Identification\""
    ccsds2 = "  APPEND_" + thing + " CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 \"CCSDS Packet Sequence Control\""
    ccsds3 = "  APPEND_" + thing + " CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 \"CCSDS Packet Data Length\""
    ccsds4 = "  APPEND_" + thing + " CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 " + cmdid + " \"CCSDS Command Function Code\""
    ccsds5 = "  APPEND_" + thing + " CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 \"CCSDS Command Checksum\""
  end

  output.write(ccsds1)
  output.write("\n")

  output.write(ccsds2)
  output.write("\n")

  output.write(ccsds3)
  output.write("\n")

  output.write(ccsds4)
  output.write("\n")

  if ccsds5 != nil
    output.write(ccsds5)
    output.write("\n")
  end
end




#This method gets the type of a telemetry item, and the corresponding max and min values
def getitemtype(itemtypestr)
  if itemtypestr == "uint8" || itemtypestr == "boolean" || itemtypestr == "char" || itemtypestr == "CFE_SB_PipeId_t"
    itemtype = "8 UINT"
    itemmin = "MIN_UINT8"
    itemmax = "MAX_UINT8"
    itemdef = 0
  elsif itemtypestr == "uint16" || itemtypestr == "CFE_SB_MsgId_t"
    itemtype = "16 UINT"
    itemmin = "MIN_UINT16"
    itemmax = "MAX_UINT16"
    itemdef = 0
  elsif itemtypestr == "uint32" || itemtypestr == "CFE_ES_MemHandle_t"
    itemtype = "32 UINT"
    itemmin = "MIN_UINT32"
    itemmax = "MAX_UINT32"
    itemdef = 0
  elsif itemtypestr == "uint64"
    itemtype = "64 UINT"
    itemmin = "MIN_UINT64"
    itemmax = "MAX_UINT64"
    itemdef = 0
  elsif itemtypestr == "int8"
    itemtype = "8 INT"
    itemmin = "MIN_INT8"
    itemmax = "MAX_INT8"
    itemdef = 0
  elsif itemtypestr == "int16" || itemtypestr == "CFE_TBL_Handle_t"
    itemtype = "16 INT"
    itemmin = "MIN_INT16"
    itemmax = "MAX_INT16"
    itemdef = 0
  elsif itemtypestr == "int32"
    itemtype = "32 INT"
    itemmin = "MIN_INT32"
    itemmax = "MAX_INT32"
    itemdef = 0
  elsif itemtypestr == "int64"
    itemtype = "64 INT"
    itemmin = "MIN_INT64"
    itemmax = "MAX_INT64"
    itemdef = 0
  elsif itemtypestr == "CFE_TBL_CallbackFuncPtr_t" || itemtypestr == "void *"
    itemtype = "32 UINT"
    itemmin = "MIN_UINT32"
    itemmax = "MAX_UINT32"
    itemdef = 0
    #THESE TYPES ARE POINTERS.
    #ON A 64 BIT SYSTEM THIS MAY NEED TO BE CHANGED TO "64 UINT"
  else
    itemtype = "TYPEDEF" #For aliased types - we'll handle them later
  end

  return itemtype, itemmin, itemmax, itemdef
end




#This method gets the array size when it is represented in documentation as a formula with variables
def getcomplexsize(defstring, path, cfepath)
  calc = Dentaku::Calculator.new
  dependencies = calc.dependencies(defstring) #Find the variable names
  for dependency in dependencies #Get a variable's value
    dependency = dependency.upcase
    thisdefstring = `grep -r "#define #{dependency}" #{cfepath} #{path}`.split("&nbsp;").last.split("   ").first
    if (thisdefstring.include? "(") || (thisdefstring.include? "/") || (thisdefstring.include? "*")
      thisdefint = getcomplexsize(thisdefstring, path, cfepath) #Do recursively if needed
    else
      thisdefint = thisdefstring.to_i
    end
    defstring.gsub! dependency, thisdefint.to_s
  end
  defint = calc.evaluate("roundup(" + defstring + ")")
  return defint
end




#This method processes a command parameter or telemetry item.
def declareitem(item, cmdtlm, parentname, parentinfo, outfile, path, cfepath)
  itemname = item.text.upcase

  if item.parent.parent.next_element != nil #Get item's description if it has one
    iteminfo = item.parent.parent.next_element.css('td.mdescRight').text.strip
  else #Or don't if it doesn't
    iteminfo = " "
  end
  
  iteminfo = iteminfo.gsub("\"", "'")

  itemtype, itemmin, itemmax, itemdef = getitemtype(item.parent.parent.css('td.memItemLeft').text.gsub(/\u00a0/, ' ').strip)

  arraychk = item.parent.text
  if arraychk.include? "[" #If the item is an array
    if parentname != nil #If the array is in a sub-packet
      itemname = parentname + "_" + itemname
      iteminfo = iteminfo + " (Parent: " + parentinfo + ")"
    end
    arraysize = item.parent.text.split(" ", 2)[1].split("[")[1].split("]")[0] #The (most likely variable) size of the array
    elemsize = itemtype.split(" ")[0] #The size of each element of the array

    if elemsize == "TYPEDEF" #If it's an array of defined types, find out the size per element
      typelink = item.parent.parent.css('td.memItemLeft a')
      typeurl = typelink.first['href']
      if typeurl.include? "../cfe/"
        typepage = Nokogiri::HTML(open(cfepath + typeurl.split("../cfe/")[1]))
      else
        typepage = Nokogiri::HTML(open(path + typeurl))
      end
      total = 0
      for childitem in typepage.css('td.memItemLeft') #For each sub-item
	if childitem.text.include? "CFE_SB_Qos_t"
	  type = 16
	  total += type
	else
          type = getitemtype(childitem.text.gsub(/\u00a0/, ' ').strip)[0].split(" ")[0]
	  total += type.to_i
	end
      end              
      elemsize = total
      itemtype = elemsize.to_s + " UINT"
    end

    if !(arraysize.include? "_") #If the array size isn't variable
      size = elemsize.to_i*arraysize.to_i
    elsif arraysize == "CF_MAX_TRANSID_CHARS"
      size = elemsize.to_i*20
    elsif arraysize == "CF_MAX_CFG_VALUE_CHARS"
      size = elemsize.to_i*16
    else #Find the value if the array size is variable
      if (arraysize.include? "(") || (arraysize.include? "/") || (arraysize.include? "*")
        defint = getcomplexsize(arraysize, path, cfepath)
      else
        defstring = `grep -r "#define #{arraysize}" #{cfepath} #{path}`.split("&nbsp;").last.split("   ").first
        if defstring[0] == "("
          defint = getcomplexsize(defstring, path, cfepath)
        else
          defint = defstring.to_i
        end
      end
      size = elemsize.to_i*defint #Finally calculate the total size
    end

    if cmdtlm == 0 #tlm
      thing = "ITEM"
    else #cmd
      thing = "PARAMETER"
    end

    itemdec = "  APPEND_ARRAY_" + thing + " " + itemname + " " + itemtype + " " + size.to_s + " \"" + iteminfo + "\""
    outfile.write(itemdec)
    outfile.write("\n")
  elsif itemname == "DWELLADDRESS"
    itemdec = "  APPEND_PARAMETER DWELLADDRESS_OFFSET 32 UINT MIN_UINT32 MAX_UINT32 0 \"Optional offset that is used as the absolute address if the SymName string is NUL (Parent: Dwell Address in CFS_SymAddr_t format. \""
    outfile.write(itemdec)
    outfile.write("\n")
    itemdec = "  APPEND_ARRAY_PARAMETER DWELLADDRESS_SYMNAME 8 UINT 512 \"Optional offset that is used as the absolute address if the SymName string is NUL (Parent: Dwell Address in CFS_SymAddr_t format. \""
    outfile.write(itemdec)
    outfile.write("\n")
  elsif itemtype == "TYPEDEF" #If item is of aliased type, find out what that means
    tdef = item.parent.parent.css('td.memItemLeft a')
    tdefurl = tdef.first['href']
    if tdefurl.include? "../cfe/"
      tdefpage = Nokogiri::HTML(open(cfepath + tdefurl.split("../cfe/")[1]))
    else
      tdefpage = Nokogiri::HTML(open(path + tdefurl))
    end
    for childitem in tdefpage.css('td.memItemRight a') #For each sub-item
      if (childitem.text.include? "TlmHeader") || (childitem.text.include? "Hdr") #If it's a header
        ccsds(outfile, 0, itemname, "SUBITEM", 0) 
      elsif (!childitem.text.include? "_") #If it's not
        declareitem(childitem, cmdtlm, itemname, iteminfo, outfile, path, cfepath)
      end
    end              
  else #If there's nothing weird about the item at all
    if parentname != nil #If it's a sub-item
      itemname = parentname + "_" + itemname
      iteminfo = iteminfo + " (Parent: " + parentinfo + ")"
    end
    if cmdtlm == 0 #tlm
      itemdec = "  APPEND_ITEM " + itemname + " " + itemtype + " \"" + iteminfo + "\""
    else #cmd
      itemdec = "  APPEND_PARAMETER " + itemname + " " + itemtype + " " + itemmin.to_s + " " + itemmax.to_s + " " + itemdef.to_s + " \"" + iteminfo + "\""
    end
    outfile.write(itemdec)
    outfile.write("\n")
  end
end





#This method makes all TLM packets for an app, or for the cFE core.
def mktlm(apphome, path, cfepath, msgids)
  for packet in apphome.css('a') #For each packet
    if (packet.text.include? "_t") && (packet.text != "FM_DirListEntry_t") && (packet.text != "FM_GlobalData_t") #Make sure it's a legit packet
      page = Nokogiri::HTML(open(path + packet['href']))

      title = page.css('h1').text
      pktname = title.split('_t')[0].upcase

      #Get message ID from list
      msgidindex =  msgids.index{|s| s.include?(pktname)}
      if msgidindex != nil #If the message has an ID
        msgid = msgids[msgidindex].split(" ").last
      else #Or not
        msgid = "TLM_NO_MSGID"
      end

      output = open("tlm/" + pktname + ".tlm", 'w')

      pktinfo = page.css('dd')[0].text.strip.gsub("\n", " ").gsub("\"", "'")

      pktdec = "TELEMETRY CFS " + pktname + " BIG_ENDIAN \"" + pktinfo + "\""
      output.write(pktdec)
      output.write("\n")

      for item in page.css('td.memItemRight a') #For each item in the packet
        if (item.text.include? "TlmHeader") || (item.text.include? "Hdr") #If it's a header
          ccsds(output, 0, nil, msgid, 0)
        elsif (!item.text.include? "_") #Otherwise, unless it's a linked size vairable
          declareitem(item, 0, nil, nil, output, path, cfepath)
        end
      end
      output.write("\n")
      output.close
    end
  end
end





#This method makes all CMD packets for a given app, or for the cFE core.
def mkcmds(apphome, path, cfepath, msgids)
  for cmd in apphome.css("td[class='memname']") #For all command packets
    cmdtext = cmd.text.split(" ")[1]
    if cmdtext.include? "_CC" #If it's a legit command packet
      cmdname = cmdtext.gsub(/\u00a0/, ' ').split(" ").first.split("_CC").first
      cmdcode = cmdtext.gsub(/\u00a0/, ' ').split(" ").last
      cmddetails = cmd.parent.parent.parent.parent.css("div[class='memdoc']")
      cmdinfo = cmddetails.css("dl")[1].css("dd").text.gsub("\n", " ").gsub("\"", "'")
      output = open("cmd/" + cmdname + ".cmd", 'w')

      #Get the message ID from list
      msgidindex =  msgids.index{|s| s.include?(cmdname)}
      if msgidindex != nil #If there is one, that is
        msgid = msgids[msgidindex].split(" ").last
	cmdid = msgids[msgidindex].split(" ")[1]
      else #Or if there's not, don't
        msgid = "CMD_NO_MSGID"
	msgid = "CMD_NO_CMDID"
      end

      if cmdname == "FM_DELETE_INT" #If it's that one weird command
        cmdlink = "struct_f_m___delete_file_cmd__t.html"
      else #If it's not
        cmdlink = cmddetails.css("dl")[3].css("a")[0]['href']
      end

      cmddec = "COMMAND CFS " + cmdname + " BIG_ENDIAN \"" + cmdinfo + "\""
      output.write(cmddec)
      output.write("\n")

      if cmdname != "FM_DELETE_INT" && cmddetails.css("dl")[3].css("a")[0].text == "CFE_SB_CmdHdr_t" #That one weird command again
        ccsds(output, 1, nil, msgid, cmdid)
      elsif cmdname == "SC_MANAGE_TABLE" #That other weird command
        ccsds(output, 1, nil, msgid, cmdid)
        output.write("  APPEND_PARAMETER PARAMETER 32 UINT MIN_UINT32 MAX_UINT32 0 \"Application specified command parameter. \"")
        output.write("\n")
      else #Normal commands
        cmdpage = Nokogiri::HTML(open(path + cmdlink))
  
        for item in cmdpage.css('td.memItemRight a') #For each parameter in a command packet
          if (item.text == "CmdHeader") || (item.text == "Hdr") || (item.text == "Pri") || (item.text == "Sec") || (item.text == "Header") #If it's a header
            ccsds(output, 1, nil, msgid, cmdid)
          elsif (!item.text.include? "_") #If it's not a header
            declareitem(item, 1, nil, nil, output, path, cfepath)
          end
        end
      end
      output.write("\n")
      output.close
    end
  end
end





#Main

#Basic path info.
user = Etc.getlogin
cfepath = "/home/" + user +"/cfs/cfe/docs/cFEUsersGuide/Doxygen/"
appspath = "/home/" + user + "/cfs/apps/"
cfeapps = ["es", "evs", "sb", "tbl", "time"]
apps = ["cf", "cs", "ds", "fm", "hk", "hs", "lc", "md", "mm", "sc", "sch"]
puts "Mktlm assumes CFS root is /home/YOUR_USERNAME/cfs" 
puts "You can alter the path manually in the code if you need to"

#Remove old .cmd and .tlm files
`rm cmd/*.cmd tlm/*.tlm`

#Get message ID database
msgids = IO.readlines("msgids.txt")

#Process cFE documentation (core apps).
path = cfepath
home = Nokogiri::HTML(open(cfepath + "index.html"))
for app in home.css('a')
  if (app.text.include? "Telemetry") && !(app.text.include? "Mnemonic")
    mktlm(Nokogiri::HTML(open(path + app['href'])), path, cfepath, msgids)
  end
end
for cfeapp in cfeapps
  mkcmds(Nokogiri::HTML(open(path + "cfe__" + cfeapp + "__msg_8h.html")), path, cfepath, msgids)
end  

#Process CFS app documentation.
for app in apps
  path = appspath + app + "/docs/users_guide/html/"
  mktlm(Nokogiri::HTML(open(path + "cfs" + app + "tlm.html")), path, cfepath, msgids)
  if app != "cf"
    mkcmds(Nokogiri::HTML(open(path + app + "__msgdefs_8h.html")), path, cfepath, msgids)
  end
end

#Combine all packets into one file for COSMOS to read.
`cat tlm/*.tlm > cfs_tlm.txt`
`cat cmd/*.cmd > cfs_cmd.txt`

#Move them to the proper folder, bring old ones here
system("mv /home/" + user + "/COSMOS/cfs/config/targets/CFS/cmd_tlm/cfs_cmd.txt ./old/")
system("mv /home/" + user + "/COSMOS/cfs/config/targets/CFS/cmd_tlm/cfs_tlm.txt ./old/")
system("mv cfs_* /home/" + user + "/COSMOS/cfs/config/targets/CFS/cmd_tlm/")
