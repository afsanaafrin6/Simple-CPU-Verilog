`timescale 1ns/1ps

module alu(
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
           //bonus_control, // 3 bits bonus control input(input)
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );


input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;
//input   [3-1:0] bonus_control;

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg    [32-1:0] result;
reg             zero;
reg             cout;
reg             overflow;
wire [31:0]result_;
wire [31:0]cout_;
wire back_edge;



alu_top _0(src1[0], src2[0], back_edge, ALU_control[3], ALU_control[2], ALU_control[3] ^ ALU_control[2], ALU_control[1:0], result_[0], cout_[0]);
alu_top _1(src1[1], src2[1], 0, ALU_control[3], ALU_control[2], cout_[0], ALU_control[1:0], result_[1], cout_[1]);
alu_top _2(src1[2], src2[2], 0, ALU_control[3], ALU_control[2], cout_[1], ALU_control[1:0], result_[2], cout_[2]);
alu_top _3(src1[3], src2[3], 0, ALU_control[3], ALU_control[2], cout_[2], ALU_control[1:0], result_[3], cout_[3]);

alu_top _4(src1[4], src2[4], 0, ALU_control[3], ALU_control[2], cout_[3], ALU_control[1:0], result_[4], cout_[4]);
alu_top _5(src1[5], src2[5], 0, ALU_control[3], ALU_control[2], cout_[4], ALU_control[1:0], result_[5], cout_[5]);
alu_top _6(src1[6], src2[6], 0, ALU_control[3], ALU_control[2], cout_[5], ALU_control[1:0], result_[6], cout_[6]);
alu_top _7(src1[7], src2[7], 0, ALU_control[3], ALU_control[2], cout_[6], ALU_control[1:0], result_[7], cout_[7]);

alu_top _8(src1[8], src2[8], 0, ALU_control[3], ALU_control[2], cout_[7], ALU_control[1:0], result_[8], cout_[8]);
alu_top _9(src1[9], src2[9], 0, ALU_control[3], ALU_control[2], cout_[8], ALU_control[1:0], result_[9], cout_[9]);
alu_top _10(src1[10], src2[10], 0, ALU_control[3], ALU_control[2], cout_[9], ALU_control[1:0], result_[10], cout_[10]);
alu_top _11(src1[11], src2[11], 0, ALU_control[3], ALU_control[2], cout_[10], ALU_control[1:0], result_[11], cout_[11]);

alu_top _12(src1[12], src2[12], 0, ALU_control[3], ALU_control[2], cout_[11], ALU_control[1:0], result_[12], cout_[12]);
alu_top _13(src1[13], src2[13], 0, ALU_control[3], ALU_control[2], cout_[12], ALU_control[1:0], result_[13], cout_[13]);
alu_top _14(src1[14], src2[14], 0, ALU_control[3], ALU_control[2], cout_[13], ALU_control[1:0], result_[14], cout_[14]);
alu_top _15(src1[15], src2[15], 0, ALU_control[3], ALU_control[2], cout_[14], ALU_control[1:0], result_[15], cout_[15]);

alu_top _16(src1[16], src2[16], 0, ALU_control[3], ALU_control[2], cout_[15], ALU_control[1:0], result_[16], cout_[16]);
alu_top _17(src1[17], src2[17], 0, ALU_control[3], ALU_control[2], cout_[16], ALU_control[1:0], result_[17], cout_[17]);
alu_top _18(src1[18], src2[18], 0, ALU_control[3], ALU_control[2], cout_[17], ALU_control[1:0], result_[18], cout_[18]);
alu_top _19(src1[19], src2[19], 0, ALU_control[3], ALU_control[2], cout_[18], ALU_control[1:0], result_[19], cout_[19]);

alu_top _20(src1[20], src2[20], 0, ALU_control[3], ALU_control[2], cout_[19], ALU_control[1:0], result_[20], cout_[20]);
alu_top _21(src1[21], src2[21], 0, ALU_control[3], ALU_control[2], cout_[20], ALU_control[1:0], result_[21], cout_[21]);
alu_top _22(src1[22], src2[22], 0, ALU_control[3], ALU_control[2], cout_[21], ALU_control[1:0], result_[22], cout_[22]);
alu_top _23(src1[23], src2[23], 0, ALU_control[3], ALU_control[2], cout_[22], ALU_control[1:0], result_[23], cout_[23]);

alu_top _24(src1[24], src2[24], 0, ALU_control[3], ALU_control[2], cout_[23], ALU_control[1:0], result_[24], cout_[24]);
alu_top _25(src1[25], src2[25], 0, ALU_control[3], ALU_control[2], cout_[24], ALU_control[1:0], result_[25], cout_[25]);
alu_top _26(src1[26], src2[26], 0, ALU_control[3], ALU_control[2], cout_[25], ALU_control[1:0], result_[26], cout_[26]);
alu_top _27(src1[27], src2[27], 0, ALU_control[3], ALU_control[2], cout_[26], ALU_control[1:0], result_[27], cout_[27]);

alu_top _28(src1[28], src2[28], 0, ALU_control[3], ALU_control[2], cout_[27], ALU_control[1:0], result_[28], cout_[28]);
alu_top _29(src1[29], src2[29], 0, ALU_control[3], ALU_control[2], cout_[28], ALU_control[1:0], result_[29], cout_[29]);
alu_top _30(src1[30], src2[30], 0, ALU_control[3], ALU_control[2], cout_[29], ALU_control[1:0], result_[30], cout_[30]);
alu_top _31(src1[31], src2[31], 0, ALU_control[3], ALU_control[2], cout_[30], ALU_control[1:0], result_[31], cout_[31]);


assign back_edge = (src1[31]^(~src2[31])^cout_[30]);  // the back edge feed back to the first one-bit alu

always @(*) begin
    cout = cout_;
    result = result_;
    zero = result == 0 ? 1 : 0;
    overflow = ((src1[31]&(src2[31]^ALU_control[2])) ^ result_[31]) & (ALU_control[2]^ALU_control[3]) & ~(src1[31]^src2[31]);
end

endmodule
