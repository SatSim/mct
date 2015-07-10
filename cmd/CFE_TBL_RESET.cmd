COMMAND CFS CFE_TBL_RESET BIG_ENDIAN "This command resets the following counters within the Table Services housekeeping telemetry: Command Execution Counter ($sc_$cpu_TBL_CMDPC)Command Error Counter ($sc_$cpu_TBL_CMDEC)Successful Table Validations Counter ($sc_$cpu_TBL_ValSuccessCtr)Failed Table Validations Counter ($sc_$cpu_TBL_ValFailedCtr)Number of Table Validations Requested ($sc_$cpu_TBL_ValReqCtr) "
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x1804 "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 1 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"

