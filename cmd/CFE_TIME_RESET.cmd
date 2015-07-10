COMMAND CFS CFE_TIME_RESET BIG_ENDIAN "This command resets the following counters within the Time Services Housekeeping Telemetry : Command Execution Counter ($sc_$cpu_TIME_CMDPC)Command Error Counter ($sc_$cpu_TIME_CMDEC) This command also resets the following counters within the Time Services Diagnostic Telemetry :Tone Signal Detected Software Bus Message Counter ($sc_$cpu_TIME_DTSDetCNT)Time at the Tone Data Software Bus Message Counter ($sc_$cpu_TIME_DTatTCNT)Tone Signal/Data Verify Counter ($sc_$cpu_TIME_DVerifyCNT)Tone Signal/Data Error Counter ($sc_$cpu_TIME_DVerifyER)Tone Signal Interrupt Counter ($sc_$cpu_TIME_DTsISRCNT)Tone Signal Interrupt Error Counter ($sc_$cpu_TIME_DTsISRERR)Tone Signal Task Counter ($sc_$cpu_TIME_DTsTaskCNT)Local 1 Hz Interrupt Counter ($sc_$cpu_TIME_D1HzISRCNT)Local 1 Hz Task Counter ($sc_$cpu_TIME_D1HzTaskCNT)Reference Time Version Counter ($sc_$cpu_TIME_DVersionCNT) "
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 CMD_ERROR "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"

