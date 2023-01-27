`timescale 1ns/1ps

module alu_top(
               src1,       //1 bit source 1 (input)
               src2,       //1 bit source 2 (input)
               less,       //1 bit less     (input)
               A_invert,   //1 bit A_invert (input)
               B_invert,   //1 bit B_invert (input)
               cin,        //1 bit carry in (input)
               operation,  //operation      (input)
               result,     //1 bit result   (output)
               cout        //1 bit carry out(output)
               );

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output        result;
output        cout;

reg           cout;
reg           result;


reg a, b;

always@( * )
begin
  a = src1 ^ A_invert;  // the mux to get real operand a
  b = src2 ^ B_invert;  // get b

  case (operation[1:0])
      // and/or/add/slt
      4'b00: begin result = a&b; cout = 0; end   // use the builtin and/or operators
      4'b01: begin result = a|b; cout = 0; end
      4'b10: begin result = a^b^cin; cout = a&b | a&cin | b&cin; end   // this is a full adder
      4'b11: begin result = less; cout = a&b | a&cin | b&cin; end      // set less to result, pass the carry to next stage
    endcase
end
endmodule
