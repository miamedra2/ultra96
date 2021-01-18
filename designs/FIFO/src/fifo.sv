`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/16/2021 10:09:39 PM
// Design Name: 
// Module Name: fifo
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


module fifo
    #(
     parameter DATA_WIDTH=8, //number of bits in a word
     parameter ADDR_WIDTH=4  //number of address bits
    )
    (
        input logic clk, reset,
        input logic rd, wr,
        input logic [DATA_WIDTH-1:0] w_data,
        output logic empty, full,
        output logic [DATA_WIDTH-1:0] r_data
    );
    
    //signal declaration
    logic [ADDR_WIDTH-1:0] w_addr;
    logic [ADDR_WIDTH-1:0] r_addr;
    logic wr_en, full_tmp;
    
    // body
    // write enabled only when FIFO is not full
    assign wr_en = wr & ~full_tmp;
    assign full = full_tmp;
    
    // instantiate fifo control unit
    fifo_ctrl #(    .ADDR_WIDTH (ADDR_WIDTH)) c_unit
        (       .clk        (clk),
                .reset      (reset),
                .rd         (rd),
                .wr         (wr),
                .empty      (empty),
                .full       (full_tmp),
                .w_addr     (w_addr),
                .r_addr     (r_addr)
        );

    // instantiate register file
    reg_file
            #(  .DATA_WIDTH (DATA_WIDTH), .ADDR_WIDTH (ADDR_WIDTH)) f_unit
             (  .clk        (clk),
                .wr_en      (wr_en),
                .w_addr     (w_addr),
                .r_addr     (r_addr),
                .w_data     (w_data),
                .r_data     (r_data)
             ); 
             

endmodule
