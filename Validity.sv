`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/06/2019 02:24:30 PM
// Design Name: 
// Module Name: Validity
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


module Validity(
    input A,
    input B,
    input S,
    output logic valid
    );
    
always_comb
begin
    if (A == B && A != S)
        begin
            valid = 0;
        end
    else
        begin
            valid = 1;
        end
end
endmodule
