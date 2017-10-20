module test(clk,counter,in,out_H,out_L,data_shift1,data_shift2);
	input clk;
	output [3:0]counter;
	output [7:0]data_shift1,data_shift2;
	
	output reg [7:0]in;
	output [7:0]out_H;
	output [7:0]out_L;
	
	
	function [7:0]ROM;
		input [3:0]in;
		case(in)
			0:ROM=8'h22;
			1:ROM=8'h44;
			2:ROM=8'h50;
			3:ROM=8'h70;
			4:ROM=8'h76;
			5:ROM=8'h86;
			6:ROM=8'h54;
			7:ROM=8'h76;
			8:ROM=8'h88;
			9:ROM=8'h98;
			10:ROM=8'h42;
			11:ROM=8'h66;
			12:ROM=8'h66;
			13:ROM=8'h90;
			14:ROM=8'h86;
			default:ROM=8'h23;
		endcase
	endfunction
	
	reg clk_div;
	reg [3:0]counter;
	reg [7:0]data_even,data_odd,data_L;
	wire [7:0]data_shift1,data_shift2,data_H_ready,data_L_ready;
	reg [7:0]data_H_finish;
	reg [7:0]data_L_finish;
	reg finish;
	
	always@(posedge clk)begin
		in<=ROM(counter);
		if(counter>=2)begin
			if(counter[0])begin
				data_even<=in;
				data_L<=in;
			end
			else data_odd<=in;
		end
		counter<=counter+1;
		clk_div<=counter[0];
	end
	
	assign data_shift1=data_even>>1;
	assign data_H_ready=data_odd-data_shift1;

	always@(posedge clk_div)begin
		data_H_finish<=data_H_ready-data_shift1;
		finish<=!finish;
	end
	assign data_shift2=data_H_finish>>2;
	assign data_L_ready=data_L+data_shift2;
	always@(posedge finish)begin
		data_L_finish<=data_L_ready+data_shift2;
		//finish<=!finish;
	end
	
	assign out_H=data_H_finish;
	assign out_L=data_L_finish;
	
endmodule 