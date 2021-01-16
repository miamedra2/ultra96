`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2021 09:34:40 PM
// Design Name: 
// Module Name: edge_detect_gate
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


module edge_detect_gate(
    input logic     clk,
    input logic     reset,
    input logic     level,
    output logic    tick
    );
    
    //signal declarations
    logic delay_reg;
    
    //delay register
    always_ff @ (posedge clk, posedge reset)
        if (reset) 
            delay_reg <= 1'b0;
        else
            delay_reg <= level;
              
    //decoding logic
    assign tick = delay_reg;

endmodule
