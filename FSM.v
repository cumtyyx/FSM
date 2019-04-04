`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:13:54 03/04/2019 
// Design Name: 
// Module Name:    FSM 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module FSM(clk,reset,a,k1,k2);
	input clk,reset,a;
	output k1,k2;
	reg k1,k2;
	reg[3:0] state;
		parameter idle = 4'b1000,
				  start = 4'b0100,
				  stop = 4'b0010,
				  clear = 4'b0001;
					always@(posedge clk)
						if(!reset)
							begin
								state <= idle;
								k2 <= 0;
								k1 <= 0;
							end
						else
							case(state)
								idle:
									if(a)
										begin
											state <= start;
											k1 <= 0;
										end
									else
										begin
											state <= idle;
											k2 <= 0;
											k1 <= 0;
										end
								start:
									if(!a)
										state <= stop;
									else
										state <= start;
								stop:
									if(a)
										begin
											state <= clear;
											k2 <= 1;
										end
									else
										state <= stop;
								clear:
									if(!a)
										begin
											state <= idle;
											k2 <= 0;
											k1 <= 0;
										end
									else
										state <= clear;
								default:state <= idle;
							endcase
							
endmodule
