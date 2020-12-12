module TLC5955 (
		input						CLK,
		input 					nRESET,
		input						START,
		input [15:0]			DATA,
		input [4:0]				LEN,
		output reg 				SCLK,
		output reg	 		  	SDO,
		output reg				DONE
	);
	
	
	reg [1:0] m_state;
	reg [4:0] txLen;
	
	always_ff@(posedge CLK) begin: TLC5955_FSM
		if(!nRESET) begin
			m_state <= 2'b00;
			SCLK <= '0;
			DONE <= '0;
			SDO <= '0;
		end else begin
			case (m_state)
				2'b00:
					begin
						DONE <= '0;
						SCLK <= '0;
						if(START) begin
							txLen <= LEN - 5'd1;
							
							SDO <= 	(LEN == 16) ? DATA[15] :
										(LEN == 15) ? DATA[14] : 
										(LEN == 14) ? DATA[13] : 
										(LEN == 13) ? DATA[12] : 
										(LEN == 12) ? DATA[11] : 
										(LEN == 11) ? DATA[10] :
										(LEN == 10) ? DATA[9] :
										(LEN == 9) ? DATA[8] :
										(LEN == 8) ? DATA[7] : 
										(LEN == 7) ? DATA[6] : 
										(LEN == 6) ? DATA[5] : 
										(LEN == 5) ? DATA[4] : 
										(LEN == 4) ? DATA[3] : 
										(LEN == 3) ? DATA[2] : 
										(LEN == 2) ? DATA[1] : 
														 DATA[0];
							
							m_state <= 2'b01;
							
						end
					end
				2'b01:
					begin
						SCLK <= '1;
						
						txLen <= txLen - 1'b1;
						
						if(txLen == 5'd1)
							DONE <= '1;
							
						m_state <= 2'b10;
							
					end
				2'b10:
					begin
						SCLK <= '0;
						DONE <= '0;
						SDO <= 	(txLen == 14) ? DATA[14] : 
									(txLen == 13) ? DATA[13] : 
									(txLen == 12) ? DATA[12] : 
									(txLen == 11) ? DATA[11] : 
									(txLen == 10) ? DATA[10] :
									(txLen == 9) ? DATA[9] :
									(txLen == 8) ? DATA[8] :
									(txLen == 7) ? DATA[7] : 
									(txLen == 6) ? DATA[6] : 
									(txLen == 5) ? DATA[5] : 
									(txLen == 4) ? DATA[4] : 
									(txLen == 3) ? DATA[3] : 
									(txLen == 2) ? DATA[2] : 
									(txLen == 1) ? DATA[1] : 
														DATA[0];
						if(txLen == '0) begin
							m_state <= 2'b00;
							
						end else begin
							m_state <= 2'b01;
						end
					end
				default:
					m_state <= 2'b00;
			endcase
		end
	end
	

endmodule
