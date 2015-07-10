COMMAND CFS DS_SET_DEST_STATE BIG_ENDIAN "This command will modify the Ena/Dis State selection for the indicated entry in the Destination File Table."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x18 "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 7 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER FILETABLEINDEX 16 UINT MIN_UINT16 MAX_UINT16 0 "Index into Destination File Table."
  APPEND_PARAMETER ENABLESTATE 16 UINT MIN_UINT16 MAX_UINT16 0 "File enable/disable state."

