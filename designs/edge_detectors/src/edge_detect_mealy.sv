`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2021 09:11:15 PM
// Design Name: 
// Module Name: edge_detect_mealy
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


module edge_detect_mealy(
    input logic     clk,
    input logic     reset,
    input logic     level,
    output logic    tick
    );
    
    // fsm sate type
    typedef enum {zero, one} state_type;
    
    // signal declaration
    state_type state_reg, state_next;
    
    always_ff @(posedge clk, posedge reset) 
        if (reset) 
            state_reg <= zero;
        else
            state_reg <= state_next;
            
    // next state logic and output logic
    always_comb
    begin
        state_next = state_reg;      //default state: the same
        tick = 1'b0;
        case (state_reg)
            zero:
                if (level)
                    begin
                        tick = 1'b1;
                        state_next = one;
                    end 
            one:
                if (~level)
                    state_next = zero;
            default:
                state_next = zero;
        endcase
    end

endmodule
