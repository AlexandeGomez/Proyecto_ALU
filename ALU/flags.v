module flags(
	//inputs
	input clk,
	input [2:0] opcode,
	
	input carry_flag_sum,
	input zero_flag_sum,
	
	input zero_flag_res,
	input zero_flag_pro,
	input zero_flag_and,
	input zero_flag_or,
	input zero_flag_nand,
	input zero_flag_nor,
	input zero_flag_xor,
	
	//outputs
	output reg carry_flag,
	output reg zero_flag
);

parameter SUM=3'b000,RES=3'b001,PRO=3'b010,ANDS=3'b011,ORS=3'b100,NANDS=3'b101,NORS=3'b110,XORS=3'b111;

always@(posedge clk) begin
	case(opcode)
		SUM:
			begin
				carry_flag <= carry_flag_sum;
				zero_flag <= zero_flag_sum;
			end
		RES:
			begin
				carry_flag <= 0;
				zero_flag <= zero_flag_res;
			end
		PRO:
			begin
				carry_flag <= 0;
				zero_flag <= zero_flag_pro;
			end
		ANDS:
			begin
				carry_flag <= 0;
				zero_flag <= zero_flag_and;
			end
		ORS:
			begin
				carry_flag <= 0;
				zero_flag <= zero_flag_or;
			end
		NANDS:
			begin
				carry_flag <= 0;
				zero_flag <= zero_flag_nand;
			end
		NORS:
			begin
				carry_flag <= 0;
				zero_flag <= zero_flag_nor;
			end
		XORS:
			begin
				carry_flag <= 0;
				zero_flag <= zero_flag_xor;
			end
		default:
			begin
				carry_flag <= 0;
				zero_flag <= 0;
			end
		endcase
end

endmodule
