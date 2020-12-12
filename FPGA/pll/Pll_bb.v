
module Pll (
	clk_in_clk,
	clk_rst_reset,
	gsclk_clk,
	sclk_x2_clk,
	sdram_clk_clk);	

	input		clk_in_clk;
	input		clk_rst_reset;
	output		gsclk_clk;
	output		sclk_x2_clk;
	output		sdram_clk_clk;
endmodule
