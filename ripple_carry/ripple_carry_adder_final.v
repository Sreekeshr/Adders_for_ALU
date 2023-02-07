module ripple_carry_adder_final(
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

