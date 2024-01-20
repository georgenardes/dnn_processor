library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;

library work;
use work.types_pkg.all;

entity my_dense_tb is
end entity;

architecture rtl of my_dense_tb is
  constant DATA_WIDTH        : integer := 16;
  constant PARALELISM_FACTOR : integer := 16;

  -- Clock period
  constant c_clk_period : time := 10 ns;
  -- signals
  signal w_ap_clk           : std_logic                                  := '0';
  signal w_ap_rst           : std_logic                                  := '0';
  signal w_ap_start         : std_logic                                  := '0';
  signal w_ap_done_my       : std_logic                                  := '0';
  signal w_ap_idle_my       : std_logic                                  := '0';
  signal w_ap_ready_my      : std_logic                                  := '0';
  signal w_ap_done_their    : std_logic                                  := '0';
  signal w_ap_idle_their    : std_logic                                  := '0';
  signal w_ap_ready_their   : std_logic                                  := '0';
  signal w_data_0_V_read    : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_1_V_read    : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_2_V_read    : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_3_V_read    : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_4_V_read    : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_5_V_read    : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_6_V_read    : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_7_V_read    : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_8_V_read    : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_9_V_read    : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_10_V_read   : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_11_V_read   : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_12_V_read   : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_13_V_read   : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_14_V_read   : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_data_15_V_read   : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_0_V_read  : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_1_V_read  : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_2_V_read  : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_3_V_read  : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_4_V_read  : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_5_V_read  : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_6_V_read  : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_7_V_read  : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_8_V_read  : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_9_V_read  : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_10_V_read : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_11_V_read : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_12_V_read : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_13_V_read : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_14_V_read : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_weight_15_V_read : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_ap_return_my     : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');
  signal w_ap_return_their  : std_logic_vector (DATA_WIDTH - 1 downto 0) := (others => '0');

  component my_dense is
    generic
    (
      DATA_WIDTH        : integer := 16;
      PARALELISM_FACTOR : integer := 16
    );

    port
    (
      ap_clk           : in std_logic;
      ap_rst           : in std_logic;
      ap_start         : in std_logic;
      ap_done          : out std_logic;
      ap_idle          : out std_logic;
      ap_ready         : out std_logic;
      data_0_V_read    : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_1_V_read    : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_2_V_read    : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_3_V_read    : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_4_V_read    : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_5_V_read    : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_6_V_read    : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_7_V_read    : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_8_V_read    : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_9_V_read    : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_10_V_read   : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_11_V_read   : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_12_V_read   : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_13_V_read   : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_14_V_read   : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      data_15_V_read   : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_0_V_read  : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_1_V_read  : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_2_V_read  : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_3_V_read  : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_4_V_read  : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_5_V_read  : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_6_V_read  : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_7_V_read  : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_8_V_read  : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_9_V_read  : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_10_V_read : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_11_V_read : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_12_V_read : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_13_V_read : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_14_V_read : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      weight_15_V_read : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      ap_return        : out std_logic_vector (DATA_WIDTH - 1 downto 0));
  end component;

  component dense_wrapper_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_config2_s
    port
    (
      ap_clk           : in std_logic;
      ap_rst           : in std_logic;
      ap_start         : in std_logic;
      ap_done          : out std_logic;
      ap_idle          : out std_logic;
      ap_ready         : out std_logic;
      data_0_V_read    : in std_logic_vector (15 downto 0);
      data_1_V_read    : in std_logic_vector (15 downto 0);
      data_2_V_read    : in std_logic_vector (15 downto 0);
      data_3_V_read    : in std_logic_vector (15 downto 0);
      data_4_V_read    : in std_logic_vector (15 downto 0);
      data_5_V_read    : in std_logic_vector (15 downto 0);
      data_6_V_read    : in std_logic_vector (15 downto 0);
      data_7_V_read    : in std_logic_vector (15 downto 0);
      data_8_V_read    : in std_logic_vector (15 downto 0);
      data_9_V_read    : in std_logic_vector (15 downto 0);
      data_10_V_read   : in std_logic_vector (15 downto 0);
      data_11_V_read   : in std_logic_vector (15 downto 0);
      data_12_V_read   : in std_logic_vector (15 downto 0);
      data_13_V_read   : in std_logic_vector (15 downto 0);
      data_14_V_read   : in std_logic_vector (15 downto 0);
      data_15_V_read   : in std_logic_vector (15 downto 0);
      weight_0_V_read  : in std_logic_vector (15 downto 0);
      weight_1_V_read  : in std_logic_vector (15 downto 0);
      weight_2_V_read  : in std_logic_vector (15 downto 0);
      weight_3_V_read  : in std_logic_vector (15 downto 0);
      weight_4_V_read  : in std_logic_vector (15 downto 0);
      weight_5_V_read  : in std_logic_vector (15 downto 0);
      weight_6_V_read  : in std_logic_vector (15 downto 0);
      weight_7_V_read  : in std_logic_vector (15 downto 0);
      weight_8_V_read  : in std_logic_vector (15 downto 0);
      weight_9_V_read  : in std_logic_vector (15 downto 0);
      weight_10_V_read : in std_logic_vector (15 downto 0);
      weight_11_V_read : in std_logic_vector (15 downto 0);
      weight_12_V_read : in std_logic_vector (15 downto 0);
      weight_13_V_read : in std_logic_vector (15 downto 0);
      weight_14_V_read : in std_logic_vector (15 downto 0);
      weight_15_V_read : in std_logic_vector (15 downto 0);
      ap_return        : out std_logic_vector (15 downto 0)
    );
  end component;
begin

  my_dense_inst : my_dense
  generic
  map (
  DATA_WIDTH        => DATA_WIDTH,
  PARALELISM_FACTOR => PARALELISM_FACTOR
  )
  port map
  (
    ap_clk           => w_ap_clk,
    ap_rst           => w_ap_rst,
    ap_start         => w_ap_start,
    ap_done          => w_ap_done_my,
    ap_idle          => w_ap_idle_my,
    ap_ready         => w_ap_ready_my,
    data_0_V_read    => w_data_0_V_read,
    data_1_V_read    => w_data_1_V_read,
    data_2_V_read    => w_data_2_V_read,
    data_3_V_read    => w_data_3_V_read,
    data_4_V_read    => w_data_4_V_read,
    data_5_V_read    => w_data_5_V_read,
    data_6_V_read    => w_data_6_V_read,
    data_7_V_read    => w_data_7_V_read,
    data_8_V_read    => w_data_8_V_read,
    data_9_V_read    => w_data_9_V_read,
    data_10_V_read   => w_data_10_V_read,
    data_11_V_read   => w_data_11_V_read,
    data_12_V_read   => w_data_12_V_read,
    data_13_V_read   => w_data_13_V_read,
    data_14_V_read   => w_data_14_V_read,
    data_15_V_read   => w_data_15_V_read,
    weight_0_V_read  => w_weight_0_V_read,
    weight_1_V_read  => w_weight_1_V_read,
    weight_2_V_read  => w_weight_2_V_read,
    weight_3_V_read  => w_weight_3_V_read,
    weight_4_V_read  => w_weight_4_V_read,
    weight_5_V_read  => w_weight_5_V_read,
    weight_6_V_read  => w_weight_6_V_read,
    weight_7_V_read  => w_weight_7_V_read,
    weight_8_V_read  => w_weight_8_V_read,
    weight_9_V_read  => w_weight_9_V_read,
    weight_10_V_read => w_weight_10_V_read,
    weight_11_V_read => w_weight_11_V_read,
    weight_12_V_read => w_weight_12_V_read,
    weight_13_V_read => w_weight_13_V_read,
    weight_14_V_read => w_weight_14_V_read,
    weight_15_V_read => w_weight_15_V_read,
    ap_return        => w_ap_return_my
  );
  ----------------
  dense_wrapper_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_config2_s_inst : dense_wrapper_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_config2_s
  port
  map (
  ap_clk           => w_ap_clk,
  ap_rst           => w_ap_rst,
  ap_start         => w_ap_start,
  ap_done          => w_ap_done_their,
  ap_idle          => w_ap_idle_their,
  ap_ready         => w_ap_ready_their,
  data_0_V_read    => w_data_0_V_read,
  data_1_V_read    => w_data_1_V_read,
  data_2_V_read    => w_data_2_V_read,
  data_3_V_read    => w_data_3_V_read,
  data_4_V_read    => w_data_4_V_read,
  data_5_V_read    => w_data_5_V_read,
  data_6_V_read    => w_data_6_V_read,
  data_7_V_read    => w_data_7_V_read,
  data_8_V_read    => w_data_8_V_read,
  data_9_V_read    => w_data_9_V_read,
  data_10_V_read   => w_data_10_V_read,
  data_11_V_read   => w_data_11_V_read,
  data_12_V_read   => w_data_12_V_read,
  data_13_V_read   => w_data_13_V_read,
  data_14_V_read   => w_data_14_V_read,
  data_15_V_read   => w_data_15_V_read,
  weight_0_V_read  => w_weight_0_V_read,
  weight_1_V_read  => w_weight_1_V_read,
  weight_2_V_read  => w_weight_2_V_read,
  weight_3_V_read  => w_weight_3_V_read,
  weight_4_V_read  => w_weight_4_V_read,
  weight_5_V_read  => w_weight_5_V_read,
  weight_6_V_read  => w_weight_6_V_read,
  weight_7_V_read  => w_weight_7_V_read,
  weight_8_V_read  => w_weight_8_V_read,
  weight_9_V_read  => w_weight_9_V_read,
  weight_10_V_read => w_weight_10_V_read,
  weight_11_V_read => w_weight_11_V_read,
  weight_12_V_read => w_weight_12_V_read,
  weight_13_V_read => w_weight_13_V_read,
  weight_14_V_read => w_weight_14_V_read,
  weight_15_V_read => w_weight_15_V_read,
  ap_return        => w_ap_return_their
  );
  -------------------------
  p_CLK : process
  begin
    w_ap_clk <= '1';
    wait for c_clk_period/2;
    w_ap_clk <= '0';
    wait for c_clk_period/2;
  end process p_CLK;
  -------------------------

  p_TEST : process
  begin

    wait for c_clk_period;
    w_ap_start <= '1';

    wait for c_clk_period;
    w_ap_start <= '0';

    wait until (w_ap_ready_my = '1' and w_ap_ready_their = '1');
    -- TEST DONE
    assert false report "Test done." severity note;
    wait;

  end process;

end architecture;