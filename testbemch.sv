module testbench();

timeunit 10ns;	// Half clock cycle at 50 MHz
			// This is the amount of time represented by #1
timeprecision 1ns;

// These signals are internal because the processor will be
// instantiated as a submodule in testbench.
logic Clk = 0;
logic Reset, ClearA_LoadB, Execute;
logic [7:0] SW;
logic X;
logic [7:0] Aval,
		 Bval;
logic [6:0] AhexL,
		  AhexU,
		  BhexL,
		  BhexU;



// Instantiating the DUT
// Make sure the module and signal names match with those in your design
multiplier multiplier0(.*);

// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end

// Testing begins here
// The initial block is not synthesizable
// Everything happens sequentially inside an initial block
// as in a software program
initial begin: TEST_VECTORS
Reset = 0;		// Toggle Rest
ClearA_LoadB = 1;
Execute = 1;
SW = 8'b11000101;	// Specify SW

#2 Reset = 1;

#2 ClearA_LoadB = 0;	// Toggle LoadB
#2 ClearA_LoadB = 1;

#2 SW = 8'b00000111;	// now the multiplier is 00000111

#2 Execute = 0;	// begin our first calculation -59*7

#40 Execute = 1; // togle Execute

#2 ClearA_LoadB = 0;	// Toggle LoadB
#2 ClearA_LoadB = 1; //now register B becomes 00000111
#2 SW = 8'b11000101; //now the multiplier is 11000101
#2 Execute = 0;//compute 7*-59
#40 Execute = 1; // togle Execute

#2 ClearA_LoadB = 0;	// Toggle LoadB
#2 ClearA_LoadB = 1; // now the register B becomes 11000101
#2 SW = 8'b11111001; // now the multiplier is -7

#2 Execute = 0;	// begin our first calculation -59*7
#40 Execute = 1; // togle Execute

#32 SW = 8'b00000111;
#2 ClearA_LoadB = 0;	// Toggle LoadB
#2 ClearA_LoadB = 1; // now the register B becomes 00000111
#2 SW = 8'b00111011; // NOW THE multiplier is 59
#2 Execute = 0; // we now start the second computation:7*59
#9 Execute =1;







end
endmodule
