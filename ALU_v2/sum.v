module sum #(parameter DATA_WIDTH = 8)(
	//inputs
	input signed [(DATA_WIDTH-1) : 0] port_A,
	input signed [(DATA_WIDTH-1) : 0] port_B,
	//outputs
	output signed [(DATA_WIDTH) : 0] result
);

assign result = port_A + port_B; 

endmodule 
