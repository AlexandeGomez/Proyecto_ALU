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
	output [(DATA_WIDTH-1) : 0] result_xor_top,
	
	
	output carry_flag_sum_top,
	output zero_flag_sum_top,
	output zero_flag_res_top,
	output zero_flag_pro_top,
	output zero_flag_and_top,
	output zero_flag_or_top,
	output zero_flag_nand_top,
	output zero_flag_nor_top,
	output zero_flag_xor_top,
	
	output carry_flag_top,
	output zero_flag_top
);

//--------------- SUMA -----------------
sum #( .DATA_WIDTH(DATA_WIDTH)) sum_dut( 
	//inputs
	.port_A	(portA_top),
	.port_B	(portB_top),
	//outputs
	.result	(result_sum_top),
	.carry_flag(carry_flag_sum_top),
	.zero_flag (zero_flag_sum_top)
);

//--------------- RESTA ------------------
rest #( .DATA_WIDTH(DATA_WIDTH)) rest_dut(
	//inputs
	.port_A	(portA_top),
	.port_B	(portB_top),
	//outputs
	.result	(result_res_top),
	.zero_flag (zero_flag_res_top)
);

//--------------- PRODUCTO ---------------
prod #( .DATA_WIDTH(DATA_WIDTH)) prod_dut(
	//inputs
	.port_A	(portA_top),
	.port_B	(portB_top),
	//outputs
	.result	(result_pro_top),
	.zero_flag (zero_flag_pro_top)
);

//----------------- AND ---------------------
and_oper #( .DATA_WIDTH(DATA_WIDTH)) and_dut(
	//input
	.port_A	(portA_top),
	.port_B	(portB_top),
	//output
	.result	(result_and_top),
	.zero_flag (zero_flag_and_top)
);

//------------------- OR ------------------
or_oper #( .DATA_WIDTH(DATA_WIDTH)) or_dut(
	//input
	.port_A	(portA_top),
	.port_B	(portB_top),
	//output
	.result	(result_or_top),
	.zero_flag (zero_flag_or_top)
);

//------------------- NAND --------------------
nand_oper #( .DATA_WIDTH(DATA_WIDTH)) nand_dut(
	//input
	.port_A	(portA_top),
	.port_B	(portB_top),
	//output
	.result	(result_nand_top),
	.zero_flag (zero_flag_nand_top)
);

//-------------------- NOR ------------------
nor_oper #(	.DATA_WIDTH(DATA_WIDTH)) nor_dut(
	//input
	.port_A	(portA_top),
	.port_B	(portB_top),
	//output
	.result	(result_nor_top),
	.zero_flag (zero_flag_nor_top)
);

//---------------------- XOR ----------------
xor_oper #( .DATA_WIDTH(DATA_WIDTH)) xor_dut(
	//input
	.port_A	(portA_top),
	.port_B	(portB_top),
	//output
	.result	(result_xor_top),
	.zero_flag (zero_flag_xor_top)
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

flags flag_dut(
	//inputs
	.clk					(clk_top),
	.opcode				(opcode_top),
	
	.carry_flag_sum	(carry_flag_sum_top),
	.zero_flag_sum		(zero_flag_sum_top),
	
	.zero_flag_res		(zero_flag_res_top),
	.zero_flag_pro		(zero_flag_pro_top),
	.zero_flag_and		(zero_flag_and_top),
	.zero_flag_or		(zero_flag_or_top),
	.zero_flag_nand	(zero_flag_nand_top),
	.zero_flag_nor		(zero_flag_nor_top),
	.zero_flag_xor		(zero_flag_xor_top),
	
	//outputs
	.carry_flag			(carry_flag_top),
	.zero_flag			(zero_flag_top)
);

endmodule
