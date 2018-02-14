// Top Level Code for 8-bit Multiplier

module multiplier (input logic  Clk,            // Internal
                                Reset,          // Push button 0
                                ClearA_LoadB,   // Push button 2
                                Execute,        // Push button 3
                  input  logic [7:0]  SW,
                  output logic [3:0]  LED,
                  output logic [7:0]  Aval,
                                      Bval,
                  output logic [6:0]  AhexL,
                                      AhexU,
                                      BhexL,
                                      BhexU);

	 //local logic variables go here
	 logic Reset_SH, ClearA_LoadB_SH, Execute_SH;
	 logic X, opA, M, Shift_En;
	 logic [7:0] A, B, SW_S;
   logic [8:0] result;


	 //We can use the "assign" statement to do simple combinational logic
	 assign Aval = A;
	 assign Bval = B;

	 //Instantiation of the double register module
	 register_unit    reg_unit (
                        .Clk(Clk),
                        .Reset_A(Reset_SH | Clear),
                        .Reset_B(Reset_SH),
                        .Ld_A(Add),
                        .Ld_B(ClA_LdB),
                        .Shift_En,
                        .D_A(result[7:0]),
                        .D_B(SW)
                        .A_In(X),
                        .B_In(opA),
                        .A_out(opA),
                        .B_out(M),
                        .A(A),
                        .B(B) );


	 control          control_unit (.Clk(Clk),
                                  .Reset_A(Reset_SH),
                                  .ClA_LdB(ClearA_LoadB_SH),
                                  .Execute(Execute_SH),
                                  .Shift_En,
                                  .Add,
                                  .Sub,
                                  .Clr_Ld,
                                  .Clear);

	 HexDriver        HexAL (
                        .In0(A[3:0]),
                        .Out0(AhexL) );
	 HexDriver        HexBL (
                        .In0(B[3:0]),
                        .Out0(BhexL) );

	 //When you extend to 8-bits, you will need more HEX drivers to view upper nibble of registers, for now set to 0
   //UPDATE: In oder to have the Hex display work correctly, we modify the input for the hex display
	 HexDriver        HexAU (
                        .In0(A[7:4]),
                        .Out0(AhexU) );
	 HexDriver        HexBU (
                       .In0(B[7:4]),
                        .Out0(BhexU) );

	  //Input synchronizers required for asynchronous inputs (in this case, from the switches)
	  //These are array module instantiations
	  //Note: S stands for SYNCHRONIZED, H stands for active HIGH
	  //Note: We can invert the levels inside the port assignments
	  sync button_sync[4:0] (Clk, {~Reset, ~ClearA_LoadB, ~Execute}, {Reset_SH, ClearA_LoadB_SH, Execute_SH});
	  sync Din_sync[7:0] (Clk, SW, SW_S);

endmodule
