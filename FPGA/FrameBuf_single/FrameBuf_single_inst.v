	FrameBuf_single u0 (
		.clk_clk       (<connected-to-clk_clk>),       //   clk.clk
		.reset_reset   (<connected-to-reset_reset>),   // reset.reset
		.s1_address    (<connected-to-s1_address>),    //    s1.address
		.s1_clken      (<connected-to-s1_clken>),      //      .clken
		.s1_chipselect (<connected-to-s1_chipselect>), //      .chipselect
		.s1_write      (<connected-to-s1_write>),      //      .write
		.s1_readdata   (<connected-to-s1_readdata>),   //      .readdata
		.s1_writedata  (<connected-to-s1_writedata>),  //      .writedata
		.s1_byteenable (<connected-to-s1_byteenable>)  //      .byteenable
	);

