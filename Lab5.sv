`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/19/2019 01:55:37 PM
// Design Name: 
// Module Name: Lab5
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


module Lab5(
    input [3:0] A,
    input [3:0] B,
    input sub,
    output [7:0] seg,
    output neg,
    output [3:0] an,
    input CLK,
    input enter,
    input CLR
    );
    logic [3:0] t1, t3, t4, t5, t8;
    logic t6, t7, t9, t10;
    
    //Lab 4 stuff, binary subtraction
    RCA RCA1 (.A(A), .B(t1), .Ci(sub), .S(t3));
    RCA RCA2 (.A(~t3), .B(4'b0000), .Ci(1), .S(t4));
    Mux MUX1 (.zero(B), .one(~B), .sel(sub), .an(t1));
    Mux MUX2 (.zero(t3), .one(t4), .sel(t6), .an(t5));
    Validity Validity1 (.A(A[3]), .B(t1[3]), .S(t3[3]), .valid(t7));
    assign t6 = t3[3] & t7;
    assign neg = t6;
    
    //All registers
    Register #(4) num (.CLK(CLK), .enter(enter), .CLR(CLR), .D(t5), .set(0), .Q(t8));
    Register sign (.CLK(CLK), .enter(enter), .CLR(CLR), .D(t6), .set(0), .Q(t9));
    Register valid (.CLK(CLK), .enter(enter), .CLR(0), .D(t7), .set(CLR), .Q(t10));
    
    //Seven Seg Stuff using copied code
    univ_sseg univ_sseg (.clk(CLK), .cnt1({10'b0,t8}), .cnt2(0), .dp_en(0), .dp_sel(0), .mod_sel(0), .sign(t9), .valid(t10), .ssegs(seg), .disp_en(an));
    
endmodule
