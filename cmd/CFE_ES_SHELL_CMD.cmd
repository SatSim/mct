COMMAND CFS CFE_ES_SHELL_CMD BIG_ENDIAN "This command passes an ASCII string as a command line to the underlying realtime operating system shell. Any response to the command is both written to the shell command output file and sent as a series of shell command output telemetry packets."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 CMD_ERROR "CCSDS Packet Identification"
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control"
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 0 "CCSDS Packet Data Length"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Function Code"
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_ARRAY_PARAMETER CMDSTRING 8 UINT 512 "ASCII text string containing shell command to be executed."
  APPEND_ARRAY_PARAMETER OUTPUTFILENAME 8 UINT 512 "Filename where shell command output is to be written."

