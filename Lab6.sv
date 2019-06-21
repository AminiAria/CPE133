`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2019 01:56:08 PM
// Design Name: 
// Module Name: Lab6
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


module Lab6(
    input CLK,
    input [3:0] A,
    input ENTER,
    input [3:0] B,
    output [7:0] seg,
    output [3:0] an
    );
    logic [1:0] t1;
    logic t2, t3;
    logic [7:0] t4, t5;
    
    
    ShiftRegister ShiftRegister (.clk(CLK), .CLR(0), .SEL(t1), .D({4'b0,A}), .Q(t4));
    Multiply_FSM Multiply_FSM (.CLK(CLK), .ENTER(ENTER), .B(B), .SR_SEL(t1), .ACC_LD(t2), .ACC_CLR(t3));
    Accumulator Accumulator (.clk(CLK), .LD(t2), .CLR(t3), .D(t4), .Q(t5));
    univ_sseg univ_sseg (.clk(CLK), .cnt1({6'b0,t5}), .cnt2(0), .dp_en(0), .dp_sel(0), .mod_sel(0), .sign(0), .valid(1), .ssegs(seg), .disp_en(an));
endmodule
