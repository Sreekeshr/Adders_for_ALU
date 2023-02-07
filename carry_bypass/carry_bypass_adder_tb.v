module carry_bypass_adder_tb();
	reg [3:0]a;
	reg [3:0]b;
	reg c_in;
	wire [3:0]sum;
	wire c_out;
	
	carry_bypass_adder u1(a,b,c_in,sum,c_out);
	initial begin
		$dumpfile("four_bit_test.vcd");
		$dumpvars(0);
		$monitor("a=%b b=%b c_in=%b sum=%b c_out=%b",a,b,c_in,sum,c_out);
		
		a = 4'b1110;
		b = 4'b0101;
		c_in =1'b1;
		#10;
		a = 4'b1010;
		b = 4'b0101;
		c_in =1'b0;
		#10;
		a = 4'b1111;
		b = 4'b1111;
		c_in =1'b1;
		#10;

	end
	
	
endmodule
