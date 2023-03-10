module Simple_Single_CPU(
        clk_i,
        rst_n
        );

//I/O port
input         clk_i;
input         rst_n;

//Internal Signles


wire [31:0]pc;
wire [31:0]pc_next;
wire [31:0]pc_back;
wire [31:0]pc_back_pre;
wire [31:0]instr_w;
wire [31:0]RSdata;
wire [31:0]RTdata;
wire [31:0]imm;
wire [31:0]Mux_ALUSrc_w;
wire [31:0]result;
wire [31:0] imm_sl_2_32;

wire [4:0] WriteReg1;
wire [4:0] WriteData;
wire [4:0] ReadReg1;
wire [4:0] ReadReg2;

wire [3:0] ALU_control;
wire [2:0] ALU_op;

wire RegDst;
wire RegWrite;
wire Branch;
wire ALUSrc;
wire zero;
wire cout;
wire overflow;
wire SinExt;



//Greate componentes
ProgramCounter PC(
    .clk_i(clk_i),
    .rst_n (rst_n),
    .pc_in_i(pc_back),
    .pc_out_o(pc)
    );

Adder Adder1(
        .src1_i(32'd4),
        .src2_i(pc),
        .sum_o(pc_next)
        );

Instr_Memory IM(
        .pc_addr_i(pc),
        .instr_o(instr_w)
        );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(instr_w[20:16]),
        .data1_i(instr_w[15:11]),
        .select_i(RegDst),
        .data_o(WriteReg1)
        );

Reg_File RF(
        .clk_i(clk_i),
        .rst_n(rst_n),
        .RSaddr_i(instr_w[25:21]),
        .RTaddr_i(instr_w[20:16]),
        .RDaddr_i(WriteReg1),
        .RDdata_i(result),
        .RegWrite_i (RegWrite),
        .RSdata_o(RSdata),
        .RTdata_o(RTdata)
        );

Decoder Decoder(
        .instr_op_i(instr_w[31:26]),
        .RegWrite_o(RegWrite),
        .ALU_op_o(ALU_op),
        .ALUSrc_o(ALUSrc),
        .RegDst_o(RegDst),
        .Branch_o(Branch),
        .SinExt_o(SinExt)
        );

ALU_Ctrl AC(
        .funct_i(instr_w[5:0]),
        .ALUOp_i(ALU_op),
        .ALUCtrl_o(ALU_control)
        );

Sign_Extend SE(
        .data_i(instr_w[15:0]),
        .data_o(imm),
        .select_i(SinExt)
        );

MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(RTdata),
        .data1_i(imm),
        .select_i(ALUSrc),
        .data_o(Mux_ALUSrc_w)
        );

alu ALU(
        .rst_n(rst_n),
        .src1(RSdata),
        .src2(Mux_ALUSrc_w),
        .ALU_control(ALU_control),
        .result(result),
        .zero(zero),
        .cout(cout),
        .overflow(overflow)
        );
Adder Adder2(
        .src1_i(imm_sl_2_32),
        .src2_i(pc_next),
        .sum_o(pc_back_pre)
        );

Shift_Left_Two_32 Shifter(
        .data_i(imm),
        .data_o(imm_sl_2_32)
        );

MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(pc_next),
        .data1_i(pc_back_pre),
        .select_i(Branch & zero),
        .data_o(pc_back)
        );

endmodule

