
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity backprop_accelerator_top_tb is
end;

architecture bench of backprop_accelerator_top_tb is
  -- Clock period
  constant c_clk_period : time := 10 ns;
  -- Generics
  constant DATA_WIDTH          : integer := 8;
  constant OUTPUT_SIZE         : integer := 2;
  constant INPUT_SIZE          : integer := 3;
  constant GRADIENT_DATA_DEPTH : integer := 8;
  constant INPUT_DATA_DEPTH    : integer := 8;
  constant WEIGHT_DATA_DEPTH   : integer := 8;
  constant ERR_NEXT_DATA_DEPTH : integer := 8;
  constant BIAS_DATA_DEPTH     : integer := 8;
  constant LEARNING_RATE_RS    : integer := 6;
  -- Ports
  signal w_clk   : std_logic := '0';
  signal w_rst   : std_logic := '0';
  signal w_clear : std_logic := '0';
  signal w_go    : std_logic := '0';
  signal w_ready : std_logic;

  component backprop_accelerator_top
    generic
    (
      DATA_WIDTH          : integer;
      OUTPUT_SIZE         : integer;
      INPUT_SIZE          : integer;
      GRADIENT_DATA_DEPTH : integer;
      INPUT_DATA_DEPTH    : integer;
      WEIGHT_DATA_DEPTH   : integer;
      ERR_NEXT_DATA_DEPTH : integer;
      BIAS_DATA_DEPTH     : integer;
      LEARNING_RATE_RS    : integer
    );
    port
    (
      i_clk   : in std_logic;
      i_rst   : in std_logic;
      i_clear : in std_logic;
      i_go    : in std_logic;
      o_ready : out std_logic
    );
  end component;
begin

  backprop_accelerator_top_inst : backprop_accelerator_top
  generic
  map (
  DATA_WIDTH          => DATA_WIDTH,
  OUTPUT_SIZE         => OUTPUT_SIZE,
  INPUT_SIZE          => INPUT_SIZE,
  GRADIENT_DATA_DEPTH => GRADIENT_DATA_DEPTH,
  INPUT_DATA_DEPTH    => INPUT_DATA_DEPTH,
  WEIGHT_DATA_DEPTH   => WEIGHT_DATA_DEPTH,
  ERR_NEXT_DATA_DEPTH => ERR_NEXT_DATA_DEPTH,
  BIAS_DATA_DEPTH     => BIAS_DATA_DEPTH,
  LEARNING_RATE_RS    => LEARNING_RATE_RS
  )
  port map
  (
    i_clk   => w_clk,
    i_rst   => w_rst,
    i_clear => w_clear,
    i_go    => w_go,
    o_ready => w_ready
  );

  p_CLK : process
  begin
    w_clk <= '1';
    wait for c_clk_period/2;
    w_clk <= '0';
    wait for c_clk_period/2;
  end process p_CLK;

  p_TEST : process
  begin
    wait for c_clk_period;
    w_go <= '1';
    wait for c_clk_period;
    w_go <= '0';

    wait until w_READY = '1';

    -- TEST DONE
    assert false report "Test done." severity note;
    wait;

  end process;
end;