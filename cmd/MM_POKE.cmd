COMMAND CFS MM_POKE BIG_ENDIAN "Writes 8, 16, or 32 bits of data to any memory address"
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x1888 "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 3 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER DATASIZE 8 UINT MIN_UINT8 MAX_UINT8 0 "Size of the data to be written."
  APPEND_PARAMETER MEMTYPE 8 UINT MIN_UINT8 MAX_UINT8 0 "Memory type to poke data to."
  APPEND_ARRAY_PARAMETER PADDING 8 UINT 16 "Structure padding."
  APPEND_PARAMETER DATA 32 UINT MIN_UINT32 MAX_UINT32 0 "Data to be written."
  APPEND_PARAMETER DESTSYMADDRESS_OFFSET 32 UINT MIN_UINT32 MAX_UINT32 0 "Optional offset that is used as the absolute address if the SymName string is NUL. (Parent: Symbolic destination poke address.)"
  APPEND_ARRAY_PARAMETER DESTSYMADDRESS_SYMNAME 8 UINT 512 "Symbol name string. (Parent: Symbolic destination poke address.)"

