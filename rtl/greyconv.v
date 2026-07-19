`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2026 12:00:22 PM
// Design Name: 
// Module Name: greyconv
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


module gray_converter(
    input  [4:0] bin,
    output [4:0] gray
);

assign gray = (bin >> 1) ^ bin;

endmodule