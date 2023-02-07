module sq_root_carry_adder_tb();
	reg [4:0]a;
	reg [4:0]b;
	reg c_in;
	wire [4:0]sum;
	wire c_out;
	
	sq_root_carry_adder u1(a,b,c_in,sum,c_out);
	initial begin
		$dumpfile("sq_root_save_test.vcd");
		$dumpvars(0);
		$monitor("a=%b b=%b c_in=%b sum=%b c_out=%b",a,b,c_in,sum,c_out);
	
		a = 5'b00101;
		b = 5'b10111;
		c_in =1'b0;
		#40;
		a = 5'b11111;
		b = 5'b11111;
		c_in =1'b1;
		#40;
	end
	



endmodule
