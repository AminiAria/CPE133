`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/30/2019 02:35:02 PM
// Design Name: 
// Module Name: SevenSeg
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


module SevenSeg(
    input [3:0] BCD,
    output logic [6:0] seg
    );
    
always_comb
begin
case(BCD)
        0: seg = 7'b1000000;
        1: seg = 7'b1111001;
        2: seg = 7'b0100100;
        3: seg = 7'b0110000;
        4: seg = 7'b0011001;
        5: seg = 7'b0010010;
        6: seg = 7'b0000010;
        7: seg = 7'b1111000;
        8: seg = 7'b0000000;
        9: seg = 7'b0010000;
        10: seg = 7'b0001000; //A
        11: seg = 7'b0000011; //b
        12: seg = 7'b1000110; //C
        13: seg = 7'b0100001; //d
        14: seg = 7'b0000110; //E
        15: seg = 7'b0001110; //F

default: seg = 7'b1111111;
endcase
end
endmodule
