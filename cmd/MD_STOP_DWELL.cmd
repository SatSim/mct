COMMAND CFS MD_STOP_DWELL BIG_ENDIAN "This command clears the Enabled flag(s) associated with the Dwell Table(s) that have been designated by the command's TableMask argument."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x18 "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 3 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER TABLEMASK 16 UINT MIN_UINT16 MAX_UINT16 0 "0x0001=TBL1 bit, 0x0002=TBL2 bit,0x0004=TBL3 bit,0x0008=TBL4 enable bit, etc."

