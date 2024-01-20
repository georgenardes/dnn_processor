library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;

library work;
use work.types_pkg.all;

entity my_dense_tb is
end entity;

architecture rtl of my_dense_tb is
  -- Clock period
  constant c_clk_period : time := 10 ns;

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
begin

end architecture;