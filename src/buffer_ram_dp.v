`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:22:08 10/22/2019 
// Design Name: 
// Module Name:    ram 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ram #(

	parameter AW = 17, // Cantidad de bits  de la dirección 
	parameter DW = 16, // cantidad de Bits de los datos 
	parameter   imagenFILE= "imagen.men")
	(  
	input  clk,
	
	input  [AW-1: 0] addr_in, 
	input  [DW-1: 0] data_in,
	input  regwrite, 
	
	output reg [DW-1: 0] data_out,
	input [AW-1: 0] addr_out, 
	input regread
	);

//-- Calcular el numero de posiciones totales de memoria 
localparam NPOS = 2 ** AW; //-- Memoria

 reg [DW-1: 0] ram [0: NPOS-1]; 

//-- Lectura/escritura  de la memoria port 1 
always @(posedge clk) begin 
       if (regwrite == 1) 
             ram[addr_in] <= data_in;
end

//-- Lectura/escritura  de la memoria port 2 
always @(posedge clk) begin 
       if (regread == 1) 
           data_out <= ram[addr_out]; 
end
 
initial begin
	$readmemh(imagenFILE, ram);
end

endmodule
