COMMAND CFS SC_STOP_RTSGRP BIG_ENDIAN "The load state for an RTS may be LOADED or NOT LOADED. The enable state for an RTS may be ENABLED or DISABLED. The run state for an RTS may be STARTED or STOPPED. This command STOPS each RTS in the specified group that is currently STARTED."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x18A9 "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 14 "CCSDS Command Function Code"
  APPEND_PARAMETER FIRSTRTSID 16 UINT MIN_UINT16 MAX_UINT16 0 "ID of the first RTS to act on, 1 through SC_NUMBER_OF_RTS."
  APPEND_PARAMETER LASTRTSID 16 UINT MIN_UINT16 MAX_UINT16 0 "ID of the last RTS to act on, 1 through SC_NUMBER_OF_RTS."

