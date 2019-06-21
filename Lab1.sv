`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/14/2019 02:12:54 PM
// Design Name: 
// Module Name: Lab1
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


module Lab1(
    input A,
    input B,
    input C,
    input D,
    output F_SOP,
    output F_POS,
    output F_NORNOR
    );
    
    assign F_SOP = (B & D) | (A & D) | (B & C) | (A & C);
    assign F_POS = (C | D) & (A | B);
    assign F_NORNOR = ~(~(C | D) | ~(A | B));
endmodule
