	FrameBuf u0 (
		.mem_clk1_clk      (<connected-to-mem_clk1_clk>),      // mem_clk1.clk
		.mem_clk2_clk      (<connected-to-mem_clk2_clk>),      // mem_clk2.clk
		.mem_rst1_reset    (<connected-to-mem_rst1_reset>),    // mem_rst1.reset
		.mem_rst2_reset    (<connected-to-mem_rst2_reset>),    // mem_rst2.reset
		.mem_s1_address    (<connected-to-mem_s1_address>),    //   mem_s1.address
		.mem_s1_clken      (<connected-to-mem_s1_clken>),      //         .clken
		.mem_s1_chipselect (<connected-to-mem_s1_chipselect>), //         .chipselect
		.mem_s1_write      (<connected-to-mem_s1_write>),      //         .write
		.mem_s1_readdata   (<connected-to-mem_s1_readdata>),   //         .readdata
		.mem_s1_writedata  (<connected-to-mem_s1_writedata>),  //         .writedata
		.mem_s1_byteenable (<connected-to-mem_s1_byteenable>), //         .byteenable
		.mem_s2_address    (<connected-to-mem_s2_address>),    //   mem_s2.address
		.mem_s2_chipselect (<connected-to-mem_s2_chipselect>), //         .chipselect
		.mem_s2_clken      (<connected-to-mem_s2_clken>),      //         .clken
		.mem_s2_write      (<connected-to-mem_s2_write>),      //         .write
		.mem_s2_readdata   (<connected-to-mem_s2_readdata>),   //         .readdata
		.mem_s2_writedata  (<connected-to-mem_s2_writedata>),  //         .writedata
		.mem_s2_byteenable (<connected-to-mem_s2_byteenable>)  //         .byteenable
	);

