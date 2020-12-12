`timescale 1 ps / 1 ps

module top (
		input 				CLK_10M,

		input 				MAG1,
		
		output 				GSCLK,
		output   			LAT,
		output  				SCLK,
		output [7:0]  		SDO
		
	);

	localparam IMG_HEIGHT = 1024;
	localparam SPI_CLK_FREQ = 20000000;
	localparam FPS = 20;
	
	reg nReset = 1'b0;
	logic spiClk;
	logic clk;
	reg [$clog2(IMG_HEIGHT)-1:0] row;
	logic rowValid;
	
	logic [15:0] col[0:15]='{
		16'hF800, 16'h001f, 16'hF800, 16'h001f,
		16'hF800, 16'h001f, 16'hF800, 16'h001f,
		16'hF800, 16'h001f, 16'hF800, 16'h001f,
		16'hF800, 16'h001f, 16'hF800, 16'h001f
	};
	
	reg ledCmdStart;
	logic ledCmdDone;
	reg[15:0] ledCols[0:15];
		
		
	LED led(
		.spiClk(spiClk),
		.nReset(nReset),
		.LAT(LAT),
		.SDO(SDO[2]),
		.SCLK(SCLK),
		
		.ledCmdStart,
		.ledCmdDone,
		.ledCols
	);
	
	Pll pll(
		.clk_in_clk(CLK_10M),    //  clk_in.clk
		.clk_out_clk(clk),   // clk_out.clk
		.gsclk_clk(GSCLK),     //   gsclk.clk
		.sclk_x2_clk(spiClk)    // sclk_x2.clk
	);
	
	TurnTimer #(.CLK_FREQ(SPI_CLK_FREQ), .FPS(FPS), .IMG_HEIGHT(IMG_HEIGHT)) turnTimer(
		.clk(spiClk),
		.nReset,
		.mag(MAG1),
		.row,
		.valid(rowValid)
	);
	
	always_comb SDO[7:3] = 0;
	always_comb SDO[1:0] = 0;
	
	
	reg [24:0] timer;
	reg [5:0] cnt;
	reg [1:0] i_state;
	
	always_ff@(posedge spiClk) begin: led_FSM
		if(!nReset) begin
			i_state <= 2'd0;
			ledCmdStart <= '0;
			cnt <= '0;
			ledCols <= col;
		end else begin
			case (i_state)
				2'd0:			
					begin
						
						ledCmdStart <= '1;
						i_state <= 2'd1;
						
					end
				2'd1:
					begin
						ledCmdStart <= '0;
						cnt <= cnt + 1;
						//col <= {5'd0, cnt, 5'd0};
							
						i_state <= 2'd2;
					end
				2'd2:
					begin
						if(ledCmdDone) begin
							timer <= 0;
							i_state <= 2'd3;
						end
						
					end
				2'd3:
					begin
						timer <= timer + 1;
						if(timer == 25'd5000000)
							i_state <= 2'd0;
					end
				default:
					i_state <= 2'd0;
			endcase
		end
	end
	
	
	// reset logic
	reg [1:0] r_state = '0;
	always_ff@(posedge clk) begin	: init_logic
		case (r_state)
			2'd0: 
				begin
					r_state <= 2'd1;
					nReset <= 1'b0;
				end
			2'd1:
				begin
					nReset <= 1'b1;
					r_state <= 2'd2;
					
				end
			2'd2:
				begin
				end
			default:
				r_state <= 2'd0;
		endcase
	end
	
	
endmodule
