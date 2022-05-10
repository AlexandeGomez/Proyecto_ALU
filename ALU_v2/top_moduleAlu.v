module top_moduleAlu#(parameter DATA_WIDTH = 8)(
	//input
	input clk_top,
	input [2:0] opcode_top,
	input [(DATA_WIDTH-1) : 0] portA_top,
	input [(DATA_WIDTH-1) : 0] portB_top,
	//output
	output [(DATA_WIDTH*2)-1 : 0] out_top,
	
	output [(DATA_WIDTH) : 0] result_sum_top,
	output [(DATA_WIDTH) : 0] result_res_top,
	output [(DATA_WIDTH*2)-1 : 0] result_pro_top,
	output [(DATA_WIDTH-1) : 0] result_and_top,
	output [(DATA_WIDTH-1) : 0] result_or_top,
	output [(DATA_WIDTH-1) : 0] result_nand_top,
	output [(DATA_WIDTH-1) : 0] result_nor_top,
	output [(DATA_WIDTH-1) : 0] result_xor_top
);

//--------------- SUMA -----------------
sum #( .DATA_WIDTH(DATA_WIDTH)) sum_dut( 
	//inputs
	.port_A	(portA_top),
	.port_B	(portB_top),
	//outputs
	.result	(result_sum_top)
);

//--------------- RESTA ------------------
rest #( .DATA_WIDTH(DATA_WIDTH)) rest_dut(
	//inputs
	.port_A	(portA_top),
	.port_B	(portB_top),
	//outputs
	.result	(result_res_top)
);

//--------------- PRODUCTO ---------------
prod #( .DATA_WIDTH(DATA_WIDTH)) prod_dut(
	//inputs
	.port_A	(portA_top),
	.port_B	(portB_top),
	//outputs
	.result	(result_pro_top)
);

//----------------- AND ---------------------
and_oper #( .DATA_WIDTH(DATA_WIDTH)) and_dut(
	//input
	.port_A	(portA_top),
	.port_B	(portB_top),
	//output
	.result	(result_and_top)
);

//------------------- OR ------------------
or_oper #( .DATA_WIDTH(DATA_WIDTH)) or_dut(
	//input
	.port_A	(portA_top),
	.port_B	(portB_top),
	//output
	.result	(result_or_top)
);

//------------------- NAND --------------------
nand_oper #( .DATA_WIDTH(DATA_WIDTH)) nand_dut(
	//input
	.port_A	(portA_top),
	.port_B	(portB_top),
	//output
	.result	(result_nand_top)
);

//-------------------- NOR ------------------
nor_oper #(	.DATA_WIDTH(DATA_WIDTH)) nor_dut(
	//input
	.port_A	(portA_top),
	.port_B	(portB_top),
	//output
	.result	(result_nor_top)
);

//---------------------- XOR ----------------
xor_oper #( .DATA_WIDTH(DATA_WIDTH)) xor_dut(
	//input
	.port_A	(portA_top),
	.port_B	(portB_top),
	//output
	.result	(result_xor_top)
);

//----------------- CONTROLADOR ----------------
controlador#( .DATA_WIDTH(DATA_WIDTH)) cont_dut(
	//input
	.clk				(clk_top),
	.opcode			(opcode_top),
	
	.result_sum		(result_sum_top),
	.result_res		(result_res_top),
	.result_pro		(result_pro_top),
	.result_and		(result_and_top),
	.result_or		(result_or_top),
	.result_nand	(result_nand_top),
	.result_nor		(result_nor_top),
	.result_xor		(result_xor_top),
	
	//output
	.data				(out_top)
);

endmodule
