`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

// Engineer: Bridget Benson

// Create Date: 10/29/2018 07:31:15 PM

// Description: Shows how to write an FSM

//////////////////////////////////////////////////////////////////////////////////

 

module MultiplyFSM_8bit(
    input clk,
    input enter,
    input [7:0] B,
    output logic [1:0] sr_sel,
    output logic acc_ld,
    output logic acc_clr,
    output logic done
    );
   
    //assign bit values to your states
    //again the size should be log2(number of states)
    parameter [3:0]
    HOLD  = 4'b0000,
    START = 4'b0001,
    BIT0  = 4'b0010,
    BIT1  = 4'b0011,
    BIT2  = 4'b0100,
    BIT3  = 4'b0101,
    BIT4  = 4'b0110,
    BIT5  = 4'b0111,
    BIT6  = 4'b1000,
    BIT7  = 4'b1001,
    DONE = 4'b1010;
   
    //declare present state (PS) and next state (NS) variables to
    //be the size of log2(number of states)
    //initialize PS to the beginning state
    logic [3:0] NS;
    logic [3:0] PS = HOLD;
   
    //sequential logic to change states
    always_ff @ (posedge clk)
    begin
        PS = NS;
    end
   
    //combinatorial logic
    always_comb
    begin
   
    //initialze all outputs to zero
    sr_sel = 0;
    acc_ld = 0;
    acc_clr = 0;
    done = 0;
   
    case (PS)
   
        HOLD:
        begin
            sr_sel = 0;
            acc_ld = 0;
            acc_clr = 0;
            done = 0;
            if (enter)
                NS = START;
            else
                NS = HOLD;
        end
   
        START:
        begin
            sr_sel = 1;
            acc_ld = 0;
            acc_clr = 1;
            done = 0;
            NS = BIT0;
        end
        
        BIT0:
        begin
            sr_sel = 2;
            acc_ld = B[0];
            acc_clr = 0;
            done = 0;
            NS = BIT1;
        end
       
        BIT1:
        begin
            sr_sel = 2;
            acc_ld = B[1];
            acc_clr = 0;
            done = 0;
            NS = BIT2;
        end
       
        BIT2:
        begin
            sr_sel = 2;
            acc_ld = B[2];
            acc_clr = 0;
            done = 0;
            NS = BIT3;
        end
       
        BIT3:
        begin
            sr_sel = 2;
            acc_ld = B[3];
            acc_clr = 0;
            done = 0;
            NS = BIT4;
        end
        
        BIT4:
        begin
            sr_sel = 2;
            acc_ld = B[4];
            acc_clr = 0;
            done = 0;
            NS = BIT5;
        end
        
        BIT5:
        begin
            sr_sel = 2;
            acc_ld = B[5];
            acc_clr = 0;
            done = 0;
            NS = BIT6;
        end
        
        BIT6:
        begin
            sr_sel = 2;
            acc_ld = B[6];
            acc_clr = 0;
            done = 0;
            NS = BIT7;
        end
        
        BIT7:
        begin
            sr_sel = 2;
            acc_ld = B[7];
            acc_clr = 0;
            done = 0;
            NS = DONE;
        end
       
        DONE:
        begin
            sr_sel = 0;
            acc_ld = 0;
            acc_clr = 0;
            done = 1;
            NS = HOLD;
        end
        
        default:
            NS = HOLD;
    endcase     
    end      
endmodule