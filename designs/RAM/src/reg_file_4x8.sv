`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2021 07:49:04 PM
// Design Name: 
// Module Name: reg_file_4x8
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


module reg_file_4x8
    #(
     parameter  DATA_WIDTH = 8, //number of bits
                ADDR_WIDTH = 2  //number of address bits
                )
    (
        input logic     clk,
        input logic     wr_en,
        input logic     [ADDR_WIDTH-1:0] w_addr, r_addr,
        input logic     [DATA_WIDTH-1:0] w_data,
        output logic    [DATA_WIDTH-1:0] r_data
    );
    
    //signal declaration
    logic [DATA_WIDTH-1:0]  array_reg   [0:2**ADDR_WIDTH-1];
    
    //store for synchronous read data 
    logic [DATA_WIDTH-1:0] data_reg;
    
    // body
    // write operation
    always_ff @(posedge clk)
        begin
        if(wr_en) 
            array_reg[w_addr] <= w_data;
        //read operation
        data_reg = array_reg[r_addr];
        end
    assign r_data = data_reg;
    
endmodule
