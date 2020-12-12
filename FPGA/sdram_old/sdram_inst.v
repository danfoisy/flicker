	sdram u0 (
		.clk_clk          (<connected-to-clk_clk>),          //   clk.clk
		.reset_reset_n    (<connected-to-reset_reset_n>),    // reset.reset_n
		.s1_address       (<connected-to-s1_address>),       //    s1.address
		.s1_byteenable_n  (<connected-to-s1_byteenable_n>),  //      .byteenable_n
		.s1_chipselect    (<connected-to-s1_chipselect>),    //      .chipselect
		.s1_writedata     (<connected-to-s1_writedata>),     //      .writedata
		.s1_read_n        (<connected-to-s1_read_n>),        //      .read_n
		.s1_write_n       (<connected-to-s1_write_n>),       //      .write_n
		.s1_readdata      (<connected-to-s1_readdata>),      //      .readdata
		.s1_readdatavalid (<connected-to-s1_readdatavalid>), //      .readdatavalid
		.s1_waitrequest   (<connected-to-s1_waitrequest>),   //      .waitrequest
		.wire_addr        (<connected-to-wire_addr>),        //  wire.addr
		.wire_ba          (<connected-to-wire_ba>),          //      .ba
		.wire_cas_n       (<connected-to-wire_cas_n>),       //      .cas_n
		.wire_cke         (<connected-to-wire_cke>),         //      .cke
		.wire_cs_n        (<connected-to-wire_cs_n>),        //      .cs_n
		.wire_dq          (<connected-to-wire_dq>),          //      .dq
		.wire_dqm         (<connected-to-wire_dqm>),         //      .dqm
		.wire_ras_n       (<connected-to-wire_ras_n>),       //      .ras_n
		.wire_we_n        (<connected-to-wire_we_n>)         //      .we_n
	);

