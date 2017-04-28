module Toggle_Alu(
input Go, clk, rst,
output reg Load, Led_idle, Led_wait, Led_rdy
    );
	 
//toggle controller
parameter S_idle = 6'b000_001, 
          S_Load = 6'b000_010, 
			 S_Wait = 6'b000_100, 
			 S_Ready= 6'b001_000, //State declare
			 Error=   6'b010_000,
			 RESET=	 6'b100_000;
reg [5:0] State;

always @ (posedge clk) begin
if(rst) begin
		State <= RESET; //rst points to reset state
		
end
	else 
		begin
			case (State)
			Error: State <= RESET;
			RESET:	begin
						Led_idle<=1'b0;
						Led_wait<=1'b0; //reset state initiliazation
						Led_rdy<=1'b0;
						Load<=1'b0;
						State <= S_idle; // points to idle state
						end
			S_idle:  begin
						Led_idle<=1'b1;
						if(Go)State<=S_Load;  //Idle state assert idle led and points to S_load state when button Go pressed
						end
			S_Load:  begin
						Led_idle<=1'b0; //load state deasserts idle flag and asserts Load signal to the register
						Load<=1'b1;
						State<=S_Wait; //automatically transfered to wait state
						end
			S_Wait:  begin
						Load<=1'b0;//wait state points to ready state as soon as button is released
						Led_wait<=1'b1;
						if(!Go)State<=S_Ready;
						end
			S_Ready: begin
			         Led_wait<=1'b0; //ready state waits for button press to point to Load state again
						Led_rdy<=1'b1;
						if(Go)State<=S_Load;	
						end
default:State<=Error;
endcase						
end
end
endmodule
