COMMAND CFS FM_RENAME BIG_ENDIAN "This command renames the source file to the target file. Source must be an existing file and target must not exist. Source and target must both be on the same file system. The rename command does not actually move any file data. The command modifies the file system directory structure to create a different file entry for the same file data. If the user wishes to rename a file across file systems, he must first copy the file and then delete the original."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 CMD_ERROR "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_ARRAY_PARAMETER SOURCE 8 UINT 512 "Source filename."
  APPEND_ARRAY_PARAMETER TARGET 8 UINT 512 "Target filename."

