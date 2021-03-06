COMMAND CFS FM_CONCAT BIG_ENDIAN "This command concatenates two source files into the target file. Sources must both be existing files and target must not exist. Sources and target may be on different file systems. Because of the possibility that this command might take a very long time to complete, command argument validation will be done immediately but copying the first source file to the target file and then appending the second source file to the target file will be performed by a lower priority child task. As such, the return value for this function only refers to the result of command argument verification and being able to place the command on the child task interface queue."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x188C "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 9 "CCSDS Command Function Code"
  APPEND_PARAMETER SOURCE1 512 STRING "default" "Source 1 filename."
  APPEND_PARAMETER SOURCE2 512 STRING "default" "Source 2 filename."
  APPEND_PARAMETER TARGET 512 STRING "default" "Target filename."

