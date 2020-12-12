module Video #(IMG_WIDTH, IMG_HEIGHT) (
		input nReset,

		input PIXCLK,
		input [23:0] QE,
		input VSYNC,
		input HSYNC,
		
		input rdclk,
		input rdreq,
		
		output [15:0] data,
		output dataAvailable,
		
		output reg [21:0] address
	);
	
	logic [8:0] rdusedw;
	
	module VidFifo (
		.aclr('0),
		
		.data({QE[23:19], QE[15:10], QE[7:3]}),
		.wrclk(PIXCLK),
		.wrreq('1),
		.wrfull(),
		
		.rdclk,
		.rdreq,
		.rdusedw,
		.q(data)
		
	);
	
	assign dataAvailable = rdusedw >= 9'8;
	
	wire [15:0] col1;
	
	always_ff@(posedge rdclk) begin 
		if(!nReset) begin
			address <= '0;
		end else begin
			if(rdreq)
				address <= (address < IMG_WIDTH * IMG_HEIGHT * 2 - 2) ? (address + 22'b1) : '0;
		end
	end
		
		
endmodule
