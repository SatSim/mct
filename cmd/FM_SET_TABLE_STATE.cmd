COMMAND CFS FM_SET_TABLE_STATE BIG_ENDIAN "This command enables or disables a single entry in the FM file system free space table. Only table entries that are currently enabled or disabled may be modified by command. Unused table entries cannot be modified."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x18 "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 17 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER TABLEENTRYINDEX 32 UINT MIN_UINT32 MAX_UINT32 0 "Table entry index."
  APPEND_PARAMETER TABLEENTRYSTATE 32 UINT MIN_UINT32 MAX_UINT32 0 "New table entry state."

