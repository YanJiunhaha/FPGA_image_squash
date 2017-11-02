module squash(clk,data_in,data_H,data_L);
	input 				clk;
	output reg [7:0]	data_in;
	output reg [7:0]	data_H;
	output reg [7:0]	data_L;
	
	reg [3:0]counter;
	reg [7:0]data_even,data_odd;
	reg [7:0]data_buffer_H;
	reg [7:0]data_buffer_L;
	 
	function [7:0]ROM_data;
		input [3:0]addr;
		case(addr)
			8'd0 : ROM_data = 22 ;
			8'd1 : ROM_data = 44 ;
			8'd2 : ROM_data = 50 ;
			8'd3 : ROM_data = 70 ;
			8'd4 : ROM_data = 76 ;
			8'd5 : ROM_data = 86 ;
			8'd6 : ROM_data = 54 ;
			8'd7 : ROM_data = 76 ;
			8'd8 : ROM_data = 88 ;
			8'd9 : ROM_data = 98 ;
			8'd10 : ROM_data = 42 ;
			8'd11 : ROM_data = 66 ;
			8'd12 : ROM_data = 66 ;
			8'd13 : ROM_data = 90 ;
			8'd14 : ROM_data = 86 ;
			default: ROM_data = 0;
		endcase
	endfunction
	
	always@(posedge clk)
		counter<=counter+1;
		
	always@(posedge clk)
	 data_in=ROM_data(counter);
	
	always@(posedge counter[0])begin
		data_odd=data_in;
		data_H=data_buffer_H-(data_odd>>1);
	end
	
	always@(negedge counter[0])begin
		data_even=data_in;
		data_buffer_H=data_even-(data_odd>>1);
		data_buffer_L=data_odd+(data_H>>2);
	end
	
	always@(negedge counter[0])begin
		data_L=data_buffer_L+(data_H>>2);
	end
	
	
endmodule 
