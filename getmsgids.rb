require 'rubygems'
require 'nokogiri'
require 'etc'

filelist = `ls tlm`
filearray = filelist.split("\n")
outfile = open("msgids_tlm.txt", "w")
for file in filearray
  file = file.split(".tlm")[0]
  outfile.write(file + " 0x08\n")
end
outfile.close

#filelist = `ls cmd`
#filearray = filelist.split("\n")

user = Etc.getlogin
cfepath = "/home/" + user +"/cfs/cfe/docs/cFEUsersGuide/Doxygen/"
appspath = "/home/" + user + "/cfs/apps/"
cfeapps = ["es", "evs", "sb", "time", "tbl"]
apps = ["cf", "cs", "ds", "fm", "hk", "hs", "lc", "md", "mm", "sc", "sch"]
outfile = open("msgids_cmd.txt", "w")

for cfeapp in cfeapps
  infile = Nokogiri::HTML(open(cfepath + "cfe__" + cfeapp + "__msg_8h-source.html"))
  commands = infile.css(".preprocessor")
  for command in commands
    if command.text.include?("_CC")
      cmdname = command.text.split(" ")[1].split("_CC").first
      cmdcode = command.text.split(" ").last
      outfile.write(cmdname + " " + cmdcode + " 0x18\n")
    end
  end
end

for app in apps
  if app == "cf"
    infile = Nokogiri::HTML(open(appspath + app + "/docs/users_guide/html/" + app + "__msg_8h-source.html"))
  else
    infile = Nokogiri::HTML(open(appspath + app + "/docs/users_guide/html/" + app + "__msgdefs_8h-source.html"))
  end
  commands = infile.css(".preprocessor")
  for command in commands
    if command.text.include?("_CC")
      cmdname = command.text.split(" ")[1].split("_CC").first
      cmdcode = command.text.split(" ").last
      outfile.write(cmdname + " " + cmdcode + " 0x18\n")
    end
  end
end

outfile.close

for file in filearray
  file = file.split(".cmd")[0]
  #outfile.write(file + " 0x08\n")
end
#outfile.close
