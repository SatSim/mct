COMMAND CFS DS_RESET BIG_ENDIAN "This command will set the following housekeeping counters to zero: Command Execution Counter ($sc_$cpu_DS_CMDPC)Command Error Counter ($sc_$cpu_DS_CMDEC)Ignored Packet Counter ($sc_$cpu_DS_IgnoredPktCnt)Filtered Packet Counter ($sc_$cpu_DS_FilteredPktCnt)Passed Packet Counter ($sc_$cpu_DS_PassedPktCnt)File Access Counter ($sc_$cpu_DS_FileWriteCnt)File Access Error Counter ($sc_$cpu_DS_FileWriteErrCnt)Destination Table Load Counter ($sc_$cpu_DS_DestLoadCnt)Filter Table Load Counter ($sc_$cpu_DS_FilterLoadCnt)Destination Table Ptr Error Counter ($sc_$cpu_DS_DestPtrErrCnt)Filter Table Ptr Error Counter ($sc_$cpu_DS_FilterPtrErrCnt) "
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x18BB "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 1 "CCSDS Command Function Code"

