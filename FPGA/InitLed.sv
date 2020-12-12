 module InitLed #(parameter NUM_TLC5955=1)(
		input spiClk,
		input nReset,
		
		output reg LAT,
		output SDOsingle,
		output SCLK,
		
		output reg initDone
	);
	
	reg start;
	reg [4:0] len;
	reg [15:0] data;
	logic done;
	
	TLC5955 tlc5955(
		.CLK(spiClk),
		.nRESET(nReset),
		.START(start),
		.DATA(data),
		.LEN(len),
		.SCLK,
		.SDO(SDOsingle),
		.DONE(done)
	);
	
	
	reg [3:0] i_state;
	reg [5:0] cnt;
	reg [$clog2(NUM_TLC5955):0] cntTLC5955;
	
	reg controlSentOnce;
	
	always_ff@(posedge spiClk) begin: init_FSM
		if(!nReset) begin
			i_state <= 4'd0;
			controlSentOnce <= '0;
			LAT <= '0;
			initDone <= '0;
			cntTLC5955 <= '0;
		end else begin
			case (i_state)
				4'd0:			//send 96
					begin
						LAT <= '0;
						start <= '1;
						len <= 5'd9;
						data <= {1'd1, 8'h96};
						
						i_state <= 4'd1;
					end
				4'd1:			//send some zeros, 5 bits first
					begin
						if(done) begin
							len <= 5'd5;
							data <= 5'b00000;
							
							cnt <= '0;
							
							i_state <= 4'd2;
						end
						
					end
				4'd2:		//send more zeros, 48x 8bits  = 384
					begin
						if(done) begin
							len <= 5'd8;
							data <= 8'b00000000;
							cnt <= cnt + 1'd1;
							i_state <= (cnt == 6'd47) ? 4'd3 : 4'd2;
						end
					end
					
				4'd3:		//function control bits
					begin
						if(done) begin
							len <= 5'd5;
							data <= 5'b01111;
							
							i_state <= 4'd4;
							cnt <= '0;
						end
					end
				4'd4:		//global brightness	BCR[7:0] BCG[7:0] BCB[7:0]
					begin
						if(done) begin
							len <= 5'd7;
							data <= (cnt == 6'd1) ? 8'd51: 8'd127;
							
							cnt <= cnt + 1'd1;
							i_state <= (cnt == 6'd2) ? 4'd5 : 4'd4;
						end
					end
				4'd5:		//max current	9bits MCR[2:0] MCG[2:0] MCB[2:0]
					begin
						if(done) begin
							len <= 5'd9;
							data <= {3'd1, 3'd1, 3'd1};
							
							i_state <= 4'd6;
							cnt <= '0;
						end
					end
				4'd6:		//DC	3x 7bits x16
					begin
						if(done) begin
							len <= 5'd7;
							data <= 7'd127;
							
							cnt <= cnt + 1'd1;
							if(cnt == 6'd47) begin
								i_state <= 4'd7;
							end
						end
					end
				4'd7:		//latch
					begin
						start <= '0;
						if(done) begin
							cntTLC5955 <= cntTLC5955 + 1;
							i_state <= (cntTLC5955 == NUM_TLC5955-1) ? 4'd8 : 4'd0;
						end
					end
				4'd8:		//latch (need 30ns)
					begin
						LAT <= '1;
						i_state <= 4'd9;
					end
				4'd9:
					begin
						if(!controlSentOnce) begin
							controlSentOnce <= '1;
							i_state <= 4'd0;
						end else begin
							i_state <= 4'd10;
						end
						
					end
				4'd10:	//wait another clock cycle
					begin
						LAT <= '0;
						initDone <= '1;
					end
					
				default:
					i_state <= 4'd0;
			endcase
		end
	end
	
	
endmodule
