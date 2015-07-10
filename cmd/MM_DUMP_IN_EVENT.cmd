COMMAND CFS MM_DUMP_IN_EVENT BIG_ENDIAN "Dumps up to MM_MAX_DUMP_INEVENT_BYTES of memory in an event message"
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x1888 "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 7 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER MEMTYPE 8 UINT MIN_UINT8 MAX_UINT8 0 "Memory dump type."
  APPEND_PARAMETER NUMOFBYTES 8 UINT MIN_UINT8 MAX_UINT8 0 "Number of bytes to be dumped."
  APPEND_PARAMETER PADDING 16 UINT MIN_UINT16 MAX_UINT16 0 "Structure padding."
  APPEND_PARAMETER SRCSYMADDRESS_OFFSET 32 UINT MIN_UINT32 MAX_UINT32 0 "Optional offset that is used as the absolute address if the SymName string is NUL. (Parent: Symbolic source address.)"
  APPEND_ARRAY_PARAMETER SRCSYMADDRESS_SYMNAME 8 UINT 512 "Symbol name string. (Parent: Symbolic source address.)"

