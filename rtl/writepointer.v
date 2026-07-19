`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2026 10:35:25 AM
// Design Name: 
// Module Name: writepointer
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

module write_pointer(
    input wclk,
    input wrst_n,
    input winc,
    input wfull,
    output reg [4:0] wbin
);

always @(posedge wclk or negedge wrst_n)
begin
    if(!wrst_n)
        wbin <= 0;
    else if(winc && !wfull)
        wbin <= wbin + 1;
end

endmodule

module write_gray(
    input [4:0] wbin,
    output [4:0] wptr
);

gray_converter gc2(
    .bin(wbin),
    .gray(wptr)
);

endmodule