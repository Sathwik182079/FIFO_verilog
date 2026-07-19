`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2026 10:47:13 AM
// Design Name: 
// Module Name: readpointer
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


module read_pointer(
    input rclk,
    input rrst_n,
    input rinc,
    input rempty,
    output reg [4:0] rbin
);

always @(posedge rclk or negedge rrst_n)
begin
    if(!rrst_n)
        rbin <= 0;
    else if(rinc && !rempty)
        rbin <= rbin + 1;
end

endmodule


module read_gray(
    input [4:0] rbin,
    output [4:0] rptr
);

gray_converter gc1(
    .bin(rbin),
    .gray(rptr)
);

endmodule