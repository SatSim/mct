filelist = `ls tlm`
filearray = filelist.split("\n")
outfile = open("msgids.txt", "w")
for file in filearray
  file = file.split(".tlm")[0]
  outfile.write(file + " 0x08\n")
end

