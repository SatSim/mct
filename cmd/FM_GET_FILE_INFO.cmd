COMMAND CFS FM_GET_FILE_INFO BIG_ENDIAN "This command creates an FM file information telemetry packet for the source file. The file information packet includes status that indicates whether source is a file that is open or closed, a directory, or does not exist. The file information data also includes a CRC, file size, last modify time and the source name. Because of the possibility that this command might take a very long time to complete, command argument validation will be done immediately but collecting the status data and calculating the CRC will be performed by a lower priority child task. As such, the return value for this function only refers to the result of command argument verification and being able to place the command on the child task interface queue."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x188C "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 10 "CCSDS Command Function Code"
  APPEND_PARAMETER FILENAME 512 STRING "default" "Filename."
  APPEND_PARAMETER FILEINFOCRC 32 UINT MIN_UINT32 MAX_UINT32 0 "File info CRC method."

