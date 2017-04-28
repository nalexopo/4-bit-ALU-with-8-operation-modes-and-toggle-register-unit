module ALU(
input [3:0] Data_A, Data_B,
input [2:0] Op_code,
output reg [4:0] Alu_out 
    );
always @ * 
begin
case (Op_code)
0: Alu_out=Data_A + Data_B;
1: Alu_out=Data_A - Data_B;
2: Alu_out={0,~Data_A};
3: Alu_out={0,~Data_B};
4: Alu_out=Data_A & Data_B;  /////////////ALU AS COMBINATIONAL LOGIC\\\\\\\\\\\\\\\\\\\\\
5: Alu_out=Data_A | Data_B;
6: Alu_out={4'b0000,|Data_A};
7: Alu_out={4'b0000,&Data_B};
default : Alu_out=5'd0;
endcase
end

endmodule
