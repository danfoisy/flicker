
module FrameBuf_single (
	clk_clk,
	reset_reset,
	s1_address,
	s1_clken,
	s1_chipselect,
	s1_write,
	s1_readdata,
	s1_writedata,
	s1_byteenable);	

	input		clk_clk;
	input		reset_reset;
	input	[11:0]	s1_address;
	input		s1_clken;
	input		s1_chipselect;
	input		s1_write;
	output	[15:0]	s1_readdata;
	input	[15:0]	s1_writedata;
	input	[1:0]	s1_byteenable;
endmodule
