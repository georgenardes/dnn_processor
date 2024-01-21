library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.MATH_REAL.all; -- Import the math_real package
library work;
use work.types_pkg.all;

entity dnu_wrapper is
  generic
  (
    DATA_WIDTH        : integer := 8; -- Specify the width of the register
    PARALELISM_FACTOR : integer := 16
  );
  port
  (
    i_clk    : in std_logic; -- Clock input
    i_clear  : in std_logic; -- Clear signal
    i_data_0 : in t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(DATA_WIDTH - 1 downto 0);
    i_data_1 : in t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(DATA_WIDTH - 1 downto 0);
    o_data   : out std_logic_vector(2 * DATA_WIDTH + integer(log2(real(PARALELISM_FACTOR))) - 1 downto 0)
  );
end entity dnu_wrapper;

architecture arch of dnu_wrapper is
  constant c_TREE_DEPTH : integer := integer(log2(real(PARALELISM_FACTOR)));

  signal w_mult_out      : t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(2 * DATA_WIDTH - 1 downto 0);
  signal w_addr_tree_out : std_logic_vector(2 * DATA_WIDTH + c_TREE_DEPTH - 1 downto 0);

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

  component adder_tree
    generic
    (
      DATA_WIDTH      : integer;
      NUM_OF_OPERANDS : integer;
      TREE_DEPTH      : integer
    );
    port
    (
      i_clk          : in std_logic;
      i_input_vector : in t_ARRAY_OF_LOGIC_VECTOR(0 to NUM_OF_OPERANDS - 1)(DATA_WIDTH - 1 downto 0);
      o_sum          : out std_logic_vector(DATA_WIDTH + TREE_DEPTH - 1 downto 0)
    );
  end component;

begin

  gen_mem_blocks :
  for i in 0 to PARALELISM_FACTOR - 1 generate
    gen_multiplier_inst : gen_multiplier
    generic
    map (
    WIDTH => DATA_WIDTH
    )
    port map
    (
      i_a      => i_data_0(i),
      i_b      => i_data_1(i),
      o_result => w_mult_out(i)
    );

  end generate gen_mem_blocks;

  adder_tree_inst : adder_tree
  generic
  map (
  DATA_WIDTH      => 2 * DATA_WIDTH,
  NUM_OF_OPERANDS => PARALELISM_FACTOR,
  TREE_DEPTH      => c_TREE_DEPTH
  )
  port
  map (
  i_clk          => i_clk,
  i_input_vector => w_mult_out,
  o_sum          => w_addr_tree_out
  );

  o_data <= w_addr_tree_out; --w_mult_out(0);
end architecture arch;