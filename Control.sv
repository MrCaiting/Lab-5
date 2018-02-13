//Code for the control unit
//Two-always example for state machine

module control (input  logic Clk, Reset, LlA_LdB, Execute, M,
                output logic Shift_En, Add, Sub, Clr_Ld, Clear);

    // Declare signals curr_state, next_state of type enum
    // with enum values of A, B, ..., F as the state values
	  // Note that the length implies a max of 8 states, so you will need to bump this up for 8-bits
    // UPDATE: modified for the expanded bit input
    enum logic [4:0] {S, A, B, C, D, E, F, G, H, I, J}   curr_state, next_state;

	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)
    begin
        if (Reset)
            curr_state <= A;
        else
            curr_state <= next_state;
    end

    // Assign outputs based on state
	always_comb
    begin

		  next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        unique case (curr_state)

            A :    if (Execute)
                       next_state = B;
            B :    next_state = C;
            C :    next_state = D;
            D :    next_state = E;
            E :    next_state = F;
            F :    next_state = G;
            G :    next_state = H;
            H :    next_state = I;
            I :    next_state = J;  //Finish shifting data out of the register unit
            // Here is when we go back to the begining of the state machine
            J :    if (~Execute)
                       next_state = A;

        endcase

		  // Assign outputs based on ‘state’
        case (curr_state)
	   	   A:
	         begin
                Ld_A = LoadA;
                Ld_B = LoadB;
                Shift_En = 1'b0;
		      end
          // Modify for adapting the new state machine
	   	   J:
		      begin
                Ld_A = 1'b0;
                Ld_B = 1'b0;
                Shift_En = 1'b0;
		      end
	   	   default:  //default case, can also have default assignments for Ld_A and Ld_B before case
		      begin
                Ld_A = 1'b0;
                Ld_B = 1'b0;
                Shift_En = 1'b1;  // Used to send out instruction to make the shift register shifting bits
		      end
        endcase
    end

endmodule
