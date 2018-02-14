library verilog;
use verilog.vl_types.all;
entity sign_extend_adder is
    port(
        Fn              : in     vl_logic;
        A               : in     vl_logic_vector(7 downto 0);
        B               : in     vl_logic_vector(7 downto 0);
        s               : out    vl_logic_vector(8 downto 0)
    );
end sign_extend_adder;
