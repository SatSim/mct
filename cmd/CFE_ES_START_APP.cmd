COMMAND CFS CFE_ES_START_APP BIG_ENDIAN "This command starts the specified application with the specified start address, stack size, etc options."
  APPEND_ID_PARAMETER CCSDS_STREAMID 16 UINT MIN_UINT16 MAX_UINT16 0x1806 "CCSDS Packet Identification" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_SEQUENCE 16 UINT MIN_UINT16 MAX_UINT16 0xC000 "CCSDS Packet Sequence Control" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_LENGTH 16 UINT MIN_UINT16 MAX_UINT16 1 "CCSDS Packet Data Length" BIG_ENDIAN
  APPEND_PARAMETER CCSDS_CHECKSUM 8 UINT MIN_UINT8 MAX_UINT8 0 "CCSDS Command Checksum"
  APPEND_PARAMETER CCSDS_FC 8 UINT MIN_UINT8 MAX_UINT8 4 "CCSDS Command Function Code"
  APPEND_PARAMETER APPLICATION 160 STRING "default" "Name of Application to be started."
  APPEND_PARAMETER APPENTRYPOINT 160 STRING "default" "Symbolic name of Application's entry point."
  APPEND_PARAMETER APPFILENAME 512 STRING "default" "Full path and filename of Application's executable image."
  APPEND_PARAMETER STACKSIZE 32 UINT MIN_UINT32 MAX_UINT32 0 "Desired stack size for the new application."
  APPEND_PARAMETER EXCEPTIONACTION 16 UINT MIN_UINT16 MAX_UINT16 0 "CFE_ES_APP_EXCEPTION_RESTART_APP=On exception, restart Application, CFE_ES_APP_EXCEPTION_PROC_RESTART=On exception, perform a Processor Reset"
  APPEND_PARAMETER PRIORITY 16 UINT MIN_UINT16 MAX_UINT16 0 "The new Applications runtime priority."

