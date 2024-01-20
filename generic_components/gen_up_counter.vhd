library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity gen_up_counter is
  generic
  (
    DATA_WIDTH : integer := 4 -- Specify the width of the register
  );
  port
  (
    i_clk          : in std_logic; -- Clock input
    i_clear        : in std_logic; -- Clear signal
    i_inc          : in std_logic; -- Increment counter
    i_load_inc_val : in std_logic; -- Load increment value
    i_inc_val      : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    o_q            : out std_logic_vector(DATA_WIDTH - 1 downto 0) -- Output data
  );
end entity gen_up_counter;

architecture arch of gen_up_counter is

  signal w_count_value : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal w_counter_o   : std_logic_vector(DATA_WIDTH - 1 downto 0);

  component gen_register is
    generic
    (
      DATA_WIDTH : integer := 4 -- Specify the width of the register
    );
    port
    (
      i_clk   : in std_logic; -- Clock input
      i_clear : in std_logic; -- Clear signal
      i_load  : in std_logic; -- Load signal
      i_data  : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data
      o_q     : out std_logic_vector(DATA_WIDTH - 1 downto 0) -- Output data
    );
  end component;

begin
  r_count_value : gen_register
  generic
  map (
  DATA_WIDTH => DATA_WIDTH
  )
  port map
  (
    i_clk   => i_clk,
    i_clear => i_clear,
    i_load  => i_load_inc_val,
    i_data  => i_inc_val,
    o_q     => w_count_value
  );

  gen_register_inst : gen_register
  generic
  map (
  DATA_WIDTH => DATA_WIDTH
  )
  port
  map
  (
  i_clk   => i_clk,
  i_clear => i_clear,
  i_load  => i_inc,
  i_data  => std_logic_vector(unsigned(w_count_value) + unsigned(w_counter_o)),
  o_q     => w_counter_o
  );

  o_q <= w_counter_o; -- Output data
end architecture arch;