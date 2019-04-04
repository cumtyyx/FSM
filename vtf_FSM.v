`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:22:45 03/04/2019
// Design Name:   FSM
// Module Name:   C:/myfpga/project/FSM/testbench/vtf_FSM.v
// Project Name:  FSM
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: FSM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vtf_FSM;

	// Inputs
	reg clk;
	reg reset;
	reg a;

	// Outputs
	wire k1;
	wire k2;

	// Instantiate the Unit Under Test (UUT)
	FSM uut (
		.clk(clk), 
		.reset(reset), 
		.a(a), 
		.k1(k1), 
		.k2(k2)
	);

	initial 
		begin
			a = 0;
			reset = 1;
			clk = 0;
			#22 reset = 0;
			#133 reset = 1;
		end
		
	always #50 clk = ~clk;
	
	always@(posedge clk)
		begin
			#30 a = {$random}%2;
			#162;
		end
	initial
		#100000 $stop;
      
endmodule

