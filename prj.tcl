project_new timer -overwrite
project_new timer -overwrite

set_global_assignment -name FAMILY MAX10
set_global_assignment -name DEVICE 10M50DAF484C7G 

set_global_assignment -name BDF_FILE timer.bdf
set_global_assignment -name VERILOG_FILE counter.v
set_global_assignment -name SDC_FILE timer.sdc

set_global_assignment -name TOP_LEVEL_ENTITY timer
set_location_assignment -to clk PIN_AH10

set_location_assignment PIN_C10 -to rst;

set_location_assignment PIN_A8 -to seconds[0];
set_location_assignment PIN_A9 -to seconds[1];
set_location_assignment PIN_A10 -to seconds[2];
set_location_assignment PIN_B10 -to seconds[3];
set_location_assignment PIN_D13 -to seconds[4];
set_location_assignment PIN_C13 -to seconds[5];
set_location_assignment PIN_E14 -to seconds[6];
set_location_assignment PIN_D14 -to seconds[7];
set_location_assignment PIN_A11 -to seconds[8];
set_location_assignment PIN_B11 -to seconds[9];

set_location_assignment PIN_P11  -to clk;

load_package flow
execute_flow -compile

project_close
