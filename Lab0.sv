`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Aria Amini
// Create Date: 01/08/2019 10:22:18 AM
// Description: Dummy circuit to illustrate how to use Vivado
//////////////////////////////////////////////////////////////////////////////////


module Lab0(
    input A,
    input B,
    input C,
    output Q
    );
    
    assign Q = ~(A | B) | (B & C);
endmodule
