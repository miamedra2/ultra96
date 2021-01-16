`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2021 07:21:12 PM
// Design Name: 
// Module Name: edge_detect
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


module edge_detect(
    
    input logic     reset,
    input logic     level,
    output logic    tick
    
    );
    
    logic sys_clk;
    
    system u0(.clk_33MHz    (sys_clock));
    
    edge_detect_moore u1(
            .clk    (sys_clock),
            .reset  (reset),
            .level  (level),
            .tick   (tick)
            );
            
    
endmodule
