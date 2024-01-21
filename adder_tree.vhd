library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.types_pkg.all;

entity adder_tree is
  generic
  (
    DATA_WIDTH      : integer := 8; -- Specify the width of the adder
    NUM_OF_OPERANDS : integer := 16; -- Specify the number of operands
    TREE_DEPTH      : integer := 4
  );
  port
  (
    i_CLK          : in std_logic;
    i_input_vector : in t_ARRAY_OF_LOGIC_VECTOR(0 to NUM_OF_OPERANDS - 1)(DATA_WIDTH - 1 downto 0); -- Input operands
    o_sum          : out std_logic_vector(DATA_WIDTH + TREE_DEPTH - 1 downto 0) -- Output sum
  );
end entity adder_tree;

architecture arch of adder_tree is
  signal w_AUX : t_MAT_OF_LOGIC_VECTOR(0 to NUM_OF_OPERANDS - 1, 0 to TREE_DEPTH + 1)(DATA_WIDTH + TREE_DEPTH - 1 downto 0) := (others => (others => (others => '0')));

  component gen_adder
    generic
    (
      WIDTH : integer
    );
    port
    (
      i_a   : in std_logic_vector(WIDTH - 1 downto 0);
      i_b   : in std_logic_vector(WIDTH - 1 downto 0);
      o_sum : out std_logic_vector(WIDTH downto 0)
    );
  end component;

  component gen_register
    generic
    (
      DATA_WIDTH : integer
    );
    port
    (
      i_clk   : in std_logic;
      i_clear : in std_logic;
      i_load  : in std_logic;
      i_data  : in std_logic_vector(DATA_WIDTH - 1 downto 0);
      o_q     : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
  end component;

begin

  gen_input :
  for i in 0 to NUM_OF_OPERANDS - 1 generate
    gen_register_inst : gen_register
    generic
    map (
    DATA_WIDTH => DATA_WIDTH
    )
    port map
    (
      i_clk   => i_CLK,
      i_clear => '0',
      i_load  => '1',
      i_data  => i_input_vector(i),
      o_q     => w_AUX(i, TREE_DEPTH)(DATA_WIDTH - 1 downto 0)
    );

  end generate gen_input;
  cols :
  for i in TREE_DEPTH downto 1 generate
  begin
    rows :
    for j in 0 to ((2 ** i)/2 - 1) generate

      gen_adder_inst : gen_adder
      generic
      map (
      WIDTH => DATA_WIDTH + TREE_DEPTH - i
      )
      port
      map
      (
      i_a   => w_AUX(j * 2, i)(DATA_WIDTH + TREE_DEPTH - i - 1 downto 0),
      i_b   => w_AUX(j * 2 + 1, i)(DATA_WIDTH + TREE_DEPTH - i - 1 downto 0),
      o_sum => w_AUX(j, i - 1)(DATA_WIDTH + TREE_DEPTH - i downto 0)
      );

    end generate rows;
  end generate cols;

  o_sum <= w_AUX(0, 0);
end architecture arch;