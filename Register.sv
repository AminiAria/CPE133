`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2019 01:46:13 PM
// Design Name: 
// Module Name: Register
// Project Name: 
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Register # (parameter WIDTH = 1)(
    input CLK,
    input enter,
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
    input CLR,
    input [WIDTH-1:0] D,
    input set,
    output logic [WIDTH-1:0] Q
    );
always_ff @ (posedge CLK)
begin
    if(CLR)
        Q = 0;
    else if (set)
        Q = 1;
    else if (enter)
        Q = D;
end        
endmodule
