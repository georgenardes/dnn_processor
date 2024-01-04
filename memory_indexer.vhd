library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity memory_indexer is
  generic
  (
    DATA_WIDTH  : integer := 4; -- Specify the DATA_width of the register
    OUTPUT_SIZE : integer := 2;
    INPUT_SIZE  : integer := 3);
  port
  (
    i_clk         : in std_logic; -- Clock input
    i_clear       : in std_logic; -- Clear signal
    i_rst_i       : in std_logic; -- reset counter
    i_rst_j       : in std_logic; -- reset counter
    i_inc_i       : in std_logic; -- Increment counter
    i_inc_j       : in std_logic; -- Increment counter
    o_i_comp      : out std_logic; -- Output signal control
    o_j_comp      : out std_logic; -- Output signal control
    o_i           : out std_logic_vector(DATA_WIDTH - 1 downto 0); -- Output data
    o_j           : out std_logic_vector(DATA_WIDTH - 1 downto 0); -- Output data
    o_weight_addr : out std_logic_vector(DATA_WIDTH - 1 downto 0) -- Output data
  );
end entity memory_indexer;

architecture arch of memory_indexer is

  signal w_weight_addr : std_logic_vector(2 * DATA_WIDTH - 1 downto 0);
  signal w_i_cntr      : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal w_j_cntr      : std_logic_vector(DATA_WIDTH - 1 downto 0);
  component up_counter is
    generic
    (
      WIDTH : integer := 4 -- Specify the width of the register
    );
    port
    (
      i_clk   : in std_logic; -- Clock input
      i_clear : in std_logic; -- Clear signal
      i_inc   : in std_logic; -- Increment counter
      o_q     : out std_logic_vector(WIDTH - 1 downto 0) -- Output data
    );
  end component;

  component gen_up_counter is
    generic
    (
      WIDTH : integer := 4 -- Specify the width of the register
    );
    port
    (
      i_clk          : in std_logic; -- Clock input
      i_clear        : in std_logic; -- Clear signal
      i_inc          : in std_logic; -- Increment counter
      i_load_inc_val : in std_logic; -- Load increment value
      i_inc_val      : in std_logic_vector(WIDTH - 1 downto 0);
      o_q            : out std_logic_vector(WIDTH - 1 downto 0) -- Output data
    );
  end component;

  component gen_comparator
    generic
    (
      WIDTH : integer
    );
    port
    (
      i_A : in std_logic_vector(WIDTH - 1 downto 0);
      i_B : in std_logic_vector(WIDTH - 1 downto 0);
      o_Q : out std_logic
    );
  end component;

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

begin
  gen_multiplier_inst : gen_multiplier
    generic
    map (
    WIDTH => DATA_WIDTH
    )
    port map
    (
      i_a      => w_i_cntr,
      i_b      => std_logic_vector(to_unsigned(INPUT_SIZE, DATA_WIDTH)),
      o_result => w_weight_addr
    );

  j_counter : up_counter
  generic
  map (
  WIDTH => DATA_WIDTH
  )
  port
  map (
  i_clk   => i_clk,
  i_clear => i_clear or i_rst_j,
  i_inc   => i_inc_j,
  o_q     => w_j_cntr
  );

  i_counter : up_counter
  generic
  map (
  WIDTH => DATA_WIDTH
  )
  port
  map (
  i_clk   => i_clk,
  i_clear => i_clear or i_rst_i,
  i_inc   => i_inc_i,
  o_q     => w_i_cntr
  );

  j_comp : gen_comparator
  generic
  map (
  WIDTH => DATA_WIDTH
  )
  port
  map (
  i_A => w_j_cntr,
  i_B => std_logic_vector(to_unsigned(INPUT_SIZE, DATA_WIDTH)),
  o_Q => o_j_comp
  );

  i_comp : gen_comparator
  generic
  map (
  WIDTH => DATA_WIDTH
  )
  port
  map (
  i_A => w_i_cntr,
  i_B => std_logic_vector(to_unsigned(OUTPUT_SIZE, DATA_WIDTH)),
  o_Q => o_i_comp
  );

  o_j           <= w_j_cntr;
  o_i           <= w_i_cntr;
  o_weight_addr <= std_logic_vector(unsigned(w_weight_addr(DATA_WIDTH - 1 downto 0)) + unsigned(w_j_cntr));
end architecture arch;