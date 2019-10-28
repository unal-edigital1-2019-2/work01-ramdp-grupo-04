`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:32:31 10/26/2019
// Design Name:   ram
// Module Name:   /home/david/Escritorio/digital/laboratorio/programas/ram/testbenchram.v
// Project Name:  ram
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbenchram;

	// Inputs
	reg clk;
	reg [16:0] addr_in;
	reg [15:0] data_in;
	reg regwrite;
	reg [16:0] addr_out;
	reg regread;

	// Outputs
	wire [15:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	ram uut (
		.clk(clk), 
		.addr_in(addr_in), 
		.data_in(data_in), 
		.regwrite(regwrite), 
		.data_out(data_out), 
		.addr_out(addr_out), 
		.regread(regread)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		addr_in = 0;
		data_in = 0;
		regwrite = 0;
		addr_out = 0;
		regread = 0;

		// Wait 100 ns for global reset to finish
		#100;
   regread=1;
	  for (addr_out = 76000; addr_out < 76008; addr_out = addr_out + 1) begin
			 
			 #5 $display("el valor de memoria %d =  %d", addr_out,data_out) ;

		  end 
		regread=0;
		  #10 
		  addr_in=0;
		  data_in=4;
		  regwrite=1;
		  
		  #10 
		  regwrite=0;
		  addr_out=0;
		  regread=1;
		  #2
		  $display("el valor de memoria %d =  %d", addr_out,data_out) ;

		  
		// Add stimulus here

	end
    always #1 clk= ~clk; 
endmodule

