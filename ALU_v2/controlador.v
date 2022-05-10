module controlador#(parameter DATA_WIDTH = 8)(
	//input
	input clk,
	input [2:0] opcode,
	
	input [(DATA_WIDTH) 		: 0] result_sum,
	input [(DATA_WIDTH) 		: 0] result_res,
	input [(DATA_WIDTH*2)-1 : 0] result_pro,
	input [(DATA_WIDTH-1) 	: 0] result_and,
	input [(DATA_WIDTH-1) 	: 0] result_or,
	input [(DATA_WIDTH-1) 	: 0] result_nand,
	input [(DATA_WIDTH-1) 	: 0] result_nor,
	input [(DATA_WIDTH-1) 	: 0] result_xor,
	
	//output
	output reg [(DATA_WIDTH*2)-1 : 0] data
);

parameter SUM=3'b000,RES=3'b001,PRO=3'b010,ANDS=3'b011,ORS=3'b100,NANDS=3'b101,NORS=3'b110,XORS=3'b111;

always@(posedge clk) begin
	case (opcode)
		SUM:
			begin
				data <= {{(DATA_WIDTH-1){result_sum[DATA_WIDTH]}},result_sum};
			end
		RES:
			begin
				data <= {{(DATA_WIDTH-1){result_res[DATA_WIDTH]}},result_res};
			end
		PRO:
			begin
				data <= result_pro;
			end
		ANDS:
			begin
				data <= {{(DATA_WIDTH){1'b0}},result_and};
			end
		ORS:
			begin
				data <= {{(DATA_WIDTH){1'b0}},result_or};
			end
		NANDS:
			begin
				data <= {{(DATA_WIDTH){1'b0}},result_nand};
			end
		NORS:
			begin
				data <= {{(DATA_WIDTH){1'b0}},result_nor};
			end
		XORS:
			begin
				data <= {{(DATA_WIDTH){1'b0}},result_xor};
			end
		default:
			data <= {(DATA_WIDTH*2){1'b0}};
	endcase
end

endmodule
