COMMAND CFS DS_SET_DEST_COUNT BIG_ENDIAN "This command will modify the sequence count value for the indicated entry in the Destination File Table."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x18BB "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 13 "CCSDS Command Function Code"
  APPEND_PARAMETER FILETABLEINDEX 32 UINT MIN_UINT32 MAX_UINT32 0 "Index into Destination File Table."
  APPEND_PARAMETER SEQUENCECOUNT 32 UINT MIN_UINT32 MAX_UINT32 0 "Sequence count portion of filename."

