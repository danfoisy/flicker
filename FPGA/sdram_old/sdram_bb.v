
module sdram (
	clk_clk,
	reset_reset_n,
	s1_address,
	s1_byteenable_n,
	s1_chipselect,
	s1_writedata,
	s1_read_n,
	s1_write_n,
	s1_readdata,
	s1_readdatavalid,
	s1_waitrequest,
	wire_addr,
	wire_ba,
	wire_cas_n,
	wire_cke,
	wire_cs_n,
	wire_dq,
	wire_dqm,
	wire_ras_n,
	wire_we_n);	

	input		clk_clk;
	input		reset_reset_n;
	input	[21:0]	s1_address;
	input	[1:0]	s1_byteenable_n;
	input		s1_chipselect;
	input	[15:0]	s1_writedata;
	input		s1_read_n;
	input		s1_write_n;
	output	[15:0]	s1_readdata;
	output		s1_readdatavalid;
	output		s1_waitrequest;
	output	[11:0]	wire_addr;
	output	[1:0]	wire_ba;
	output		wire_cas_n;
	output		wire_cke;
	output		wire_cs_n;
	inout	[15:0]	wire_dq;
	output	[1:0]	wire_dqm;
	output		wire_ras_n;
	output		wire_we_n;
endmodule
