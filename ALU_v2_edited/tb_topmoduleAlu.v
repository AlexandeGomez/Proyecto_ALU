module tb_topmoduleAlu #(parameter DATA_WIDTH = 8)();

//inputs
reg clk_tb;
reg [2:0] opcode_tb;
reg [(DATA_WIDTH-1) : 0] portA_tb;
reg [(DATA_WIDTH-1) : 0] portB_tb;
//output
wire [(DATA_WIDTH*2)-1 : 0] out_tb;
wire [(DATA_WIDTH) : 0] result_sum_tb;
wire [(DATA_WIDTH) : 0] result_res_tb;
wire [(DATA_WIDTH*2)-1 : 0] result_pro_tb;
wire [(DATA_WIDTH-1) : 0] result_and_tb;
wire [(DATA_WIDTH-1) : 0] result_or_tb;
wire [(DATA_WIDTH-1) : 0] result_nand_tb;
wire [(DATA_WIDTH-1) : 0] result_nor_tb;
wire [(DATA_WIDTH-1) : 0] result_xor_tb;

wire carry_flag_sum_tb;
wire zero_flag_sum_tb;
wire zero_flag_res_tb;
wire zero_flag_pro_tb;
wire zero_flag_and_tb;
wire zero_flag_or_tb;
wire zero_flag_nand_tb;
wire zero_flag_nor_tb;
wire zero_flag_xor_tb;
	
wire carry_flag_tb;
wire zero_flag_tb;


integer i;

top_moduleAlu#( .DATA_WIDTH(DATA_WIDTH)) dut(
	//input
	.clk_top				(clk_tb),
	.opcode_top			(opcode_tb),
	.portA_top			(portA_tb),
	.portB_top			(portB_tb),
	//output
	.out_top				(out_tb),
	.result_sum_top	(result_sum_tb),
	.result_res_top	(result_res_tb),
	.result_pro_top	(result_pro_tb),
	.result_and_top	(result_and_tb),
	.result_or_top		(result_or_tb),
	.result_nand_top	(result_nand_tb),
	.result_nor_top	(result_nor_tb),
	.result_xor_top	(result_xor_tb),
	
	.carry_flag_sum_top(carry_flag_sum_tb),
	.zero_flag_sum_top (zero_flag_sum_tb),
	.zero_flag_res_top (zero_flag_res_tb),
	.zero_flag_pro_top (zero_flag_pro_tb),
	.zero_flag_and_top (zero_flag_and_tb),
	.zero_flag_or_top  (zero_flag_or_tb),
	.zero_flag_nand_top(zero_flag_nand_tb),
	.zero_flag_nor_top (zero_flag_nor_tb),
	.zero_flag_xor_top (zero_flag_xor_tb),
	
	.carry_flag_top	 (carry_flag_tb),
	.zero_flag_top		 (zero_flag_tb)
);

initial begin
	clk_tb = 1'b0;
	#2;
	portA_tb = 8'b0000_1100; //12
	portB_tb = 8'b0001_0000; //16
	#34;
	portA_tb = 8'b0010_0000; //32
	portB_tb = 8'b1100_1111; //-49
	#32;
	portA_tb = 8'b1000_0001; //-127
	portB_tb = 8'b1011_0110; //-74
	#32;
	portA_tb = 8'b0111_1111; //127
	portB_tb = 8'b1000_0001; //-127
	#32;
	$stop;
	
end

always begin
	#4;
	for(i=0; i<8; i=i+1)begin
		opcode_tb = i;
		if(i!=7)
			#4;
	end
end

always#2 clk_tb = ~clk_tb;

endmodule
