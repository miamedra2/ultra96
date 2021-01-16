`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/13/2021 08:33:45 PM
// Design Name: 
// Module Name: blinky
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


module blinky(
    input           clk,
    input           resetn,
    output [3:0]    led
    );
    
    logic [3:0] clk_count;
    
    always_ff @( negedge resetn or posedge clk) begin
	   if (~resetn) begin
	       clk_count <= 0;
	   end
	   else begin
	       clk_count <= clk_count + 1;
	   end 
	end

    assign led = clk_count;
endmodule
