COMMAND CFS SC_MANAGE_TABLE BIG_ENDIAN "This command signals a need for the host application (SC) to allow cFE Table Services to manage the specified table. For loadable tables, this command indicates that a table update is available. For dump only tables, this command indicates that cFE Table Services wants to dump the table data. In either case, the host application must call the table manage API function so that the pending function can be executed within the context of the host."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 CMD_ERROR "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER PARAMETER 32 UINT MIN_UINT32 MAX_UINT32 0 "Application specified command parameter. "

