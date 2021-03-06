module and_oper #(parameter DATA_WIDTH = 8)(
	//input
	input [(DATA_WIDTH-1) : 0] port_A,
	input [(DATA_WIDTH-1) : 0] port_B,
	//output
	output [(DATA_WIDTH-1) : 0] result
);

assign result = port_A & port_B;

endmodule
