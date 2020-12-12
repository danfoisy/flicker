module LED #(parameter NUM_SHIFT=4, GLB_HEIGHT, GLB_WIDTH, GLB_FPS, SDRAM_CLK_FREQ)  (
		input					CLK_10M,
		input 				spiClk,
		input					SDRAM_CLK,
		input 				nReset,
		
		input 				MAG2,
		
		output 				ledCmdDone,
		
		/*input		[15:0]	ledCol,
		input		[6:0]		wraddress,
		input 				wrclock,
		input 				wren,
		*/
		
		
		output reg 			readReq,
		output reg [23:0] address,
		input 				addressAck,
		input 				readDataValid,
		input [15:0] 		readData,
		
		output				busy,
		
		output  				LAT,
		output 	[NUM_SHIFT-1:0]		SDO,
		output				SCLK
		
	);
	
	logic initDone;
	
	logic initLat;
	
	logic ledLat;
	logic ledBusy;
	
	logic SDOsingle;
	logic [NUM_SHIFT-1:0] SDOs;
	logic initSCLK;
	logic ledSCLK;

	
	
	assign LAT = !initDone ? initLat : ledLat;
	assign SDO = !initDone ? { NUM_SHIFT{SDOsingle}} : SDOs; 
	assign SCLK = !initDone ? initSCLK : ledSCLK;
	assign busy = !initDone || ledBusy;
	
	
	//CDC ledCmdStart
	reg ledCmdStart_SPI;
	reg ledCmdStart_SDRAM;
	reg ledCmdStart_pipe;
	reg ledCmdStart_last;
	reg ledCmdStart;
	
	always @(posedge spiClk)
		{ ledCmdStart_last, ledCmdStart_SPI, ledCmdStart_pipe } <= { ledCmdStart_SPI, ledCmdStart_pipe, ledCmdStart_SDRAM };
	
	always @(posedge spiClk)
		ledCmdStart <= (!ledCmdStart_last)&&(ledCmdStart_SPI);
	
	reg ledCmdStart_ack;
	reg ledCmdStart_ack_pipe;
	always @(posedge SDRAM_CLK)
		{ ledCmdStart_ack, ledCmdStart_ack_pipe } <= { ledCmdStart_ack_pipe, ledCmdStart_SPI };
	
	//CDC ledCmdStart  end
	
	InitLed initLed(
		.spiClk,
		.nReset,
		
		.LAT(initLat),
		.SDOsingle,
		.SCLK(initSCLK),
		
		.initDone
	);
	
	logic [6:0] rdaddress;
	logic [15:0] ledColBuf;
	
	RowBuf rowBuf(
		.data(readData_d),
		.wraddress(bufAddress),
		.wrclock(SDRAM_CLK),
		.wren(readDataValid),
		
		.rdaddress,
		.rdclock(spiClk),
		
		.q(ledColBuf)
	);
	
	LedCtrl #(.NUM_SHIFT(4)) ledCtrl(
		.spiClk(spiClk),
		.nReset(nReset),

		.SDOs,
		.LAT(ledLat),
		.SCLK(ledSCLK),
		
		.cmdStart(ledCmdStart),
		.cmdDone(ledCmdDone),
		.busy(ledBusy),
		
		.ledColBuf,
		.rdaddress
	);
	
	//turn timer
	logic [$clog2(GLB_HEIGHT)-1:0] row;
	logic rowValid;
	logic rowChange;
	logic index;
	reg [7:0] magFilter;
	reg mag;
	always_ff@(posedge CLK_10M) begin
		magFilter <= {magFilter[6:0], MAG2};
		if(magFilter == '1)
			mag <= '1;
		else if(magFilter == '0)
			mag <= '0;
	end
	
	//---------------------------------------------------------------------------------------------
	//SDRAM_CLK
	//---------------------------------------------------------------------------------------------
	
	TurnTimer #(.CLK_FREQ(SDRAM_CLK_FREQ), .FPS(GLB_FPS), .IMG_HEIGHT(GLB_HEIGHT)) turnTimer(
		.clk(SDRAM_CLK),
		.nReset,
		.mag(mag),
		.row,
		.valid(rowValid),
		.index,
		.rowChange
	);	
	
	
	
	reg [6:0] bufAddress;
	reg [15:0] readData_d;
	
	always@(posedge SDRAM_CLK) 
		readData_d <= readData;
	
	reg [15:0] readCnt;
	reg [1:0] state;
	logic [$clog2(GLB_HEIGHT)-1:0] rowDbg;
	always@(posedge SDRAM_CLK) begin
		if(!nReset) begin
			state <= '0;
			readCnt <= '0;
			readReq <= '0;
			bufAddress <= '0;
			ledCmdStart_SDRAM <= '0;
		end else begin
			case(state)
				0: 
					begin
						//if(rowChange) begin
							address <= rowDbg << $clog2(GLB_WIDTH);
							
							rowDbg<= rowDbg +1;
							if(rowDbg == GLB_HEIGHT -1)
								rowDbg <= '0;
							
							readCnt <= '0;
							//if(row < GLB_HEIGHT) begin
							if(rowDbg < GLB_HEIGHT) begin
								state <= 1;
								readReq <= '1;
							end 
						//end
					end
				1:
					begin
						if(addressAck)
							address <= address + 1;
							
						if(readDataValid) begin
							readCnt <= readCnt + 1;
							bufAddress <= bufAddress + 1;
							
							if(readCnt == GLB_WIDTH - 1) begin
								readReq <= '0;
								state <= 2;
								readCnt <= '0;
							end
						end
					end
				2:
					begin
						ledCmdStart_SDRAM <= '1;
						if(ledCmdStart_ack && !ledBusy) begin
							ledCmdStart_SDRAM <= '0;
							state <= 0;
						end
					end
					
			endcase 
		end
	end
		
endmodule
