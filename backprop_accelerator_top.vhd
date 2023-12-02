library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
library work;
use work.types_pkg.all;

entity backprop_accelerator_top is
  generic
  (
    DATA_WIDTH          : integer := 8; -- Specify the width of the register
    OUTPUT_SIZE         : integer := 127;
    INPUT_SIZE          : integer := 127;
    GRADIENT_DATA_DEPTH : integer := 8;
    INPUT_DATA_DEPTH    : integer := 8;
    WEIGHT_DATA_DEPTH   : integer := 8;
    ERR_NEXT_DATA_DEPTH : integer := 8;
    BIAS_DATA_DEPTH     : integer := 8;
    LEARNING_RATE_RS    : integer := 6
  );
  port
  (
    i_clk   : in std_logic; -- Clock input
    i_rst   : in std_logic; -- Reset signal
    i_clear : in std_logic; -- Clear signal
    i_go    : in std_logic; -- Increment counter
    o_ready : out std_logic
  );
end entity backprop_accelerator_top;

architecture arch of backprop_accelerator_top is

  signal w_i_wren     : std_logic_vector(4 downto 0);
  signal w_i_gradient : std_logic_vector(DATA_WIDTH - 1 downto 0)     := (others => '0');
  signal w_o_gradient : std_logic_vector(DATA_WIDTH - 1 downto 0)     := (others => '0');
  signal w_i_input    : std_logic_vector(DATA_WIDTH - 1 downto 0)     := (others => '0');
  signal w_o_input    : std_logic_vector(DATA_WIDTH - 1 downto 0)     := (others => '0');
  signal w_i_weight   : std_logic_vector(DATA_WIDTH - 1 downto 0)     := (others => '0');
  signal w_o_weight   : std_logic_vector(DATA_WIDTH - 1 downto 0)     := (others => '0');
  signal w_i_err_next : std_logic_vector(2 * DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_o_err_next : std_logic_vector(2 * DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_i_bias     : std_logic_vector(DATA_WIDTH - 1 downto 0)     := (others => '0');
  signal w_o_bias     : std_logic_vector(DATA_WIDTH - 1 downto 0)     := (others => '0');

  signal w_i_inc_i     : std_logic;
  signal w_i_inc_j     : std_logic;
  signal w_o_i_comp    : std_logic;
  signal w_o_j_comp    : std_logic;
  signal w_i           : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal w_j           : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal w_weight_addr : std_logic_vector(DATA_WIDTH - 1 downto 0);

  signal w_o_i_rst         : std_logic; -- control signal 
  signal w_o_j_rst         : std_logic; -- control signal 
  signal w_o_i_inc         : std_logic; -- control signal 
  signal w_o_j_inc         : std_logic; -- control signal 
  signal w_o_mux_mul_sel   : std_logic; -- control signal 
  signal w_o_mux_err_sel   : std_logic; -- control signal 
  signal w_o_err_next_wren : std_logic; -- control signal 
  signal w_o_weight_wren   : std_logic; -- control signal 
  signal w_o_bias_wren     : std_logic; -- control signal 

  component datapath
    generic
    (
      DATA_WIDTH       : integer;
      LEARNING_RATE_RS : integer
    );
    port
    (
      i_clk         : in std_logic;
      i_clear       : in std_logic;
      i_sel_mux_mul : in std_logic;
      i_sel_mux_err : in std_logic;
      i_gradient    : in std_logic_vector(DATA_WIDTH - 1 downto 0);
      i_input       : in std_logic_vector(DATA_WIDTH - 1 downto 0);
      i_weight      : in std_logic_vector(DATA_WIDTH - 1 downto 0);
      i_err_next    : in std_logic_vector(2 * DATA_WIDTH - 1 downto 0);
      i_bias        : in std_logic_vector(DATA_WIDTH - 1 downto 0);
      o_weight      : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      o_err_next    : out std_logic_vector(2 * DATA_WIDTH - 1 downto 0);
      o_bias        : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
  end component;

  component memory_indexer
    generic
    (
      WIDTH       : integer;
      OUTPUT_SIZE : integer;
      INPUT_SIZE  : integer
    );
    port
    (
      i_clk         : in std_logic;
      i_clear       : in std_logic;
      i_rst_i       : in std_logic;
      i_rst_j       : in std_logic;
      i_inc_i       : in std_logic;
      i_inc_j       : in std_logic;
      o_i_comp      : out std_logic;
      o_j_comp      : out std_logic;
      o_i           : out std_logic_vector(WIDTH - 1 downto 0);
      o_j           : out std_logic_vector(WIDTH - 1 downto 0);
      o_weight_addr : out std_logic_vector(WIDTH - 1 downto 0)
    );
  end component;

  component memory_bank
    generic
    (
      DATA_WIDTH          : integer;
      GRADIENT_DATA_DEPTH : integer;
      INPUT_DATA_DEPTH    : integer;
      WEIGHT_DATA_DEPTH   : integer;
      ERR_NEXT_DATA_DEPTH : integer;
      BIAS_DATA_DEPTH     : integer
    );
    port
    (
      i_clk           : in std_logic;
      i_clear         : in std_logic;
      i_wren          : in std_logic_vector(4 downto 0);
      i_gradient      : in std_logic_vector(DATA_WIDTH - 1 downto 0);
      i_gradient_addr : in std_logic_vector(GRADIENT_DATA_DEPTH - 1 downto 0);
      o_gradient      : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      i_input         : in std_logic_vector(DATA_WIDTH - 1 downto 0);
      i_input_addr    : in std_logic_vector(INPUT_DATA_DEPTH - 1 downto 0);
      o_input         : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      i_weight        : in std_logic_vector(DATA_WIDTH - 1 downto 0);
      i_weight_addr   : in std_logic_vector(WEIGHT_DATA_DEPTH - 1 downto 0);
      o_weight        : out std_logic_vector(DATA_WIDTH - 1 downto 0);
      i_err_next      : in std_logic_vector(2 * DATA_WIDTH - 1 downto 0);
      i_err_next_addr : in std_logic_vector(ERR_NEXT_DATA_DEPTH - 1 downto 0);
      o_err_next      : out std_logic_vector(2 * DATA_WIDTH - 1 downto 0);
      i_bias          : in std_logic_vector(DATA_WIDTH - 1 downto 0);
      i_bias_addr     : in std_logic_vector(BIAS_DATA_DEPTH - 1 downto 0);
      o_bias          : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
  end component;

  component controler
    port
    (
      i_clk           : in std_logic;
      i_rst           : in std_logic;
      i_go            : in std_logic;
      i_i_comp        : in std_logic;
      i_j_comp        : in std_logic;
      o_i_rst         : out std_logic;
      o_j_rst         : out std_logic;
      o_i_inc         : out std_logic;
      o_j_inc         : out std_logic;
      o_mux_mul_sel   : out std_logic;
      o_mux_err_sel   : out std_logic;
      o_err_next_wren : out std_logic;
      o_weight_wren   : out std_logic;
      o_bias_wren     : out std_logic;
      o_ready         : out std_logic
    );
  end component;

begin

  memory_bank_inst : memory_bank
  generic
  map (
  DATA_WIDTH          => DATA_WIDTH,
  GRADIENT_DATA_DEPTH => GRADIENT_DATA_DEPTH,
  INPUT_DATA_DEPTH    => INPUT_DATA_DEPTH,
  WEIGHT_DATA_DEPTH   => WEIGHT_DATA_DEPTH,
  ERR_NEXT_DATA_DEPTH => ERR_NEXT_DATA_DEPTH,
  BIAS_DATA_DEPTH     => BIAS_DATA_DEPTH
  )
  port map
  (
    i_clk           => i_clk,
    i_clear         => i_clear,
    i_wren          => w_o_bias_wren & w_o_err_next_wren & w_o_weight_wren & "00",
    i_gradient      => w_i_gradient,
    i_gradient_addr => w_i,
    o_gradient      => w_o_gradient,
    i_input         => w_i_input,
    i_input_addr    => w_j,
    o_input         => w_o_input,
    i_weight        => w_i_weight,
    i_weight_addr   => w_weight_addr,
    o_weight        => w_o_weight,
    i_err_next      => w_i_err_next,
    i_err_next_addr => w_j,
    o_err_next      => w_o_err_next,
    i_bias          => w_i_bias,
    i_bias_addr     => w_i,
    o_bias          => w_o_bias
  );

  memory_indexer_inst : memory_indexer
  generic
  map (
  WIDTH       => DATA_WIDTH,
  OUTPUT_SIZE => OUTPUT_SIZE,
  INPUT_SIZE  => INPUT_SIZE
  )
  port
  map (
  i_clk         => i_clk,
  i_clear       => i_clear,
  i_rst_i       => w_o_i_rst,
  i_rst_j       => w_o_j_rst,
  i_inc_i       => w_o_i_inc,
  i_inc_j       => w_o_j_inc,
  o_i_comp      => w_o_i_comp,
  o_j_comp      => w_o_j_comp,
  o_i           => w_i,
  o_j           => w_j,
  o_weight_addr => w_weight_addr
  );
  datapath_inst : datapath
  generic
  map (
  DATA_WIDTH       => DATA_WIDTH,
  LEARNING_RATE_RS => LEARNING_RATE_RS
  )
  port
  map (
  i_clk         => i_clk,
  i_clear       => i_clear,
  i_sel_mux_mul => w_o_mux_mul_sel,
  i_sel_mux_err => w_o_mux_err_sel,
  i_gradient    => w_o_gradient,
  i_input       => w_o_input,
  i_weight      => w_o_weight,
  i_err_next    => w_o_err_next,
  i_bias        => w_o_bias,
  o_weight      => w_i_weight,
  o_err_next    => w_i_err_next,
  o_bias        => w_i_bias
  );

  controler_inst : controler
  port
  map (
  i_clk           => i_clk,
  i_rst           => i_rst,
  i_go            => i_go,
  i_i_comp        => w_o_i_comp,
  i_j_comp        => w_o_j_comp,
  o_i_rst         => w_o_i_rst,
  o_j_rst         => w_o_j_rst,
  o_i_inc         => w_o_i_inc,
  o_j_inc         => w_o_j_inc,
  o_mux_mul_sel   => w_o_mux_mul_sel,
  o_mux_err_sel   => w_o_mux_err_sel,
  o_err_next_wren => w_o_err_next_wren,
  o_weight_wren   => w_o_weight_wren,
  o_bias_wren     => w_o_bias_wren,
  o_ready         => o_ready
  );

end architecture arch;