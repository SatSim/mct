COMMAND CFS CFE_SB_DISABLE_ROUTE BIG_ENDIAN "This command will disable a particular destination. The destination is specified in terms of MsgID and PipeID. The MsgId and PipeID are parmaters in the command. All destinations are enabled by default."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x1803 "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 5 "CCSDS Command Function Code"
  APPEND_PARAMETER MSGID 16 UINT MIN_UINT16 MAX_UINT16 0 "Message ID of route to be enabled or disabled CFE_SB_MsgId_t."
  APPEND_PARAMETER PIPE 8 UINT MIN_UINT8 MAX_UINT8 0 "Pipe ID of route to be enabled or disabled CFE_SB_PipeId_t."
  APPEND_PARAMETER SPARE 8 UINT MIN_UINT8 MAX_UINT8 0 "Spare byte to make command even number of bytes."

