
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity backprop_accelerator_top_tb is
end;

architecture bench of backprop_accelerator_top_tb is
  -- Clock period
  constant c_clk_period : time := 10 ns;

  -- Generics
  constant c_DATA_WIDTH        : integer := 8;
  constant c_PARALELISM_FACTOR : integer := 16;
  constant c_BUFFER_DEPTH      : integer := 8;
  constant c_DRAM_WIDTH        : integer := 16;
  constant c_DRAM_DEPTH        : integer := 12;

  -- signals
  signal w_clk                 : std_logic;
  signal w_rst                 : std_logic;
  signal w_clear               : std_logic;
  signal w_go                  : std_logic;
  signal w_inc_channel_row_ctr : std_logic;
  signal w_inc_channel_col_ctr : std_logic;
  signal w_write_out           : std_logic;
  signal w_batch               : std_logic_vector(c_BUFFER_DEPTH - 1 downto 0);
  signal w_heigth              : std_logic_vector(c_BUFFER_DEPTH - 1 downto 0);
  signal w_width               : std_logic_vector(c_BUFFER_DEPTH - 1 downto 0);
  signal w_nun_channels        : std_logic_vector(c_BUFFER_DEPTH - 1 downto 0);
  signal w_data                : std_logic_vector(31 downto 0);
  signal w_ready               : std_logic;
  component backprop_accelerator_top
    generic
    (
      DATA_WIDTH        : integer;
      PARALELISM_FACTOR : integer;
      BUFFER_DEPTH      : integer;
      DRAM_WIDTH        : integer;
      DRAM_DEPTH        : integer
    );
    port
    (
      i_clk                 : in std_logic;
      i_rst                 : in std_logic;
      i_clear               : in std_logic;
      i_go                  : in std_logic;
      i_inc_channel_row_ctr : in std_logic;
      i_inc_channel_col_ctr : in std_logic;
      i_write_out           : in std_logic;
      i_batch               : in std_logic_vector(BUFFER_DEPTH - 1 downto 0);
      i_heigth              : in std_logic_vector(BUFFER_DEPTH - 1 downto 0);
      i_width               : in std_logic_vector(BUFFER_DEPTH - 1 downto 0);
      i_nun_channels        : in std_logic_vector(BUFFER_DEPTH - 1 downto 0);
      o_data                : out std_logic_vector(31 downto 0);
      o_ready               : out std_logic
    );
  end component;
begin

  backprop_accelerator_top_inst : backprop_accelerator_top
  generic
  map (
  DATA_WIDTH        => c_DATA_WIDTH,
  PARALELISM_FACTOR => c_PARALELISM_FACTOR,
  BUFFER_DEPTH      => c_BUFFER_DEPTH,
  DRAM_WIDTH        => c_DRAM_WIDTH,
  DRAM_DEPTH        => c_DRAM_DEPTH
  )
  port map
  (
    i_clk                 => w_clk,
    i_rst                 => w_rst,
    i_clear               => w_clear,
    i_go                  => w_go,
    i_inc_channel_row_ctr => w_inc_channel_row_ctr,
    i_inc_channel_col_ctr => w_inc_channel_col_ctr,
    i_write_out           => w_write_out,
    i_batch               => w_batch,
    i_heigth              => w_heigth,
    i_width               => w_width,
    i_nun_channels        => w_nun_channels,
    o_data                => w_data,
    o_ready               => w_ready
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