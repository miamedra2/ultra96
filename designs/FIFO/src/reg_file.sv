`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/17/2021 09:54:16 AM
// Design Name: 
// Module Name: reg_file
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


module reg_file
    #(
        parameter DATA_WIDTH = 8, // number of bits
        parameter ADDR_WIDTH = 2  // number of address bits
    )
    (
        input logic     clk,
        input logic     wr_en,
        input logic     [ADDR_WIDTH-1:0] w_addr,
        input logic     [ADDR_WIDTH-1:0] r_addr,
        input logic     [DATA_WIDTH-1:0] w_data,
        output logic    [DATA_WIDTH-1:0] r_data
    );
    
    // signal declaration
    logic [DATA_WIDTH-1:0] array_reg[0:2**ADDR_WIDTH-1];
    logic [DATA_WIDTH-1:0] data_reg;
    
    // body
    // synchronous read/write operation
    always_ff @(posedge clk)
        begin
        if(wr_en)
            array_reg[w_addr] <= w_data;
        data_reg = array_reg[r_addr];
        end
    
    assign r_data = data_reg;
    
    
endmodule
