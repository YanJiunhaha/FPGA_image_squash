module test(clk,Rom,counter,even,odd,
				shift_H_out,sub_H_1_out,sub_H_2_out,
				shift_H_in ,sub_H_1_in ,sub_H_2_in,
				out_H,
				shift_L_out,sub_L_1_out,sub_L_2_out,
				shift_L_in ,sub_L_1_in ,sub_L_2_in ,
				out_L);
	input clk;
	output reg  [7:0]Rom;
	output reg  [5:0]counter;
	output reg  [7:0]even,odd;
	output wire [7:0]shift_H_out,sub_H_1_out,sub_H_2_out;
	output reg  [7:0]shift_H_in ,sub_H_1_in ,sub_H_2_in ;
	output reg  [7:0]out_H;
	output wire [7:0]shift_L_out,add_L_1_out,add_L_2_out;
	output reg  [7:0]shift_L_in ,add_L_1_in ,add_L_2_in ;
	output reg  [7:0]out_L;
	//
	assign shift_H_out=shift_H_in>>1;
	assign sub_H_1_out=sub_H_1_in-shift_H_out;
	assign sub_H_2_out=sub_H_2_in-shift_H_out;
	assign shift_L_out=shift_L_in>>2;
	assign add_L_1_out=add_L_1_in+shift_L_out;
	assign add_L_2_out=add_L_2_in+shift_L_out;
	//data
	always@(*)
	begin
		case(counter)
			7'd1:Rom=8'd145;
			7'd2:Rom=8'd56;
			7'd3:Rom=8'd49;
			7'd4:Rom=8'd89;
			7'd5:Rom=8'd137;
			7'd6:Rom=8'd90;
			7'd7:Rom=8'd62;
			7'd8:Rom=8'd33;
			7'd9:Rom=8'd71;
			7'd10:Rom=8'd77;
			7'd11:Rom=8'd92;
			7'd12:Rom=8'd145;
			7'd13:Rom=8'd153;
			7'd14:Rom=8'd108;
			7'd15:Rom=8'd74;
			7'd16:Rom=8'd146;
			7'd17:Rom=8'd183;
			7'd18:Rom=8'd120;
			7'd19:Rom=8'd80;
			7'd20:Rom=8'd93;
			7'd21:Rom=8'd73;
			7'd22:Rom=8'd90;
			7'd23:Rom=8'd102;
			7'd24:Rom=8'd66;
			7'd25:Rom=8'd72;
			7'd26:Rom=8'd121;
			7'd27:Rom=8'd121;
			7'd28:Rom=8'd71;
			7'd29:Rom=8'd57;
			7'd30:Rom=8'd146;
			7'd31:Rom=8'd173;
			7'd32:Rom=8'd66;
			7'd33:Rom=8'd69;
			7'd34:Rom=8'd137;
			7'd35:Rom=8'd139;
			7'd36:Rom=8'd88;
			7'd37:Rom=8'd77;
			7'd38:Rom=8'd60;
			7'd39:Rom=8'd170;
			7'd40:Rom=8'd88;
			7'd41:Rom=8'd36;
			7'd42:Rom=8'd70;
			7'd43:Rom=8'd160;
			7'd44:Rom=8'd157;
			7'd45:Rom=8'd61;
			7'd46:Rom=8'd110;
			7'd47:Rom=8'd93;
			7'd48:Rom=8'd125;
			7'd49:Rom=8'd143;
			7'd50:Rom=8'd106;
			7'd51:Rom=8'd76;
			7'd52:Rom=8'd116;
			7'd53:Rom=8'd115;
			7'd54:Rom=8'd112;
			7'd55:Rom=8'd163;
			7'd56:Rom=8'd182;
			7'd57:Rom=8'd148;
			7'd58:Rom=8'd98;
			7'd59:Rom=8'd168;
			7'd60:Rom=8'd156;
			7'd61:Rom=8'd86;
			7'd62:Rom=8'd164;
			7'd63:Rom=8'd193;
			default:Rom=8'd0;
		endcase
	end
	//counter 
	always@(posedge clk)begin
		counter<=counter+6'b1;
	end
	always@(posedge clk)begin
		
	end
	//
	
	
endmodule 