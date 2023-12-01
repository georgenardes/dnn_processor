library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.types_pkg.all;

entity datapath is
  generic
  (
    DATA_WIDTH       : integer := 8; -- Specify the datawidth 
    LEARNING_RATE_RS : integer := 6 -- Specify the learning rate right shift amt
  );
  port
  (
    i_clk   : in std_logic; -- clock input
    i_clear : in std_logic; -- clear signal

    i_sel_mux_mul : in std_logic; -- control signal 
    i_sel_mux_err : in std_logic; -- control signal 

    i_gradient : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data
    i_input    : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data
    i_weight   : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data
    i_err_next : in std_logic_vector(2 * DATA_WIDTH - 1 downto 0); -- Input data
    i_bias     : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data

    o_weight   : out std_logic_vector(DATA_WIDTH - 1 downto 0); -- Output data
    o_err_next : out std_logic_vector(2 * DATA_WIDTH - 1 downto 0); -- Output data
    o_bias     : out std_logic_vector(DATA_WIDTH - 1 downto 0) -- Output data
  );
end entity datapath;

architecture arch of datapath is

  -- signals
  signal w_mux_mul_i : t_ARRAY_OF_LOGIC_VECTOR(0 to 1)(DATA_WIDTH - 1 downto 0)     := (others => (others => '0')); -- to convert to gen mux
  signal w_mux_err_i : t_ARRAY_OF_LOGIC_VECTOR(0 to 1)(2 * DATA_WIDTH - 1 downto 0) := (others => (others => '0')); -- to convert to gen mux

  signal w_mux_mul_o : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal w_mult_o    : std_logic_vector(2 * DATA_WIDTH - 1 downto 0);
  signal w_adder_o   : std_logic_vector(2 * DATA_WIDTH - 1 downto 0);

  signal w_extended_weight : std_logic_vector(2 * DATA_WIDTH - 1 downto 0);
  signal w_rshift_weight_o : std_logic_vector(2 * DATA_WIDTH - 1 downto 0);
  signal w_rshift_bias_o   : std_logic_vector(DATA_WIDTH - 1 downto 0);

  signal w_new_weight : std_logic_vector(2 * DATA_WIDTH - 1 downto 0);
  signal w_new_bias   : std_logic_vector(DATA_WIDTH - 1 downto 0);

  component gen_multiplier
    generic
    (
      WIDTH : integer
    );
    port
    (
      i_a      : in std_logic_vector(WIDTH - 1 downto 0);
      i_b      : in std_logic_vector(WIDTH - 1 downto 0);
      o_result : out std_logic_vector(2 * WIDTH - 1 downto 0)
    );
  end component;

  component gen_adder
    generic
    (
      WIDTH : integer
    );
    port
    (
      i_a   : in std_logic_vector(WIDTH - 1 downto 0);
      i_b   : in std_logic_vector(WIDTH - 1 downto 0);
      o_sum : out std_logic_vector(WIDTH - 1 downto 0)
    );
  end component;

  component gen_multiplexer
    generic
    (
      NC_SEL_WIDTH : integer;
      DATA_WIDTH   : integer
    );
    port
    (
      i_A   : in t_ARRAY_OF_LOGIC_VECTOR(0 to (2 ** NC_SEL_WIDTH) - 1)(DATA_WIDTH - 1 downto 0);
      i_SEL : in std_logic_vector(NC_SEL_WIDTH - 1 downto 0);
      o_Q   : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
  end component;

  component gen_rigth_shifter
    generic
    (
      WIDTH     : integer;
      SHIFT_AMT : integer;
      IS_SIGNED : std_logic
    );
    port
    (
      i_data   : in std_logic_vector(WIDTH - 1 downto 0);
      o_result : out std_logic_vector(WIDTH - 1 downto 0)
    );
  end component;

  component gen_subtractor
    generic
    (
      WIDTH : integer
    );
    port
    (
      i_a   : in std_logic_vector(WIDTH - 1 downto 0);
      i_b   : in std_logic_vector(WIDTH - 1 downto 0);
      o_sub : out std_logic_vector(WIDTH - 1 downto 0)
    );
  end component;

  ---------------------------------------------------------
begin

  w_mux_mul_i(0) <= i_input;
  w_mux_mul_i(1) <= i_weight;
  mux_mul : gen_multiplexer
  generic
  map (
  NC_SEL_WIDTH => 1,
  DATA_WIDTH   => DATA_WIDTH
  )
  port map
  (
    i_A   => w_mux_mul_i,
    i_SEL => "" & i_sel_mux_mul,
    o_Q   => w_mux_mul_o
  );

  multiplier : gen_multiplier
  generic
  map (
  WIDTH => DATA_WIDTH
  )
  port
  map (
  i_a      => i_gradient,
  i_b      => w_mux_mul_o,
  o_result => w_mult_o
  );

  adder : gen_adder
  generic
  map (
  WIDTH => 2 * DATA_WIDTH
  )
  port
  map (
  i_a   => w_mult_o,
  i_b   => i_err_next,
  o_sum => w_adder_o
  );

  w_mux_err_i(0) <= w_adder_o;
  mux_err : gen_multiplexer
  generic
  map (
  NC_SEL_WIDTH => 1,
  DATA_WIDTH   => 2 * DATA_WIDTH
  )
  port
  map
  (
  i_A   => w_mux_err_i,
  i_SEL => "" & i_sel_mux_err,
  o_Q   => o_err_next
  );

  weight_right_shifter : gen_rigth_shifter
  generic
  map (
  WIDTH     => 2 * DATA_WIDTH,
  SHIFT_AMT => LEARNING_RATE_RS,
  IS_SIGNED => '1'
  )
  port
  map (
  i_data   => w_mult_o,
  o_result => w_rshift_weight_o
  );

  w_extended_weight(2 * DATA_WIDTH - 1 downto DATA_WIDTH - 1) <= (others => i_weight(DATA_WIDTH - 1));
  w_extended_weight(DATA_WIDTH - 1 downto 0)                  <= i_weight;
  weight_update_subtractor : gen_subtractor
  generic
  map (
  WIDTH => 2 * DATA_WIDTH
  )
  port
  map (
  i_a   => w_extended_weight,
  i_b   => w_rshift_weight_o,
  o_sub => w_new_weight
  );
  o_weight <= w_new_weight(DATA_WIDTH - 1 downto 0);

  bias_right_shifter : gen_rigth_shifter
  generic
  map (
  WIDTH     => DATA_WIDTH,
  SHIFT_AMT => LEARNING_RATE_RS,
  IS_SIGNED => '1'
  )
  port
  map (
  i_data   => i_gradient,
  o_result => w_rshift_bias_o
  );

  bias_update_subtractor : gen_subtractor
  generic
  map (
  WIDTH => DATA_WIDTH
  )
  port
  map (
  i_a   => i_bias,
  i_b   => w_rshift_bias_o,
  o_sub => w_new_bias
  );
  o_bias <= w_new_bias(DATA_WIDTH - 1 downto 0);

end architecture arch;