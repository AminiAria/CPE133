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


module Multiplier(
    input clk,
    input [7:0] A,
    input enter,
    input [4:0] B,
    output [7:0] P,
    output done
    );
    logic [1:0] t1;
    logic t2, t3;
    logic [7:0] t4, t5;
    
    
    ShiftRegister ShiftRegister (.clk(clk), .CLR(0), .SEL(t1), .D({4'b0,A}), .Q(t4));
    MultiplyFSM_8bit MultiplyFSM (.clk(clk), .enter(enter), .B(B), .sr_sel(t1), .acc_ld(t2), .acc_clr(t3), .done(done));
    Accumulator Accumulator (.clk(clk), .LD(t2), .CLR(t3), .D(t4), .Q(t5));
    
endmodule
