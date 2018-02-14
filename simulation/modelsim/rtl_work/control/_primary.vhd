library verilog;
use verilog.vl_types.all;
entity control is
    port(
        Clk             : in     vl_logic;
        Reset           : in     vl_logic;
        ClA_LdB         : in     vl_logic;
        Execute         : in     vl_logic;
        M               : in     vl_logic;
        Shift_En        : out    vl_logic;
        Add             : out    vl_logic;
        Sub             : out    vl_logic;
        Clr_Ld          : out    vl_logic;
        Clear           : out    vl_logic
    );
end control;
