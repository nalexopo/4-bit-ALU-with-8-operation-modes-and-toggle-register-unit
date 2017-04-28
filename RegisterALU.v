module RegisterALU(
input clk,rst,Load,
input [3:0] Data,
output reg [3:0] Regout
    );
	 //register to save value for DATA_B input using the same switches as in DATA_A input.
always @ (posedge clk) 
begin
if (rst) Regout<=4'd0;
else if (Load) Regout<=Data;  // Load is asserted from toggle control unit
else Regout<=Regout;
end
endmodule
