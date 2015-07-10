require 'rubygems'
require 'nokogiri'
require 'etc'

filelist = `ls tlm`
filearray = filelist.split("\n")
outfile = open("msgids.txt", "w")
for file in filearray
  file = file.split(".tlm")[0]
  outfile.write(file + " 0x08\n")
end

#filelist = `ls cmd`
#filearray = filelist.split("\n")

user = Etc.getlogin
cfepath = "/home/" + user +"/cfs/cfe/docs/cFEUsersGuide/Doxygen/"
appspath = "/home/" + user + "/cfs/apps/"
cfeapps = ["es", "evs", "sb", "time", "tbl"]
apps = ["cf", "cs", "ds", "fm", "hk", "hs", "lc", "md", "mm", "sc", "sch"]

for cfeapp in cfeapps
  infile = Nokogiri::HTML(open(cfepath + "cfe__" + cfeapp + "__msg_8h-source.html"))
  commands = infile.css(".preprocessor")
  for command in commands
    if command.text.include?("_CC")
      cmdname = command.text.split(" ")[1].split("_CC").first
      cmdcode = command.text.split(" ").last
      case cfeapp
        when "es"
          suffix = "06"
        when "evs"
          suffix = "01"
        when "sb"
          suffix = "03"
        when "time"
          suffix = "05"
        when "tbl"
          suffix = "04"
      end
      outfile.write(cmdname + " " + cmdcode + " 0x18" + suffix + "\n")
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
      case app
        when "cf"
          suffix = "B3"
        when "cs"
          suffix = "9F"
        when "ds"
          suffix = "BB"
        when "fm"
          suffix = "8C"
        when "hk"
          suffix = "9A"
        when "hs"
          suffix = "AE"
        when "lc"
          suffix = "A4"
        when "md"
          suffix = "90"
        when "mm"
          suffix = "88"
        when "sc"
          suffix = "A9"
        when "sch"
          suffix = "95"
      end
      outfile.write(cmdname + " " + cmdcode + " 0x18" + suffix + "\n")
    end
  end
end

outfile.close

for file in filearray
  file = file.split(".cmd")[0]
  #outfile.write(file + " 0x08\n")
end
#outfile.close
