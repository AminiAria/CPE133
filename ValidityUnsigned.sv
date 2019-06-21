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


module ValidityUnsigned(
    input Sub,
    input Co,
    output logic valid
    );
    
always_comb
begin
    if (Sub && Co) //if you are subtracting and there is a carry out, then valid
        begin
            valid = 1;
        end
    else if (Sub == 0 && Co == 0) //if you are adding and there is no carry out, then valid
        begin
            valid = 1;
        end
    else //other cases are invalid, eg. subtracting and no carry out or adding and a carry out
        begin
            valid =0;
        end
end
endmodule
