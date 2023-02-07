module carry_bypass_adder(input [3:0]a,
	input [3:0]b,
	input c_in,
	output [3:0]sum,
	output c_out);
	
	wire e1;
	wire [3:0]e2;
	wire c_internal_out;
	
	propagate u1(a,b,e2,e1);
	ripple_carry_adder u2(a,b,c_in,sum,c_internal_out);
	multiplex u3(e1,c_internal_out,c_in,c_out);
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

module propagate(
	input [3:0]a,b,
	output [3:0]c,
	output P);
	
	
	assign c = a^b;
	assign P = &c;

endmodule


module multiplex(
	input s,d0,d1,
	output Y
	);
	
	assign Y = ((~s)&d0)|(s&d1);
endmodule 
