`timescale 1 ps / 1 ps
module InitLed_tb (

		output   reg	clk,
		
		output LAT,
		output SDOsingle,
		output SCLK,
		output initDone
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

	
	InitLed initLed(
		.spiClk(clk),
		.nReset,
		
		.LAT,
		.SDOsingle,
		.SCLK,
		
		.initDone
	);
	
endmodule

