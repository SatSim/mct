COMMAND CFS FM_MOVE BIG_ENDIAN "This command moves the source file to the target file. The source must be an existing file and the target must not be a directory name. If the Overwrite command argument is TRUE, then the target may be an existing file, provided that the file is closed. If the Overwrite command argument is FALSE, then the target must not exist. Source and target must both be on the same file system. The move command does not actually move any file data. The command modifies the file system directory structure to create a different file entry for the same file data. If the user wishes to move a file across file systems, he must first copy the file and then delete the original."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x188C "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 3 "CCSDS Command Function Code"
  APPEND_PARAMETER OVERWRITE 16 UINT MIN_UINT16 MAX_UINT16 0 "Allow overwrite."
  APPEND_PARAMETER SOURCE 512 STRING "default" "Source filename."
  APPEND_PARAMETER TARGET 512 STRING "default" "Target filename."

