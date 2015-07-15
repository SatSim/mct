COMMAND CFS CFE_ES_RESTART BIG_ENDIAN "This command restarts the cFE in one of two modes. The Power-On Reset will cause the cFE to restart as though the power were first applied to the processor. The Processor Reset will attempt to retain the contents of the volatile disk and the contents of the Critical Data Store. NOTE: If a requested Processor Reset should cause the Processor Reset Counter ($sc_$cpu_ES_ProcResetCnt) to exceed OR EQUAL the limit CFE_ES_MAX_PROCESSOR_RESETS (which is reported in housekeeping telemetry as $sc_$cpu_ES_MaxProcResets), the command is AUTOMATICALLY upgraded to a Power-On Reset."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x1806 "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 2 "CCSDS Command Function Code"
  APPEND_PARAMETER RESTARTTYPE 16 UINT MIN_UINT16 MAX_UINT16 0 "CFE_ES_PROCESSOR_RESET=Processor Reset or CFE_ES_POWERON_RESET=Power-On Reset"

