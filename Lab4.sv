`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/11/2019 01:38:58 PM
// Design Name: 
// Module Name: Lab4
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


module Lab4(
    input [3:0] A,
    input [3:0] B,
    input sub,
    output [6:0] seg,
    output neg,
    output [3:0] an
    );
    logic [3:0] t1, t3, t4, t5;
    logic t6, t7;
    
    RCA RCA1 (.A(A), .B(t1), .Ci(sub), .S(t3));
    RCA RCA2 (.A(~t3), .B(4'b0000), .Ci(1), .S(t4));
    Mux MUX1 (.zero(B), .one(~B), .sel(sub), .an(t1));
    Mux MUX2 (.zero(t3), .one(t4), .sel(t6), .an(t5));
    Mux MUX3 (.zero(4'b1111), .one(4'b1110), .sel(t7), .an(an));
    Validity Validity1 (.A(A[3]), .B(t1[3]), .S(t3[3]), .valid(t7));
    assign t6 = t3[3] & t7;
    SevenSeg ssegdec1 (.BCD(t5), .seg(seg));
    assign neg = t6;
endmodule
