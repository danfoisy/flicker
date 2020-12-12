	sdram_pll u0 (
		.sdram_reset_reset_n    (<connected-to-sdram_reset_reset_n>),    // sdram_reset.reset_n
		.sdram_s1_address       (<connected-to-sdram_s1_address>),       //    sdram_s1.address
		.sdram_s1_byteenable_n  (<connected-to-sdram_s1_byteenable_n>),  //            .byteenable_n
		.sdram_s1_chipselect    (<connected-to-sdram_s1_chipselect>),    //            .chipselect
		.sdram_s1_writedata     (<connected-to-sdram_s1_writedata>),     //            .writedata
		.sdram_s1_read_n        (<connected-to-sdram_s1_read_n>),        //            .read_n
		.sdram_s1_write_n       (<connected-to-sdram_s1_write_n>),       //            .write_n
		.sdram_s1_readdata      (<connected-to-sdram_s1_readdata>),      //            .readdata
		.sdram_s1_readdatavalid (<connected-to-sdram_s1_readdatavalid>), //            .readdatavalid
		.sdram_s1_waitrequest   (<connected-to-sdram_s1_waitrequest>),   //            .waitrequest
		.sdram_wire_addr        (<connected-to-sdram_wire_addr>),        //  sdram_wire.addr
		.sdram_wire_ba          (<connected-to-sdram_wire_ba>),          //            .ba
		.sdram_wire_cas_n       (<connected-to-sdram_wire_cas_n>),       //            .cas_n
		.sdram_wire_cke         (<connected-to-sdram_wire_cke>),         //            .cke
		.sdram_wire_cs_n        (<connected-to-sdram_wire_cs_n>),        //            .cs_n
		.sdram_wire_dq          (<connected-to-sdram_wire_dq>),          //            .dq
		.sdram_wire_dqm         (<connected-to-sdram_wire_dqm>),         //            .dqm
		.sdram_wire_ras_n       (<connected-to-sdram_wire_ras_n>),       //            .ras_n
		.sdram_wire_we_n        (<connected-to-sdram_wire_we_n>),        //            .we_n
		.pll_inclk_clk          (<connected-to-pll_inclk_clk>),          //   pll_inclk.clk
		.pll_reset_reset        (<connected-to-pll_reset_reset>),        //   pll_reset.reset
		.pll_c1_clk             (<connected-to-pll_c1_clk>),             //      pll_c1.clk
		.pll_sdram_clk          (<connected-to-pll_sdram_clk>)           //   pll_sdram.clk
	);

