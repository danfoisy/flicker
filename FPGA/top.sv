`timescale 1 ps / 1 ps

module top (
		input 					CLK_10M,

		input 					MAG2,
		
		output 					GSCLK,
		output   				LAT,
		output  					SCLK,
		output [7:0]  			SDO,
		
		input 					PIXCLK,
		input [23:0] 			QE,
		input 					VSYNC,
		input 					DE,
		
		output logic [12:0] 	A,
		output logic [1:0] 	BA,
		output logic 			nCAS,
		output logic 			CKE,
		output logic 			nCS,
		inout wire  [15:0]	DQ,
		output logic [1:0]	DQM,
		output logic 			nRAS,
		output logic			nWE,
		output logic 			SDRAM_CLK
	);

	localparam VID_WIDTH = 1280;
	localparam VID_HEIGHT = 1024;
	localparam VID_FPS = 60;
	localparam GLB_HEIGHT = 1024;
	localparam GLB_WIDTH = 128;
	localparam GLB_FPS = 10;
	
	localparam BURST_SIZE = 8;
	
	localparam SPI_CLK_FREQ = 40000000;
	localparam SDRAM_CLK_FREQ = 90000000;
	
	logic nReset;
	logic spiClk;
	logic SDRAM_CLKn;
	assign SDRAM_CLK = !SDRAM_CLKn;
	
	logic readLedAddressAck;

	
	//
	logic ledCmdDone;
	reg[15:0] bufLedCol;
	reg[6:0] bufWrAddress;
	reg LEDwren;
	
	LED #(.GLB_HEIGHT(GLB_HEIGHT), .GLB_WIDTH(GLB_WIDTH), .SDRAM_CLK_FREQ(SDRAM_CLK_FREQ), .GLB_FPS(GLB_FPS)) led(
		.CLK_10M,
		.spiClk(spiClk),
		.SDRAM_CLK(SDRAM_CLKn),
		
		.nReset(nReset),
		
		.LAT(LAT),
		.SDO(SDO[7:0]),
		.SCLK(SCLK),

		.ledCmdDone,
		
		.readReq(readLedReq),
		.address(readLedAddress),
		.addressAck(readLedAddressAck),
		.readDataValid,
		.readData(readLedData),
		
		.MAG2
	);
	

	Pll pll(
		.clk_in_clk(CLK_10M),  			//  clk_in.clk
		.sdram_clk_clk(SDRAM_CLKn),   	// clk_out.clk
		.gsclk_clk(GSCLK),     			//   gsclk.clk
		.sclk_x2_clk(spiClk)    		// sclk_x2.clk
	);
	
			 
	
	Reset reset(
		.clk(CLK_10M),
		.nReset
	);
	
	reg [$clog2(BURST_SIZE)-1:0] burstCnt;
	reg [$clog2(BURST_SIZE):0] readRequestCnt;	
	reg [2:0] m_state;
	logic [23:0] wordAddress;
	logic [15:0] readLedData;
	logic [15:0] readFifoData;
	logic [23:0] writeWordAddress;
	logic readDataValid;
	logic waitRequest;
	logic [23:0] readLedAddress;
	logic nRead;
	logic readFifoReq;
	logic readLedReq;
	
	reg [3:0] writeCnt;
	logic readFifoEnable;
	logic memWriteRequest;
	
	assign nRead = (m_state == 3 && !waitRequest  && readRequestCnt < BURST_SIZE) ? 1'b0 : 1'b1 ;
	assign wordAddress = m_state == 1 ? writeWordAddress : readLedAddress;
	
	
	assign readFifoEnable = (m_state == 1)  && !waitRequest;
	assign memWriteRequest = (m_state == 1);
	
	assign readLedAddressAck = (m_state == 3) && !nRead;
	
	always_ff@(posedge SDRAM_CLKn) begin
		if(!nReset) begin
			burstCnt <= '0;
			m_state <= '0;
		end else begin
		
			if(VSYNC)
				writeWordAddress <= '0;
				
			case(m_state)
				0:
					begin
						if(readFifoReq) begin
							m_state <= 1;
							writeCnt <= '0;
						end else begin
							m_state <= 2;
						end
						
					end
				1:
					
					begin
						if(!waitRequest) begin
							writeCnt <= writeCnt + 1;
							writeWordAddress <= writeWordAddress + 1;
							
							if(writeCnt == BURST_SIZE-1 || !readFifoReq) begin
								m_state <= 2;
							end
						end
					end
					
				
				2: 
					begin
						if(readLedReq) begin
							burstCnt <= '0;
							readRequestCnt <= '0;
							m_state <= 3;
						end else begin
							m_state <= 0;
						end
					end
				3:
					begin
						if(!nRead) begin
							readRequestCnt <= readRequestCnt + 1;
						end 
						
						if(readDataValid) begin
							burstCnt <= burstCnt + 1;
							if(burstCnt == BURST_SIZE-2) begin
								burstCnt <= '0;
								m_state <= 0;
							end
						end
					end
				default:
					m_state <= '0;
			endcase
		end
	end
	
	
	DVI #(.VID_HEIGHT(VID_HEIGHT), .VID_WIDTH(VID_WIDTH), .VID_FPS(VID_FPS), .GLB_HEIGHT(GLB_HEIGHT), .GLB_WIDTH(GLB_WIDTH), .GLB_FPS(GLB_FPS)) 
		dvi (
			.nReset,
			
			.PIXCLK,

			.QE,
			.VSYNC,
			.DE,
			
			.SDRAM_CLK(SDRAM_CLKn),
			.readEnable(readFifoEnable),
			.readReq(readFifoReq),
			.readData(readFifoData)
	);
	
	SDRAM sdram(
		.clk_clk(SDRAM_CLKn),                		//        clk.clk
		.reset_reset_n(nReset),          			//      reset.reset_n
		.sdram_s1_address(wordAddress),       		//   sdram_s1.address
		.sdram_s1_byteenable_n('0),  					//           .byteenable_n
		.sdram_s1_chipselect('1),    					//           .chipselect
		.sdram_s1_writedata(readFifoData),     		//           .writedata
		.sdram_s1_read_n(nRead),        				//           .read_n
		.sdram_s1_write_n(!memWriteRequest),  		//           .write_n
		.sdram_s1_readdata(readLedData),     		//           .readdata
		.sdram_s1_readdatavalid(readDataValid), 	//           .readdatavalid
		.sdram_s1_waitrequest(waitRequest),   		//           .waitrequest
		
		.sdram_wire_addr(A),						      // sdram_wire.addr
		.sdram_wire_ba(BA),          					//           .ba
		.sdram_wire_cas_n(nCAS),       				//           .cas_n
		.sdram_wire_cke(CKE),				         //           .cke
		.sdram_wire_cs_n(nCS),				         //           .cs_n
		.sdram_wire_dq(DQ), 				            //           .dq
		.sdram_wire_dqm(DQM),				         //           .dqm
		.sdram_wire_ras_n(nRAS),			         //           .ras_n
		.sdram_wire_we_n(nWE)			            //           .we_n
	);
	
endmodule
