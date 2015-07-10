COMMAND CFS FM_RESET BIG_ENDIAN "This command resets the following housekeeping telemetry: Command success counter /FM_CMDPCCommand error counter /FM_CMDECCommand warning counter /FM_WarnCtrChild cmd success counter /FM_ChildCMDPCChild cmd error counter /FM_ChildCMDECChild cmd warning counter /FM_ChildWarnCtr "
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x188C "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 1 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"

