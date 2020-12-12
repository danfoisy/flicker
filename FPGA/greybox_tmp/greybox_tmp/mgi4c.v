//lpm_shiftreg CBX_SINGLE_OUTPUT_FILE="ON" LPM_DIRECTION="RIGHT" LPM_TYPE="LPM_SHIFTREG" LPM_WIDTH=48 clock data load shiftout sset
//VERSION_BEGIN 18.1 cbx_mgl 2019:04:11:16:07:46:SJ cbx_stratixii 2019:04:11:16:04:12:SJ cbx_util_mgl 2019:04:11:16:04:12:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463



// Copyright (C) 2019  Intel Corporation. All rights reserved.
//  Your use of Intel Corporation's design tools, logic functions 
//  and other software and tools, and any partner logic 
//  functions, and any output files from any of the foregoing 
//  (including device programming or simulation files), and any 
//  associated documentation or information are expressly subject 
//  to the terms and conditions of the Intel Program License 
//  Subscription Agreement, the Intel Quartus Prime License Agreement,
//  the Intel FPGA IP License Agreement, or other applicable license
//  agreement, including, without limitation, that your use is for
//  the sole purpose of programming logic devices manufactured by
//  Intel and sold by Intel or its authorized distributors.  Please
//  refer to the applicable agreement for further details, at
//  https://fpgasoftware.intel.com/eula.



//synthesis_resources = lpm_shiftreg 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  mgi4c
	( 
	clock,
	data,
	load,
	shiftout,
	sset) /* synthesis synthesis_clearbox=1 */;
	input   clock;
	input   [47:0]  data;
	input   load;
	output   shiftout;
	input   sset;

	wire  wire_mgl_prim1_shiftout;

	lpm_shiftreg   mgl_prim1
	( 
	.clock(clock),
	.data(data),
	.load(load),
	.shiftout(wire_mgl_prim1_shiftout),
	.sset(sset));
	defparam
		mgl_prim1.lpm_direction = "RIGHT",
		mgl_prim1.lpm_type = "LPM_SHIFTREG",
		mgl_prim1.lpm_width = 48;
	assign
		shiftout = wire_mgl_prim1_shiftout;
endmodule //mgi4c
//VALID FILE
