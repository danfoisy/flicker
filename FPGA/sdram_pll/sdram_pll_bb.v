
module sdram_pll (
	sdram_reset_reset_n,
	sdram_s1_address,
	sdram_s1_byteenable_n,
	sdram_s1_chipselect,
	sdram_s1_writedata,
	sdram_s1_read_n,
	sdram_s1_write_n,
	sdram_s1_readdata,
	sdram_s1_readdatavalid,
	sdram_s1_waitrequest,
	sdram_wire_addr,
	sdram_wire_ba,
	sdram_wire_cas_n,
	sdram_wire_cke,
	sdram_wire_cs_n,
	sdram_wire_dq,
	sdram_wire_dqm,
	sdram_wire_ras_n,
	sdram_wire_we_n,
	pll_inclk_clk,
	pll_reset_reset,
	pll_c1_clk,
	pll_sdram_clk);	

	input		sdram_reset_reset_n;
	input	[21:0]	sdram_s1_address;
	input	[1:0]	sdram_s1_byteenable_n;
	input		sdram_s1_chipselect;
	input	[15:0]	sdram_s1_writedata;
	input		sdram_s1_read_n;
	input		sdram_s1_write_n;
	output	[15:0]	sdram_s1_readdata;
	output		sdram_s1_readdatavalid;
	output		sdram_s1_waitrequest;
	output	[11:0]	sdram_wire_addr;
	output	[1:0]	sdram_wire_ba;
	output		sdram_wire_cas_n;
	output		sdram_wire_cke;
	output		sdram_wire_cs_n;
	inout	[15:0]	sdram_wire_dq;
	output	[1:0]	sdram_wire_dqm;
	output		sdram_wire_ras_n;
	output		sdram_wire_we_n;
	input		pll_inclk_clk;
	input		pll_reset_reset;
	output		pll_c1_clk;
	output		pll_sdram_clk;
endmodule
