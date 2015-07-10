COMMAND CFS CFE_TIME_SET_TIME BIG_ENDIAN "This command sets the spacecraft clock to a new value, regardless of the current setting (time jam). The new time value represents the desired offset from the mission-defined time epoch and takes effect immediately upon execution of this command. Time Service will calculate a new STCF value based on the current MET and the desired new time using one of the following:    If Time Service is configured to compute current time as TAI   STCF = (new time) - (current MET)  (current time) = (current MET) + STCF    If Time Service is configured to compute current time as UTC STCF = ((new time) - (current MET)) + (Leap Seconds)  (current time) = ((curent MET) + STCF) - (Leap Seconds)  "
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 CMD_ERROR "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER SECONDS 32 UINT MIN_UINT32 MAX_UINT32 0 ""
  APPEND_PARAMETER MICROSECONDS 32 UINT MIN_UINT32 MAX_UINT32 0 " "

