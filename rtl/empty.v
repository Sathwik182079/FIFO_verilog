`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2026 10:56:22 AM
// Design Name: 
// Module Name: empty
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

module empty_logic(
    input [4:0] rptr,
    input [4:0] rq2_wptr,
    output reg rempty
);

always @(*)
begin
    if(rptr == rq2_wptr)
        rempty = 1'b1;
    else
        rempty = 1'b0;
end

endmodule