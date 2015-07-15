COMMAND CFS DS_SET_FILTER_TYPE BIG_ENDIAN "This command will modify the Filter Type selection for the indicated entry in the Packet Filter Table."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x18BB "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 4 "CCSDS Command Function Code"
  APPEND_PARAMETER MESSAGEID 16 UINT MIN_UINT16 MAX_UINT16 0 "Message ID of existing entry in Packet Filter Table."
  APPEND_PARAMETER FILTERPARMSINDEX 16 UINT MIN_UINT16 MAX_UINT16 0 "Index into Filter Parms Array."
  APPEND_PARAMETER FILTERTYPE 16 UINT MIN_UINT16 MAX_UINT16 0 "Filter type (packet count or time)."

