module linear_save_adder_tb();
	reg [7:0]a;
	reg [7:0]b;
	reg c_in;
	wire [7:0]sum;
	wire c_out;
	
	linear_save_adder u1(a,b,c_in,sum,c_out);
	initial begin
		$dumpfile("linear_save_test.vcd");
		$dumpvars(0);
		$monitor("a=%b b=%b c_in=%b sum=%b c_out=%b",a,b,c_in,sum,c_out);
	
		a = 8'b0010_1010;
		b = 8'b1011_0101;
		c_in =1'b0;
		#40;
		a = 8'b1111_1111;
		b = 8'b1111_1111;
		c_in =1'b1;
		#40;
	end
	



endmodule
