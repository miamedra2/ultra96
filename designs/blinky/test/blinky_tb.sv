`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/12/2021 05:12:48 PM
// Design Name: 
// Module Name: blinky_tb
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


module blinky_tb;

    //refclk frequency
    localparam real REFCLK_FREQUENCY   = 33e6; 

	// Clock periods
	localparam time REFCLK_PERIOD      = (1.0e9/REFCLK_FREQUENCY)*1ns;
	
	// Param Width
	localparam DATA_WIDTH              = 3;

	// -------------------------------------------------------------------------
	// Internal Signals
	// -------------------------------------------------------------------------
	//
	// Clock and reset signals
	logic clk;
	logic resetn;
	
	// Data signals
    logic           [3:0]   led;


	// -------------------------------------------------------------------------
	// REFCLK generator
	// -------------------------------------------------------------------------
	//
	initial begin
		clk = 1'b0;
		forever begin
			#(REFCLK_PERIOD/2) clk = ~clk;
		end
	end

	// -------------------------------------------------------------------------
	// Assert Reset
	// -------------------------------------------------------------------------
	//
	initial begin
		resetn = 1'b0;

		// Assert for ~16 clocks to avoid a Xilinx AXI VIP reset warning
		#(20*REFCLK_PERIOD);

		// Synchronous deassertion of reset
		@(posedge clk);
		resetn = 1'b1;
	end
	
	initial begin
	   forever begin
	   
	       #(REFCLK_PERIOD*10) 
	       
	       $display(" * led = (4'h%.8X)", led);  
	   end 
	end
	   

	// ------------------------------------------------------------------------
	// Blinky
	// ------------------------------------------------------------------------
	//
	system_blinky u0(
	   .resetn          (resetn),
	   .led            (led)
    );
	
	initial begin
		# (REFCLK_PERIOD*1000);
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

