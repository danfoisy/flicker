//VID = DVI image 
//GLB = Globe image
module DVI #(parameter VID_HEIGHT, VID_WIDTH, VID_FPS, GLB_HEIGHT, GLB_WIDTH, GLB_FPS) (
		input nReset,
		
		input PIXCLK,
		input [23:0] QE,
		input VSYNC,
		input DE,
		
		input SDRAM_CLK,
		input readEnable,
		output readReq,
		output [15:0] readData
);

	localparam FPS_RATIO = VID_FPS/GLB_FPS;
	
	logic wrreq;
	logic	[8:0]  rdusedw;
	reg [$clog2(VID_WIDTH)-1:0] xCnt;
	reg [$clog2(VID_HEIGHT):0] yCnt;
	reg [$clog2(FPS_RATIO)-1:0] refreshCnt;
	reg vidEnabled;
	
	VideoFifo videoFifo(
		.data({QE[23:19], QE[15:10], QE[7:3]}),	
		
		.wrclk(PIXCLK),
		.wrreq,
		
		.rdclk(SDRAM_CLK),
		.rdreq(readEnable),
		.q(readData),
		.rdusedw
	);

	assign wrreq = DE && (refreshCnt == 0) && vidEnabled && yCnt<GLB_HEIGHT && xCnt>=(VID_WIDTH/2)-(GLB_WIDTH/2) && xCnt<(VID_WIDTH/2)+(GLB_WIDTH/2); 

	reg 	vsyncFound;
	reg [1:0] v_state;
	
	always_ff@(negedge PIXCLK) begin
		if(!nReset) begin
			v_state <= 0;
			vsyncFound <= '0;
		end else begin
			case(v_state)
				0:
					begin
						if(!VSYNC)
							v_state <= 1;
					end
				1:
					if(VSYNC) begin
						v_state <= 2;
						vsyncFound <= '1;
					end
				2:
					begin
						v_state <= 0;
						vsyncFound <= '0;
					end
				default:
					v_state <= 0;
			endcase	
		end		
		
	end
	
	always_ff@(negedge PIXCLK) begin	
	
		if(vsyncFound ) begin
			xCnt <= '1;
			yCnt <= '0;
			vidEnabled <= '1;
			
			if(vidEnabled  ) begin
				refreshCnt <= refreshCnt + 1;
			end
		end else begin
			if(vidEnabled && DE) begin
				if(xCnt == VID_WIDTH - 1) begin
					xCnt <= '0;
					yCnt <= yCnt + 1;
				end else begin
					xCnt <= xCnt + 1;
				end
			end
		end
	end
	
	
	assign readReq = rdusedw >0;
endmodule
