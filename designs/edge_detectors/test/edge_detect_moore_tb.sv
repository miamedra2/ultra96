
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2021 07:28:31 PM
// Design Name: 
// Module Name: edge_detect_moore_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module edge_detect_moore_tb;

	// ------------------------------------------------------------------------
	// Local parameters
	// ------------------------------------------------------------------------

	localparam real REFCLK_FREQUENCY      = 33.00e6; 


	// Clock periods
	localparam time REFCLK_PERIOD      = (1.0e9/REFCLK_FREQUENCY)*1ns;

	// -------------------------------------------------------------------------
	// Internal Signals
	// -------------------------------------------------------------------------
	//
	// Clocks
	logic sys_clk;
	
	// Reset
	logic reset;
	
	// Level and Tick Generator
	logic level, tick;

	// -------------------------------------------------------------------------
	// REFCLK generator
	// -------------------------------------------------------------------------
	//
	initial begin
		sys_clk = 1'b0;
		forever begin
			#(REFCLK_PERIOD/2) sys_clk = ~sys_clk;
		end
	end


	// -------------------------------------------------------------------------
	// Reset Generator
	// -------------------------------------------------------------------------
	//
	initial begin
		reset = 1'b0;

		// Assert for ~16 clocks to avoid a Xilinx AXI VIP reset warning
		#(10*REFCLK_PERIOD);

		// Synchronous deassertion of reset
		@(posedge sys_clk);
		reset = 1'b1;
		
		// Assert for ~16 clocks to avoid a Xilinx AXI VIP reset warning
		#(10*REFCLK_PERIOD);

		// Synchronous deassertion of reset
		@(posedge sys_clk);
		reset = 1'b0;
	end

    edge_detect_moore u0(
            .clk        (sys_clk),
            .reset      (reset),
            .level      (level),
            .tick       (tick)
            );

	// -------------------------------------------------------------------------
	// Line In Generator
	// -------------------------------------------------------------------------
	//
	initial begin
		level = 1'b0;

		// Assert for ~100 clocks to avoid a Xilinx AXI VIP reset warning
		#(100*REFCLK_PERIOD);

		// Synchronous deassertion of reset
		@(posedge sys_clk);
		level = 1'b1;
		
				// Assert for ~100 clocks to avoid a Xilinx AXI VIP reset warning
		#(2*REFCLK_PERIOD);

		// Synchronous deassertion of reset
		@(posedge sys_clk);
		level = 1'b0;
		
				// Assert for ~100 clocks to avoid a Xilinx AXI VIP reset warning
		#(10*REFCLK_PERIOD);

		// Synchronous deassertion of reset
		@(posedge sys_clk);
		level = 1'b1;
		
				// Assert for ~100 clocks to avoid a Xilinx AXI VIP reset warning
		#(2*REFCLK_PERIOD);

		// Synchronous deassertion of reset
		@(posedge sys_clk);
		level = 1'b0;
	end

	initial begin
		$display(" ");
		$display("==========================================================");
		$display("Edge Detect system simulation");
		$display("==========================================================");
		$display(" ");

		
		// Wait
		#(300*REFCLK_PERIOD);
		

		// --------------------------------------------------------------------
		// End simulation
		// --------------------------------------------------------------------
		//
		$display(" ");
		$display("----------------------------------------------------------");
		$display("End simulation");
		$display("----------------------------------------------------------");
		$display(" ");
		$stop(0);
	end


endmodule
