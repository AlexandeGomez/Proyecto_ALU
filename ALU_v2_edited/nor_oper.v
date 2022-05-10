module nor_oper #(parameter DATA_WIDTH = 8)(
	//input
	input [(DATA_WIDTH-1) : 0] port_A,
	input [(DATA_WIDTH-1) : 0] port_B,
	//output
	output [(DATA_WIDTH-1) : 0] result,
	
	output zero_flag
);

assign result = ~(port_A | port_B);

assign zero_flag = (result==0)? 1'b1 : 1'b0;

endmodule