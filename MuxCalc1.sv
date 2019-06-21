`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2019 01:36:56 PM
// Design Name: 
// Module Name: Mux
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


module Mux # (parameter WIDTH = 4)(
    input sel,
    input sign,
    input add,
    input sub,
    input mult,
    input squared,
    
    input [WIDTH-1:0] zero,
    input [WIDTH-1:0] one,
    output logic [3:0] an
    );
    
always_comb
begin
    if (add)
        out = 1
    if (sub)
        out = 2
    if (mult)
        out = 3
    if (squared)
        out = 4
    if (sel == 1)
        begin
            an = one;
        end
    else 
        begin
            an = zero;
        end
        
end
endmodule
