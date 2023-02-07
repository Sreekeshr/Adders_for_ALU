module linear_save_adder(
	input [7:0]a,b,
	input c_in,
	output [7:0]sum,
	output c_out
	);
	
	
	wire w1,w2,w3;
	wire [3:0]samp_sum00,samp_sum01,samp_sum10,samp_sum11;
	wire c_out00,cout01,mux_c0,c_out10,c_out11;
	
	// adder u_addername_carry
	ripple_carry_adder u00(a[3:0],b[3:0],1'b0,samp_sum00,c_out00);
	ripple_carry_adder u01(a[3:0],b[3:0],1'b1,samp_sum01,c_out01);
	multiplex2to1 m0(.select(c_in),.s0(samp_sum00),.s1(samp_sum01),.c0(c_out00),.c1(c_out01),.res(sum[3:0]),.c_out(mux_c0));

	ripple_carry_adder u10(a[7:4],b[7:4],1'b0,samp_sum10,c_out10);
	ripple_carry_adder u11(a[7:4],b[7:4],1'b1,samp_sum11,c_out11);
	multiplex2to1 m1(.select(mux_c0),.s0(samp_sum10),.s1(samp_sum11),.c0(c_out10),.c1(c_out11),.res(sum[7:4]),.c_out(c_out));
	
	
	
endmodule
	
module ripple_carry_adder(
	input [3:0]a,
	input [3:0]b,
	input c_in,
	output [3:0]sum,
	output c_out
	);
	
	wire w1,w2,w3,w4;
	full_adder u1(a[0],b[0],c_in,sum[0],w1);
	full_adder u2(a[1],b[1],w1,sum[1],w2);
	full_adder u3(a[2],b[2],w2,sum[2],w3);
	full_adder u4(a[3],b[3],w3,sum[3],c_out);
endmodule

module full_adder(
	input a,b,c_in,
	output sum,c_out
	);

	assign sum = a^b^c_in;
	assign c_out = ((a^b)&c_in)|(a&b) ;

endmodule

module multiplex2to1(
	input select,c0,c1,
	input [3:0]s0,s1,
	output [3:0]res,
	output c_out
	);

	assign c_out = ((~select)&c0)|(select&c1);
	assign res = (select == 0) ? s0 : s1; 

endmodule

























