`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/28/2019 01:18:30 PM
// Design Name: 
// Module Name: RCA
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


module RCA(
    input [3:0] A,
    input [3:0] B,
    input Ci,
    output [3:0] S,
    output Co
    );
    
    logic t1, t2, t3;
    
    //HalfAdder HA0 (.A(A[0]), .B(B[0]), .S(S[0]), .Co(t1));
    FullAdder FA0 (.A(A[0]), .B(B[0]), .S(S[0]), .Co(t1), .Ci(Ci));
    FullAdder FA1 (.A(A[1]), .B(B[1]), .S(S[1]), .Co(t2), .Ci(t1));
    FullAdder FA2 (.A(A[2]), .B(B[2]), .S(S[2]), .Co(t3), .Ci(t2));
    FullAdder FA3 (.A(A[3]), .B(B[3]), .S(S[3]), .Co(Co), .Ci(t3));
    
    
endmodule
