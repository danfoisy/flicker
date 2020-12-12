module top (

		output   			LAT,
		output  			SCLK,
		output 		  		SDO
		
	);

	reg nReset;
	reg spiClk;

	initial #0 begin
    		spiClk=0;
			nReset=1;
    		#30 nReset=0;
			#50 nReset=1;
  	end

  	always begin
    		#10 spiClk=!spiClk;
  	end

	LED led(
		.spiClk(spiClk),
		.nReset(nReset),
		.LAT(LAT),
		.SDO(SDO),
		.SCLK(SCLK)
	);
	
endmodule
