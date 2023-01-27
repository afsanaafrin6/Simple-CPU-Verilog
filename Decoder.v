module Decoder(
    instr_op_i,
    RegWrite_o,
    ALU_op_o,
    ALUSrc_o,
    RegDst_o,
    Branch_o,
    SinExt_o
    );

//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
output         SinExt_o;

//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;
reg            SinExt_o;

//Parameter

always@(*) begin
    case (instr_op_i)
        // XXX: the ALU_op is defined by myself? @_@?
        // r-types: add, sub, and, or, slt
        6'b000000:
            {RegWrite_o, ALU_op_o, ALUSrc_o, RegDst_o, Branch_o, SinExt_o} <= 8'b1_100_0101;
        // addi (add imm)
        6'b001000:
            {RegWrite_o, ALU_op_o, ALUSrc_o, RegDst_o, Branch_o, SinExt_o} <= 8'b1_000_1001;
        // beq
        6'b000100:
            {RegWrite_o, ALU_op_o, ALUSrc_o, RegDst_o, Branch_o, SinExt_o} <= 8'b0_001_0011;
        // ori (or imm)
        6'b001101:
            {RegWrite_o, ALU_op_o, ALUSrc_o, RegDst_o, Branch_o, SinExt_o} <= 8'b1_010_1000;
        default:
            {RegWrite_o, ALU_op_o, ALUSrc_o, RegDst_o, Branch_o, SinExt_o} <= 8'bxxxxxxxx;
    endcase
end



//Main function

endmodule
