module TLC5955 (
		input						CLK,
		input 					nRESET,
		input						START,
		input [15:0]			DATA,
		input [4:0]				LEN,
		output reg 				SCLK,
		output logic 		  	SDO,
		output reg				DONE
	);
	
	
	reg [1:0] m_state;
	reg [4:0] txLen;
	reg [15:0] data;
	
	always_comb SDO = (txLen == 16) ? data[15] :
							(txLen == 15) ? data[14] : 
							(txLen == 14) ? data[13] : 
							(txLen == 13) ? data[12] : 
							(txLen == 12) ? data[11] : 
							(txLen == 11) ? data[10] :
							(txLen == 10) ? data[9] :
							(txLen == 9) ? data[8] :
							(txLen == 8) ? data[7] : 
							(txLen == 7) ? data[6] : 
							(txLen == 6) ? data[5] : 
							(txLen == 5) ? data[4] : 
							(txLen == 4) ? data[3] : 
							(txLen == 3) ? data[2] : 
							(txLen == 2) ? data[1] : 
											 data[0];
	
	always_ff@(posedge CLK) begin: TLC5955_FSM
		if(!nRESET) begin
			m_state <= 2'b00;
			SCLK <= '0;
			DONE <= '0;

		end else begin
			case (m_state)
				2'b00:
					begin
						DONE <= '0;
						SCLK <= '0;
						if(START) begin
							m_state <= 2'b01;
							txLen <= LEN;
							data <= DATA;
							
							if(LEN == 5'd1)
								DONE <= '1;
						end
					end
				2'b01:
					begin
						SCLK <= '1;
						DONE <= '0;
						
						if(txLen == 5'd1) begin
							m_state <= 2'b00;
						
						end else begin
							m_state <= 2'b10;
						end
							
					end
				2'b10:
					begin
						SCLK <= '0;
						DONE <= '0;
						txLen <= txLen - 1'b1;
						
						if(txLen == 5'd2)
							DONE <= '1;
							
						m_state <= 2'b01;
						
					end
				default:
					m_state <= 2'b00;
			endcase
		end
	end
	

endmodule
