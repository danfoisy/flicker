`timescale 1 ps / 1 ps
module LedCtrl_tb (

		output   reg	clk,
		
		output cmdDone,
		output busy,
		output [3:0] SDOs,
		output LAT,
		output SCLK
	);

	reg nReset;
	initial #0 begin

    	clk=0;
		nReset=1;
    #30 nReset=0;
	#50 nReset=1;
  	end

  	always begin
    	#10 clk=!clk;
  	end

	reg cmdStart;
	
	initial #0 begin
		cmdStart = '0;
		#100 cmdStart='1;
		#120 cmdStart='0;
	end
	
	logic [15:0] ledColBuf;
	logic [6:0] rdaddress;
	
	assign ledColBuf = rdaddress;
	
	
	LedCtrl ledCtrl
	(
		.spiClk(clk),
		.nReset(nReset),
		
		.cmdStart,
		
		.ledColBuf,
		.rdaddress,

		.cmdDone,
		.busy,
		.SDOs,
		.LAT,
		.SCLK
	);
	
endmodule
