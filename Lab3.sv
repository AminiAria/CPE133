`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2019 01:48:52 PM
// Design Name: 
// Module Name: Lab3
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


module Lab3(
    input [3:0] A,
    input [3:0] B,
    output [6:0] seg,
    output [3:0] an
    );
    
    logic [0:3] t1;
    logic t2;
    
    RCA RCA_inst (.A(A), .B(B), .S(t1), .Co(t2));
    SevenSeg SevenSeg_inst (.BCD(t1), .seg(seg));
    Mux #(4) mux_inst (.sel(t2), .zero(4'b1110), .one(4'b1111), .an(an));
    
    
endmodule
