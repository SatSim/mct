COMMAND CFS FM_COPY BIG_ENDIAN "This command copies the source file to the target file. The source must be an existing file and the target must not be a directory name. If the Overwrite command argument is TRUE, then the target may be an existing file, provided that the file is closed. If the Overwrite command argument is FALSE, then the target must not exist. The source and target may be on different file systems. Because of the possibility that this command might take a very long time to complete, command argument validation will be done immediately but copying the file will be performed by a lower priority child task. As such, the command result for this function only refers to the result of command argument verification and being able to place the command on the child task interface queue."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x188C "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 2 "CCSDS Command Function Code"
  APPEND_PARAMETER OVERWRITE 16 UINT MIN_UINT16 MAX_UINT16 0 "Allow overwrite."
  APPEND_PARAMETER SOURCE 512 STRING "default" "Source filename."
  APPEND_PARAMETER TARGET 512 STRING "default" "Target filename."

