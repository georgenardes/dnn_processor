library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;

library work;
use work.types_pkg.all;

entity my_dense is
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
end entity;
architecture rtl of my_dense is
  constant c_TREE_DEPTH    : integer := integer(log2(real(PARALELISM_FACTOR)));
  constant c_DNU_OUT_WIDTH : integer := 2 * DATA_WIDTH + c_TREE_DEPTH;
  signal w_o_dnu_data      : std_logic_vector(c_DNU_OUT_WIDTH - 1 downto 0);
  signal w_data, w_weight  : t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(DATA_WIDTH - 1 downto 0);

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
  component my_dense_controller
    port
    (
      ap_clk   : in std_logic;
      ap_rst   : in std_logic;
      ap_start : in std_logic;
      ap_done  : out std_logic;
      ap_idle  : out std_logic;
      ap_ready : out std_logic
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

  w_data(0)  <= data_0_V_read;
  w_data(1)  <= data_1_V_read;
  w_data(2)  <= data_2_V_read;
  w_data(3)  <= data_3_V_read;
  w_data(4)  <= data_4_V_read;
  w_data(5)  <= data_5_V_read;
  w_data(6)  <= data_6_V_read;
  w_data(7)  <= data_7_V_read;
  w_data(8)  <= data_8_V_read;
  w_data(9)  <= data_9_V_read;
  w_data(10) <= data_10_V_read;
  w_data(11) <= data_11_V_read;
  w_data(12) <= data_12_V_read;
  w_data(13) <= data_13_V_read;
  w_data(14) <= data_14_V_read;
  w_data(15) <= data_15_V_read;

  w_weight(0)  <= weight_0_V_read;
  w_weight(1)  <= weight_1_V_read;
  w_weight(2)  <= weight_2_V_read;
  w_weight(3)  <= weight_3_V_read;
  w_weight(4)  <= weight_4_V_read;
  w_weight(5)  <= weight_5_V_read;
  w_weight(6)  <= weight_6_V_read;
  w_weight(7)  <= weight_7_V_read;
  w_weight(8)  <= weight_8_V_read;
  w_weight(9)  <= weight_9_V_read;
  w_weight(10) <= weight_10_V_read;
  w_weight(11) <= weight_11_V_read;
  w_weight(12) <= weight_12_V_read;
  w_weight(13) <= weight_13_V_read;
  w_weight(14) <= weight_14_V_read;
  w_weight(15) <= weight_15_V_read;

  dnu_wrapper_inst : dnu_wrapper
  generic
  map (
  DATA_WIDTH        => DATA_WIDTH,
  PARALELISM_FACTOR => PARALELISM_FACTOR
  )
  port map
  (
    i_clk    => ap_clk,
    i_clear  => ap_rst,
    i_data_0 => w_data,
    i_data_1 => w_weight,
    o_data   => w_o_dnu_data
  );

  my_dense_controller_inst : my_dense_controller
  port
  map (
  ap_clk   => ap_clk,
  ap_rst   => ap_rst,
  ap_start => ap_start,
  ap_done  => ap_done,
  ap_idle  => ap_idle,
  ap_ready => ap_ready
  );

  gen_register_inst : gen_register
  generic
  map (
  DATA_WIDTH => DATA_WIDTH
  )
  port
  map (
  i_clk   => ap_clk,
  i_clear => ap_rst,
  i_load  => ap_start,
  i_data  => w_o_dnu_data(DATA_WIDTH - 1 downto 0),
  o_q     => ap_return
  );
end architecture;