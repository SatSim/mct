COMMAND CFS LC_RESET_AP_STATS BIG_ENDIAN "Resets actionpoint statistics"
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x18A4 "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 5 "CCSDS Command Function Code"
  APPEND_PARAMETER APNUMBER 16 UINT MIN_UINT16 MAX_UINT16 0 "Which actionpoint(s) to change."
  APPEND_PARAMETER PADDING 16 UINT MIN_UINT16 MAX_UINT16 0 "Structure padding."

