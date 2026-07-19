`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2026 11:06:31 AM
// Design Name: 
// Module Name: full
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
module full_logic(
    input [4:0] wptr,
    input [4:0] wq2_rptr,
    output reg wfull
);

always @(*)
begin
    if(wptr ==
       {~wq2_rptr[4:3],
         wq2_rptr[2:0]})
        wfull = 1'b1;
    else
        wfull = 1'b0;
end

endmodule