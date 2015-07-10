COMMAND CFS CFE_ES_OVERWRITE_SYSLOG BIG_ENDIAN "This command allows the user to configure the Executive Services to either discard new System Log messages when it is full or to overwrite the oldest messages."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x18 "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 18 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER MODE 32 UINT MIN_UINT32 MAX_UINT32 0 "CFE_ES_LOG_DISCARD=Throw away most recent messages, CFE_ES_LOG_OVERWRITE=Overwrite oldest with most recent"

