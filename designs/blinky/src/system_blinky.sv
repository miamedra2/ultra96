`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2021 02:39:40 PM
// Design Name: 
// Module Name: system_blinky
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


module system_blinky(
    input               resetn,
    output      [3:0]   led
    );
    
    system u0(  .clk_33MHz      (clk_33MHz));
    
    blinky u1(
            .clk        (clk_33MHz),
            .resetn     (resetn),
            .led        (led)    
            );
            
endmodule
