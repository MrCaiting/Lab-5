library verilog;
use verilog.vl_types.all;
entity xfp is
    port(
        Clk             : in     vl_logic;
        Load            : in     vl_logic;
        Clear           : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic
    );
end xfp;
