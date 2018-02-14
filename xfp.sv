module xfp(
          input logic Clk,
          input logic clear,
          input logic D,
          output logic Q
          );

      always_ff @ (posedge Clk)
      begin

        if (clear)
        Q <= 1'b0;
        else
        Q <= D;
        end

endmodule
