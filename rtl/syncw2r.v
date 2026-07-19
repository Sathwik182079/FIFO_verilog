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

module sync_r2w(
    input wclk,
    input wrst_n,
    input [4:0] rptr,
    output reg [4:0] wq2_rptr
);

reg [4:0] wq1_rptr;

always @(posedge wclk or negedge wrst_n)
begin
    if(!wrst_n)
    begin
        wq1_rptr <= 0;
        wq2_rptr <= 0;
    end
    else
    begin
        wq1_rptr <= rptr;
        wq2_rptr <= wq1_rptr;
    end
end

endmodule