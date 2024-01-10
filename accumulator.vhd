library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity accumulator is
  generic
  (
    INPUT_DATA_WIDTH  : integer := 4; -- Specify the DATA_width of the adder
    OUTPUT_DATA_WIDTH : integer := 32
  );
  port
  (
    i_clk   : in std_logic;
    i_clear : in std_logic;
    i_load  : in std_logic;
    i_data  : in std_logic_vector(INPUT_DATA_WIDTH - 1 downto 0); -- Input operand A
    o_acc   : out std_logic_vector(OUTPUT_DATA_WIDTH - 1 downto 0) -- Output sum
  );
end entity accumulator;

architecture arch of accumulator is

  signal w_input     : std_logic_vector(OUTPUT_DATA_WIDTH - 1 downto 0);
  signal w_adder_out : std_logic_vector(OUTPUT_DATA_WIDTH - 1 downto 0);
  signal w_reg_out   : std_logic_vector(OUTPUT_DATA_WIDTH - 1 downto 0);

  component gen_register
    generic
    (
      WIDTH : integer := 4 -- Specify the width of the register
    );
    port
    (
      i_clk   : in std_logic; -- Clock input
      i_clear : in std_logic; -- Clear signal
      i_load  : in std_logic; -- Load signal
      i_data  : in std_logic_vector(WIDTH - 1 downto 0); -- Input data
      o_q     : out std_logic_vector(WIDTH - 1 downto 0) -- Output data
    );
  end component;
begin

  -- signal extension
  w_input(OUTPUT_DATA_WIDTH - 1 downto INPUT_DATA_WIDTH) <= (others => i_data(INPUT_DATA_WIDTH - 1));
  w_input(INPUT_DATA_WIDTH - 1 downto 0)                 <= i_data;
  
  r_count_value : gen_register
    generic
    map (
    WIDTH => OUTPUT_DATA_WIDTH
    )
    port map
    (
      i_clk   => i_clk,
      i_clear => i_clear,
      i_load  => i_load,
      i_data  => w_adder_out,
      o_q     => w_reg_out
    );

  w_adder_out <= std_logic_vector(signed(w_reg_out) + signed(w_input));

  o_acc <= w_reg_out;
end architecture arch;