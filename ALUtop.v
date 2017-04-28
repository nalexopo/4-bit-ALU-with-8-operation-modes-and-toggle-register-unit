module AluTop(
input [2:0] Opcode,
input[3:0] Data,
input Go, clk, rst,
output [4:0]Alu_out,
output Led_idle,Led_wait,Led_rdy
    );
wire lod;
wire [3:0]Rout;
////////////////////////TOP MODULE ARCHITECTURE\\\\\\\\\\\\\\\\\\\\	 
ALU alu1(
.Data_A(Data),
.Data_B(Rout),
.Op_code(Opcode),
.Alu_out(Alu_out) 
    );

RegisterALU R_Alu(
.clk(clk),
.rst(rst),
.Load(lod),
.Data(Data),
.Regout(Rout)
    );
	 
Toggle_Alu T_Alu(
.Go(Go),
.clk(clk),
.rst(rst),
.Load(lod),
.Led_idle(Led_idle), 
.Led_wait(Led_wait), 
.Led_rdy (Led_rdy)
);

endmodule
