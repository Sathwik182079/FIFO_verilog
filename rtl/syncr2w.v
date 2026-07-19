`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2026 11:31:39 AM
// Design Name: 
// Module Name: syncr2w
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


module sync_w2r(
    input rclk,
    input rrst_n,
    input [4:0] wptr,
    output reg [4:0] rq2_wptr
);

reg [4:0] rq1_wptr;

always @(posedge rclk or negedge rrst_n)
begin
    if(!rrst_n)
    begin
        rq1_wptr <= 0;
        rq2_wptr <= 0;
    end
    else
    begin
        rq1_wptr <= wptr;
        rq2_wptr <= rq1_wptr;
    end
end

endmodule