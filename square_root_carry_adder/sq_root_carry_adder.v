module sq_root_carry_adder(
	input [4:0]a,b,
	input c_in,
	output [4:0]sum,
	output c_out
	);
	
	wire c00,c01,C_1,c10,c11;
	wire [1:0]s00,s01;
	wire [2:0]s10,s11;
	
	ripple_carry_2bit_sum r00(.a(a[1:0]),.b(b[1:0]),.c_in(1'b0),.sum(s00),.c_out(c00));
	ripple_carry_2bit_sum r01(.a(a[1:0]),.b(b[1:0]),.c_in(1'b1),.sum(s01),.c_out(c01));
	multiplex2to1_2bit m0(.select(c_in),.sum1(s00),.sum2(s01),.carry1(c00),.carry2(c01),.sum_out(sum[1:0]),.carry_out(C_1));
	
	ripple_carry_3bit_sum r10(a[4:2],b[4:2],1'b0,s10,c10);
	ripple_carry_3bit_sum r11(a[4:2],b[4:2],1'b1,s11,c11);
	multiplex2to1_3bit m1(.select(C_1),.sum1(s10),.sum2(s11),.carry1(c10),.carry2(c11),.sum_out(sum[4:2]),.carry_out(c_out));
	

endmodule

module ripple_carry_3bit_sum(
	input [2:0]a,
	input [2:0]b,
	input c_in,
	output [2:0]sum,
	output c_out
);

	wire w1,w2;
	full_adder u1(a[0],b[0],c_in,sum[0],w1);
	full_adder u2(a[1],b[1],w1,sum[1],w2);
	full_adder u3(a[2],b[2],w2,sum[2],c_out);
	
endmodule

module ripple_carry_2bit_sum(
	input [1:0]a,
	input [1:0]b,
	input c_in,
	output [1:0]sum,
	output c_out
);

	wire w1;
	full_adder u1(a[0],b[0],c_in,sum[0],w1);
	full_adder u2(a[1],b[1],w1,sum[1],c_out);
	
endmodule

module full_adder(
	input a,b,c_in,
	output sum,c_out
	);

	assign sum = a^b^c_in;
	assign c_out = ((a^b)&c_in)|(a&b) ;

endmodule

module multiplex2to1_2bit(
	input select,
	input [1:0]sum1,sum2,
	input carry1,carry2,
	output [1:0]sum_out,
	output carry_out
	);
	
	assign sum_out = (select == 0) ? sum1:sum2;
	assign carry_out = (select == 0) ? carry1:carry2;
endmodule

module multiplex2to1_3bit(
	input select,
	input [2:0]sum1,sum2,
	input carry1,carry2,
	output [2:0]sum_out,
	output carry_out
	);
	
	assign sum_out = (select == 0) ? sum1:sum2;
	assign carry_out = (select == 0) ? carry1:carry2;
endmodule
