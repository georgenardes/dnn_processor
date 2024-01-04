library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all; -- Import the math_real package

library work;
use work.types_pkg.all;

entity datapath is
  generic
  (
    DATA_WIDTH        : integer := 8; -- Specify the datawidth 
    PARALELISM_FACTOR : integer := 16
  );
  port
  (
    i_clk       : in std_logic; -- clock input
    i_clear     : in std_logic; -- clear signal
    i_acc_clear : in std_logic;
    i_acc_load  : in std_logic;
    i_data_0    : in t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(DATA_WIDTH - 1 downto 0);
    i_data_1    : in t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(DATA_WIDTH - 1 downto 0);
    o_data      : out std_logic_vector(31 downto 0) -- Output data
  );
end entity datapath;

architecture arch of datapath is
  constant c_TREE_DEPTH    : integer := integer(log2(real(PARALELISM_FACTOR)));
  constant c_DNU_OUT_WIDTH : integer := 2 * DATA_WIDTH + c_TREE_DEPTH;

  signal w_o_dnu_data : std_logic_vector(c_DNU_OUT_WIDTH - 1 downto 0);

  component dnu_wrapper
    generic
    (
      DATA_WIDTH        : integer;
      PARALELISM_FACTOR : integer
    );
    port
    (
      i_clk    : in std_logic;
      i_clear  : in std_logic;
      i_data_0 : in t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(DATA_WIDTH - 1 downto 0);
      i_data_1 : in t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(DATA_WIDTH - 1 downto 0);
      o_data   : out std_logic_vector(2 * DATA_WIDTH + integer(log2(real(PARALELISM_FACTOR))) - 1 downto 0)
    );
  end component;

  component accumulator
    generic
    (
      INPUT_DATA_WIDTH  : integer;
      OUTPUT_DATA_WIDTH : integer
    );
    port
    (
      i_clk   : in std_logic;
      i_clear : in std_logic;
      i_load  : in std_logic;
      i_data  : in std_logic_vector(INPUT_DATA_WIDTH - 1 downto 0);
      o_acc   : out std_logic_vector(OUTPUT_DATA_WIDTH - 1 downto 0)
    );
  end component;

begin
  dnu_wrapper_inst : dnu_wrapper
  generic
  map (
  DATA_WIDTH        => DATA_WIDTH,
  PARALELISM_FACTOR => PARALELISM_FACTOR
  )
  port map
  (
    i_clk    => i_clk,
    i_clear  => i_clear,
    i_data_0 => i_data_0,
    i_data_1 => i_data_1,
    o_data   => w_o_dnu_data
  );

  accumulator_inst : accumulator
    generic
    map (
    INPUT_DATA_WIDTH  => c_DNU_OUT_WIDTH,
    OUTPUT_DATA_WIDTH => 32
    )
    port
    map (
    i_clk   => i_clk,
    i_clear => i_acc_clear,
    i_load  => i_acc_load,
    i_data  => w_o_dnu_data,
    o_acc   => o_data
    );
end architecture arch;