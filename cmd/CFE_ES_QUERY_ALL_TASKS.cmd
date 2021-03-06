COMMAND CFS CFE_ES_QUERY_ALL_TASKS BIG_ENDIAN "This command takes the information kept by Executive Services on all of the registered tasks and writes it to the specified file."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x1806 "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 24 "CCSDS Command Function Code"
  APPEND_PARAMETER QUERYALLFILENAME 512 STRING "default" "ASCII text string containing full path and filename of file in which Application data is to be dumped."

