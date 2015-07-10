COMMAND CFS FM_GET_DIR_FILE BIG_ENDIAN "This command writes a listing of the contents of the source directory to the target file. If the target filename buffer is empty, then the default target filename FM_DIR_LIST_FILE_DEFNAME is used. The command will overwrite a previous copy of the target file, if one exists. Because of the possibility that this command might take a very long time to complete, command argument validation will be done immediately but reading the directory will be performed by a lower priority child task. As such, the return value for this function only refers to the result of command argument verification and being able to place the command on the child task interface queue."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x188C "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 14 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_ARRAY_PARAMETER DIRECTORY 8 UINT 512 "Directory name."
  APPEND_ARRAY_PARAMETER FILENAME 8 UINT 512 "Filename."

