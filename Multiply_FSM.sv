`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/25/2019 02:11:23 PM
// Design Name: 
// Module Name: Multiply_FSM
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


module Multiply_FSM(
    input CLK,
    input ENTER,
    input [3:0] B,
    output logic [1:0] SR_SEL,
    output logic ACC_LD,
    output logic ACC_CLR
    );
    
    parameter [2:0]
    HOLD = 3'b000,
    START = 3'b001,
    Bit0 = 3'b010,
    Bit1 = 3'b011,
    Bit2 = 3'b100,
    Bit3 = 3'b101;
    
    logic [2:0] NS;
    logic [2:0] PS = HOLD;
    
    always_ff @ (posedge CLK)
    begin
        PS = NS;
    end
        
    always_comb
    begin
    SR_SEL = 0; ACC_LD = 0; ACC_CLR = 0;
    case (PS)
    
        HOLD:
            begin
            SR_SEL = 0;
            ACC_LD = 0;
            ACC_CLR = 0;
            if (ENTER)
                begin
                NS = START;
                end
            else
                begin
                NS = HOLD;
                end
            end
            
        START:
            begin
            SR_SEL = 1;
            ACC_LD = 0;
            ACC_CLR = 1;
            NS = Bit0;
            end 
            
        Bit0:
            begin
            SR_SEL = 2;
            ACC_CLR = 0;
            if (B[0])
                begin
                ACC_LD = 1;
                NS = Bit1;
                end
            else
                begin
                ACC_LD = 0;
                NS = Bit1;
                end
            end
            
         Bit1:
            begin
            SR_SEL = 2;
            ACC_CLR = 0;
            if (B[1])
                begin
                ACC_LD = 1;
                NS = Bit2;
                end
            else
                begin
                ACC_LD = 0;
                NS = Bit2;
                end
            end
            
            
        Bit2:
            begin
            SR_SEL = 2;
            ACC_CLR = 0;
            if (B[2])
                begin
                ACC_LD = 1;
                NS = Bit3;
                end
            else
                begin
                ACC_LD = 0;
                NS = Bit3;
                end
            end
            
        Bit3:
            begin
            SR_SEL = 2;
            ACC_CLR = 0;
            if (B[3])
                begin
                ACC_LD = 1;
                NS = HOLD;
                end
            else
                begin
                ACC_LD = 0;
                NS = HOLD;
                end
            end
         default:
            NS = HOLD;
    endcase  
    end    
    
endmodule
