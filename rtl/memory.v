`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2026 03:55:54 PM
// Design Name: 
// Module Name: fifo_code
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



    

module fifomem(
    input wclk,
    input wclken,
    input [3:0] waddr,
    input [3:0] raddr,
    input [7:0] wdata,
    output [7:0] rdata
);

reg [7:0] mem [0:15];

always @(posedge wclk)
begin
    if(wclken)
        mem[waddr] <= wdata;
end

assign rdata = mem[raddr];

endmodule



