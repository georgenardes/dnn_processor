-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and OpenCL
-- Version: 2020.1
-- Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity dense_wrapper_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_config2_s is
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
    ap_return        : out std_logic_vector (15 downto 0));
end;
architecture behav of dense_wrapper_ap_fixed_16_6_5_3_0_ap_fixed_16_6_5_3_0_config2_s is
  constant ap_const_logic_1      : std_logic                      := '1';
  constant ap_const_logic_0      : std_logic                      := '0';
  constant ap_ST_fsm_state1      : std_logic_vector (6 downto 0)  := "0000001";
  constant ap_ST_fsm_state2      : std_logic_vector (6 downto 0)  := "0000010";
  constant ap_ST_fsm_state3      : std_logic_vector (6 downto 0)  := "0000100";
  constant ap_ST_fsm_state4      : std_logic_vector (6 downto 0)  := "0001000";
  constant ap_ST_fsm_state5      : std_logic_vector (6 downto 0)  := "0010000";
  constant ap_ST_fsm_state6      : std_logic_vector (6 downto 0)  := "0100000";
  constant ap_ST_fsm_state7      : std_logic_vector (6 downto 0)  := "1000000";
  constant ap_const_lv32_0       : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
  constant ap_const_lv32_1       : std_logic_vector (31 downto 0) := "00000000000000000000000000000001";
  constant ap_const_lv32_2       : std_logic_vector (31 downto 0) := "00000000000000000000000000000010";
  constant ap_const_lv32_3       : std_logic_vector (31 downto 0) := "00000000000000000000000000000011";
  constant ap_const_lv32_4       : std_logic_vector (31 downto 0) := "00000000000000000000000000000100";
  constant ap_const_lv32_5       : std_logic_vector (31 downto 0) := "00000000000000000000000000000101";
  constant ap_const_lv32_A       : std_logic_vector (31 downto 0) := "00000000000000000000000000001010";
  constant ap_const_lv32_19      : std_logic_vector (31 downto 0) := "00000000000000000000000000011001";
  constant ap_const_lv32_17      : std_logic_vector (31 downto 0) := "00000000000000000000000000010111";
  constant ap_const_lv8_0        : std_logic_vector (7 downto 0)  := "00000000";
  constant ap_const_lv5_0        : std_logic_vector (4 downto 0)  := "00000";
  constant ap_const_lv32_18      : std_logic_vector (31 downto 0) := "00000000000000000000000000011000";
  constant ap_const_lv32_6       : std_logic_vector (31 downto 0) := "00000000000000000000000000000110";
  constant ap_const_lv26_3FFFEF3 : std_logic_vector (25 downto 0) := "11111111111111111011110011";
  constant ap_const_lv26_254     : std_logic_vector (25 downto 0) := "00000000000000001001010100";
  constant ap_const_lv24_FFFFA4  : std_logic_vector (23 downto 0) := "111111111111111110100100";
  constant ap_const_lv26_3FFFDCA : std_logic_vector (25 downto 0) := "11111111111111110111001010";
  constant ap_const_lv24_55      : std_logic_vector (23 downto 0) := "000000000000000001010101";
  constant ap_const_lv26_3FFFEF2 : std_logic_vector (25 downto 0) := "11111111111111111011110010";
  constant ap_const_lv26_18B     : std_logic_vector (25 downto 0) := "00000000000000000110001011";
  constant ap_const_lv26_3FFFDB3 : std_logic_vector (25 downto 0) := "11111111111111110110110011";
  constant ap_const_lv26_122     : std_logic_vector (25 downto 0) := "00000000000000000100100010";
  constant ap_const_lv26_11E     : std_logic_vector (25 downto 0) := "00000000000000000100011110";
  constant ap_const_lv26_3FFFDCC : std_logic_vector (25 downto 0) := "11111111111111110111001100";
  constant ap_const_lv26_185     : std_logic_vector (25 downto 0) := "00000000000000000110000101";
  constant ap_const_lv25_1FFFF6B : std_logic_vector (24 downto 0) := "1111111111111111101101011";
  constant ap_const_lv25_CE      : std_logic_vector (24 downto 0) := "0000000000000000011001110";
  constant ap_const_lv25_1FFFF79 : std_logic_vector (24 downto 0) := "1111111111111111101111001";
  constant ap_const_boolean_1    : boolean                        := true;

  signal ap_CS_fsm                           : std_logic_vector (6 downto 0) := "0000001";
  attribute fsm_encoding                     : string;
  attribute fsm_encoding of ap_CS_fsm        : signal is "none";
  signal ap_CS_fsm_state1                    : std_logic;
  attribute fsm_encoding of ap_CS_fsm_state1 : signal is "none";
  signal ap_CS_fsm_state2                    : std_logic;
  attribute fsm_encoding of ap_CS_fsm_state2 : signal is "none";
  signal grp_fu_525_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_2_reg_675                : std_logic_vector (31 downto 0);
  signal ap_CS_fsm_state3                    : std_logic;
  attribute fsm_encoding of ap_CS_fsm_state3 : signal is "none";
  signal grp_fu_531_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_3_reg_680                : std_logic_vector (31 downto 0);
  signal grp_fu_537_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_reg_700                  : std_logic_vector (31 downto 0);
  signal ap_CS_fsm_state4                    : std_logic;
  attribute fsm_encoding of ap_CS_fsm_state4 : signal is "none";
  signal grp_fu_543_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_1_reg_705                : std_logic_vector (31 downto 0);
  signal grp_fu_549_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_4_reg_710                : std_logic_vector (31 downto 0);
  signal grp_fu_555_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_5_reg_715                : std_logic_vector (31 downto 0);
  signal grp_fu_561_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_7_reg_720                : std_logic_vector (31 downto 0);
  signal grp_fu_567_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_8_reg_725                : std_logic_vector (31 downto 0);
  signal grp_fu_573_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_9_reg_730                : std_logic_vector (31 downto 0);
  signal grp_fu_579_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_10_reg_735               : std_logic_vector (31 downto 0);
  signal grp_fu_585_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_11_reg_740               : std_logic_vector (31 downto 0);
  signal grp_fu_591_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_14_reg_745               : std_logic_vector (31 downto 0);
  signal add_ln703_fu_260_p2                 : std_logic_vector (15 downto 0);
  signal add_ln703_reg_750                   : std_logic_vector (15 downto 0);
  signal grp_fu_597_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_6_reg_755                : std_logic_vector (31 downto 0);
  signal ap_CS_fsm_state5                    : std_logic;
  attribute fsm_encoding of ap_CS_fsm_state5 : signal is "none";
  signal trunc_ln708_9_reg_760               : std_logic_vector (14 downto 0);
  signal grp_fu_603_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_12_reg_765               : std_logic_vector (31 downto 0);
  signal grp_fu_609_p2                       : std_logic_vector (31 downto 0);
  signal mul_ln1118_13_reg_770               : std_logic_vector (31 downto 0);
  signal add_ln703_2_fu_410_p2               : std_logic_vector (15 downto 0);
  signal add_ln703_2_reg_775                 : std_logic_vector (15 downto 0);
  signal add_ln703_3_fu_415_p2               : std_logic_vector (15 downto 0);
  signal add_ln703_3_reg_780                 : std_logic_vector (15 downto 0);
  signal add_ln703_4_fu_421_p2               : std_logic_vector (15 downto 0);
  signal add_ln703_4_reg_785                 : std_logic_vector (15 downto 0);
  signal add_ln703_7_fu_427_p2               : std_logic_vector (15 downto 0);
  signal add_ln703_7_reg_790                 : std_logic_vector (15 downto 0);
  signal add_ln703_11_fu_433_p2              : std_logic_vector (14 downto 0);
  signal add_ln703_11_reg_795                : std_logic_vector (14 downto 0);
  signal add_ln703_6_fu_485_p2               : std_logic_vector (15 downto 0);
  signal add_ln703_6_reg_800                 : std_logic_vector (15 downto 0);
  signal ap_CS_fsm_state6                    : std_logic;
  attribute fsm_encoding of ap_CS_fsm_state6 : signal is "none";
  signal add_ln703_9_fu_496_p2               : std_logic_vector (15 downto 0);
  signal add_ln703_9_reg_805                 : std_logic_vector (15 downto 0);
  signal add_ln703_12_fu_510_p2              : std_logic_vector (15 downto 0);
  signal add_ln703_12_reg_810                : std_logic_vector (15 downto 0);
  signal trunc_ln708_3_fu_251_p4             : std_logic_vector (15 downto 0);
  signal trunc_ln708_2_fu_242_p4             : std_logic_vector (15 downto 0);
  signal trunc_ln_fu_266_p4                  : std_logic_vector (13 downto 0);
  signal trunc_ln708_4_fu_288_p4             : std_logic_vector (13 downto 0);
  signal shl_ln_fu_328_p3                    : std_logic_vector (23 downto 0);
  signal shl_ln1118_1_fu_340_p3              : std_logic_vector (20 downto 0);
  signal sext_ln1118_12_fu_348_p1            : std_logic_vector (24 downto 0);
  signal sext_ln1118_11_fu_336_p1            : std_logic_vector (24 downto 0);
  signal add_ln1118_fu_352_p2                : std_logic_vector (24 downto 0);
  signal trunc_ln708_7_fu_310_p4             : std_logic_vector (15 downto 0);
  signal trunc_ln708_5_fu_301_p4             : std_logic_vector (15 downto 0);
  signal add_ln703_1_fu_404_p2               : std_logic_vector (15 downto 0);
  signal trunc_ln708_s_fu_368_p4             : std_logic_vector (15 downto 0);
  signal trunc_ln708_8_fu_319_p4             : std_logic_vector (15 downto 0);
  signal trunc_ln708_11_fu_386_p4            : std_logic_vector (15 downto 0);
  signal trunc_ln708_10_fu_377_p4            : std_logic_vector (15 downto 0);
  signal trunc_ln708_1_fu_279_p4             : std_logic_vector (15 downto 0);
  signal trunc_ln708_14_fu_395_p4            : std_logic_vector (15 downto 0);
  signal sext_ln1118_6_fu_297_p1             : std_logic_vector (14 downto 0);
  signal sext_ln1118_1_fu_275_p1             : std_logic_vector (14 downto 0);
  signal trunc_ln708_6_fu_439_p4             : std_logic_vector (14 downto 0);
  signal trunc_ln708_12_fu_455_p4            : std_logic_vector (14 downto 0);
  signal trunc_ln708_13_fu_468_p4            : std_logic_vector (14 downto 0);
  signal add_ln703_5_fu_481_p2               : std_logic_vector (15 downto 0);
  signal sext_ln708_1_fu_452_p1              : std_logic_vector (15 downto 0);
  signal sext_ln708_fu_448_p1                : std_logic_vector (15 downto 0);
  signal add_ln703_8_fu_490_p2               : std_logic_vector (15 downto 0);
  signal sext_ln708_3_fu_477_p1              : std_logic_vector (15 downto 0);
  signal sext_ln708_2_fu_464_p1              : std_logic_vector (15 downto 0);
  signal add_ln703_10_fu_501_p2              : std_logic_vector (15 downto 0);
  signal sext_ln703_fu_507_p1                : std_logic_vector (15 downto 0);
  signal ap_CS_fsm_state7                    : std_logic;
  attribute fsm_encoding of ap_CS_fsm_state7 : signal is "none";
  signal add_ln703_13_fu_516_p2              : std_logic_vector (15 downto 0);
  signal grp_fu_525_p1                       : std_logic_vector (9 downto 0);
  signal grp_fu_531_p1                       : std_logic_vector (10 downto 0);
  signal grp_fu_537_p1                       : std_logic_vector (7 downto 0);
  signal grp_fu_543_p1                       : std_logic_vector (10 downto 0);
  signal grp_fu_549_p1                       : std_logic_vector (7 downto 0);
  signal grp_fu_555_p1                       : std_logic_vector (9 downto 0);
  signal grp_fu_561_p1                       : std_logic_vector (9 downto 0);
  signal grp_fu_567_p1                       : std_logic_vector (10 downto 0);
  signal grp_fu_573_p1                       : std_logic_vector (9 downto 0);
  signal grp_fu_579_p1                       : std_logic_vector (9 downto 0);
  signal grp_fu_585_p1                       : std_logic_vector (10 downto 0);
  signal grp_fu_591_p1                       : std_logic_vector (9 downto 0);
  signal grp_fu_597_p1                       : std_logic_vector (8 downto 0);
  signal grp_fu_603_p1                       : std_logic_vector (8 downto 0);
  signal grp_fu_609_p1                       : std_logic_vector (8 downto 0);
  signal ap_NS_fsm                           : std_logic_vector (6 downto 0);

  component myproject_axi_mul_mul_16s_10s_26_3_1 is
    generic
    (
      ID         : integer;
      NUM_STAGE  : integer;
      din0_WIDTH : integer;
      din1_WIDTH : integer;
      dout_WIDTH : integer);
    port
    (
      clk   : in std_logic;
      reset : in std_logic;
      din0  : in std_logic_vector (15 downto 0);
      din1  : in std_logic_vector (15 downto 0);
      ce    : in std_logic;
      dout  : out std_logic_vector (31 downto 0));
  end component;
begin
  myproject_axi_mul_mul_16s_10s_26_3_1_U25 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port map
  (
    clk   => ap_clk,
    reset => ap_rst,
    din0  => data_2_V_read,
    din1  => weight_2_V_read,
    ce    => ap_const_logic_1,
    dout  => grp_fu_525_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U26 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_3_V_read,
  din1  => weight_3_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_531_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U27 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_0_V_read,
  din1  => weight_0_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_537_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U28 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_1_V_read,
  din1  => weight_1_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_543_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U29 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_4_V_read,
  din1  => weight_4_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_549_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U30 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_5_V_read,
  din1  => weight_5_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_555_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U31 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_7_V_read,
  din1  => weight_7_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_561_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U32 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_8_V_read,
  din1  => weight_8_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_567_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U33 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_10_V_read,
  din1  => weight_10_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_573_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U34 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_11_V_read,
  din1  => weight_11_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_579_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U35 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_12_V_read,
  din1  => weight_12_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_585_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U36 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_15_V_read,
  din1  => weight_15_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_591_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U37 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_6_V_read,
  din1  => weight_6_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_597_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U38 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_13_V_read,
  din1  => weight_13_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_603_p2);

  myproject_axi_mul_mul_16s_10s_26_3_1_U39 : myproject_axi_mul_mul_16s_10s_26_3_1
  generic
  map (
  ID         => 1,
  NUM_STAGE  => 3,
  din0_WIDTH => 16,
  din1_WIDTH => 16,
  dout_WIDTH => 32)
  port
  map (
  clk   => ap_clk,
  reset => ap_rst,
  din0  => data_14_V_read,
  din1  => weight_14_V_read,
  ce    => ap_const_logic_1,
  dout  => grp_fu_609_p2);

  ap_CS_fsm_assign_proc : process (ap_clk)
  begin
    if (ap_clk'event and ap_clk = '1') then
      if (ap_rst = '1') then
        ap_CS_fsm <= ap_ST_fsm_state1;
      else
        ap_CS_fsm <= ap_NS_fsm;
      end if;
    end if;
  end process;

  process (ap_clk)
  begin
    if (ap_clk'event and ap_clk = '1') then
      if ((ap_const_logic_1 = ap_CS_fsm_state5)) then
        add_ln703_11_reg_795  <= add_ln703_11_fu_433_p2;
        add_ln703_2_reg_775   <= add_ln703_2_fu_410_p2;
        add_ln703_3_reg_780   <= add_ln703_3_fu_415_p2;
        add_ln703_4_reg_785   <= add_ln703_4_fu_421_p2;
        add_ln703_7_reg_790   <= add_ln703_7_fu_427_p2;
        mul_ln1118_12_reg_765 <= grp_fu_603_p2;
        mul_ln1118_13_reg_770 <= grp_fu_609_p2;
        mul_ln1118_6_reg_755  <= grp_fu_597_p2;
        trunc_ln708_9_reg_760 <= add_ln1118_fu_352_p2(24 downto 10);
      end if;
    end if;
  end process;
  process (ap_clk)
  begin
    if (ap_clk'event and ap_clk = '1') then
      if ((ap_const_logic_1 = ap_CS_fsm_state6)) then
        add_ln703_12_reg_810 <= add_ln703_12_fu_510_p2;
        add_ln703_6_reg_800  <= add_ln703_6_fu_485_p2;
        add_ln703_9_reg_805  <= add_ln703_9_fu_496_p2;
      end if;
    end if;
  end process;
  process (ap_clk)
  begin
    if (ap_clk'event and ap_clk = '1') then
      if ((ap_const_logic_1 = ap_CS_fsm_state4)) then
        add_ln703_reg_750     <= add_ln703_fu_260_p2;
        mul_ln1118_10_reg_735 <= grp_fu_579_p2;
        mul_ln1118_11_reg_740 <= grp_fu_585_p2;
        mul_ln1118_14_reg_745 <= grp_fu_591_p2;
        mul_ln1118_1_reg_705  <= grp_fu_543_p2;
        mul_ln1118_4_reg_710  <= grp_fu_549_p2;
        mul_ln1118_5_reg_715  <= grp_fu_555_p2;
        mul_ln1118_7_reg_720  <= grp_fu_561_p2;
        mul_ln1118_8_reg_725  <= grp_fu_567_p2;
        mul_ln1118_9_reg_730  <= grp_fu_573_p2;
        mul_ln1118_reg_700    <= grp_fu_537_p2;
      end if;
    end if;
  end process;
  process (ap_clk)
  begin
    if (ap_clk'event and ap_clk = '1') then
      if ((ap_const_logic_1 = ap_CS_fsm_state3)) then
        mul_ln1118_2_reg_675 <= grp_fu_525_p2;
        mul_ln1118_3_reg_680 <= grp_fu_531_p2;
      end if;
    end if;
  end process;

  ap_NS_fsm_assign_proc : process (ap_start, ap_CS_fsm, ap_CS_fsm_state1)
  begin
    case ap_CS_fsm is
      when ap_ST_fsm_state1 =>
        if (((ap_const_logic_1 = ap_CS_fsm_state1) and (ap_start = ap_const_logic_1))) then
          ap_NS_fsm <= ap_ST_fsm_state2;
        else
          ap_NS_fsm <= ap_ST_fsm_state1;
        end if;
      when ap_ST_fsm_state2 =>
        ap_NS_fsm <= ap_ST_fsm_state3;
      when ap_ST_fsm_state3 =>
        ap_NS_fsm <= ap_ST_fsm_state4;
      when ap_ST_fsm_state4 =>
        ap_NS_fsm <= ap_ST_fsm_state5;
      when ap_ST_fsm_state5 =>
        ap_NS_fsm <= ap_ST_fsm_state6;
      when ap_ST_fsm_state6 =>
        ap_NS_fsm <= ap_ST_fsm_state7;
      when ap_ST_fsm_state7 =>
        ap_NS_fsm <= ap_ST_fsm_state1;
      when others =>
        ap_NS_fsm <= "XXXXXXX";
    end case;
  end process;
  add_ln1118_fu_352_p2   <= std_logic_vector(signed(sext_ln1118_12_fu_348_p1) + signed(sext_ln1118_11_fu_336_p1));
  add_ln703_10_fu_501_p2 <= std_logic_vector(signed(sext_ln708_3_fu_477_p1) + signed(sext_ln708_2_fu_464_p1));
  add_ln703_11_fu_433_p2 <= std_logic_vector(signed(sext_ln1118_6_fu_297_p1) + signed(sext_ln1118_1_fu_275_p1));
  add_ln703_12_fu_510_p2 <= std_logic_vector(unsigned(add_ln703_10_fu_501_p2) + unsigned(sext_ln703_fu_507_p1));
  add_ln703_13_fu_516_p2 <= std_logic_vector(unsigned(add_ln703_9_reg_805) + unsigned(add_ln703_12_reg_810));
  add_ln703_1_fu_404_p2  <= std_logic_vector(unsigned(trunc_ln708_7_fu_310_p4) + unsigned(trunc_ln708_5_fu_301_p4));
  add_ln703_2_fu_410_p2  <= std_logic_vector(unsigned(add_ln703_reg_750) + unsigned(add_ln703_1_fu_404_p2));
  add_ln703_3_fu_415_p2  <= std_logic_vector(unsigned(trunc_ln708_s_fu_368_p4) + unsigned(trunc_ln708_8_fu_319_p4));
  add_ln703_4_fu_421_p2  <= std_logic_vector(unsigned(trunc_ln708_11_fu_386_p4) + unsigned(trunc_ln708_10_fu_377_p4));
  add_ln703_5_fu_481_p2  <= std_logic_vector(unsigned(add_ln703_3_reg_780) + unsigned(add_ln703_4_reg_785));
  add_ln703_6_fu_485_p2  <= std_logic_vector(unsigned(add_ln703_2_reg_775) + unsigned(add_ln703_5_fu_481_p2));
  add_ln703_7_fu_427_p2  <= std_logic_vector(unsigned(trunc_ln708_1_fu_279_p4) + unsigned(trunc_ln708_14_fu_395_p4));
  add_ln703_8_fu_490_p2  <= std_logic_vector(signed(sext_ln708_1_fu_452_p1) + signed(sext_ln708_fu_448_p1));
  add_ln703_9_fu_496_p2  <= std_logic_vector(unsigned(add_ln703_7_reg_790) + unsigned(add_ln703_8_fu_490_p2));
  add_ln703_fu_260_p2    <= std_logic_vector(unsigned(trunc_ln708_3_fu_251_p4) + unsigned(trunc_ln708_2_fu_242_p4));
  ap_CS_fsm_state1       <= ap_CS_fsm(0);
  ap_CS_fsm_state2       <= ap_CS_fsm(1);
  ap_CS_fsm_state3       <= ap_CS_fsm(2);
  ap_CS_fsm_state4       <= ap_CS_fsm(3);
  ap_CS_fsm_state5       <= ap_CS_fsm(4);
  ap_CS_fsm_state6       <= ap_CS_fsm(5);
  ap_CS_fsm_state7       <= ap_CS_fsm(6);

  ap_done_assign_proc : process (ap_start, ap_CS_fsm_state1, ap_CS_fsm_state7)
  begin
    if (((ap_const_logic_1 = ap_CS_fsm_state7) or ((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1)))) then
      ap_done <= ap_const_logic_1;
    else
      ap_done <= ap_const_logic_0;
    end if;
  end process;
  ap_idle_assign_proc : process (ap_start, ap_CS_fsm_state1)
  begin
    if (((ap_start = ap_const_logic_0) and (ap_const_logic_1 = ap_CS_fsm_state1))) then
      ap_idle <= ap_const_logic_1;
    else
      ap_idle <= ap_const_logic_0;
    end if;
  end process;
  ap_ready_assign_proc : process (ap_CS_fsm_state7)
  begin
    if ((ap_const_logic_1 = ap_CS_fsm_state7)) then
      ap_ready <= ap_const_logic_1;
    else
      ap_ready <= ap_const_logic_0;
    end if;
  end process;

  ap_return                <= std_logic_vector(unsigned(add_ln703_6_reg_800) + unsigned(add_ln703_13_fu_516_p2));
  grp_fu_525_p1            <= ap_const_lv26_3FFFEF3(10 - 1 downto 0);
  grp_fu_531_p1            <= ap_const_lv26_254(11 - 1 downto 0);
  grp_fu_537_p1            <= ap_const_lv24_FFFFA4(8 - 1 downto 0);
  grp_fu_543_p1            <= ap_const_lv26_3FFFDCA(11 - 1 downto 0);
  grp_fu_549_p1            <= ap_const_lv24_55(8 - 1 downto 0);
  grp_fu_555_p1            <= ap_const_lv26_3FFFEF2(10 - 1 downto 0);
  grp_fu_561_p1            <= ap_const_lv26_18B(10 - 1 downto 0);
  grp_fu_567_p1            <= ap_const_lv26_3FFFDB3(11 - 1 downto 0);
  grp_fu_573_p1            <= ap_const_lv26_122(10 - 1 downto 0);
  grp_fu_579_p1            <= ap_const_lv26_11E(10 - 1 downto 0);
  grp_fu_585_p1            <= ap_const_lv26_3FFFDCC(11 - 1 downto 0);
  grp_fu_591_p1            <= ap_const_lv26_185(10 - 1 downto 0);
  grp_fu_597_p1            <= ap_const_lv25_1FFFF6B(9 - 1 downto 0);
  grp_fu_603_p1            <= ap_const_lv25_CE(9 - 1 downto 0);
  grp_fu_609_p1            <= ap_const_lv25_1FFFF79(9 - 1 downto 0);
  sext_ln1118_11_fu_336_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(shl_ln_fu_328_p3), 25));

  sext_ln1118_12_fu_348_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(shl_ln1118_1_fu_340_p3), 25));

  sext_ln1118_1_fu_275_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln_fu_266_p4), 15));

  sext_ln1118_6_fu_297_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln708_4_fu_288_p4), 15));

  sext_ln703_fu_507_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(add_ln703_11_reg_795), 16));

  sext_ln708_1_fu_452_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln708_9_reg_760), 16));

  sext_ln708_2_fu_464_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln708_12_fu_455_p4), 16));

  sext_ln708_3_fu_477_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln708_13_fu_468_p4), 16));

  sext_ln708_fu_448_p1 <= std_logic_vector(IEEE.numeric_std.resize(signed(trunc_ln708_6_fu_439_p4), 16));

  shl_ln1118_1_fu_340_p3   <= (data_9_V_read & ap_const_lv5_0);
  shl_ln_fu_328_p3         <= (data_9_V_read & ap_const_lv8_0);
  trunc_ln708_10_fu_377_p4 <= mul_ln1118_10_reg_735(25 downto 10);
  trunc_ln708_11_fu_386_p4 <= mul_ln1118_11_reg_740(25 downto 10);
  trunc_ln708_12_fu_455_p4 <= mul_ln1118_12_reg_765(24 downto 10);
  trunc_ln708_13_fu_468_p4 <= mul_ln1118_13_reg_770(24 downto 10);
  trunc_ln708_14_fu_395_p4 <= mul_ln1118_14_reg_745(25 downto 10);
  trunc_ln708_1_fu_279_p4  <= mul_ln1118_1_reg_705(25 downto 10);
  trunc_ln708_2_fu_242_p4  <= mul_ln1118_2_reg_675(25 downto 10);
  trunc_ln708_3_fu_251_p4  <= mul_ln1118_3_reg_680(25 downto 10);
  trunc_ln708_4_fu_288_p4  <= mul_ln1118_4_reg_710(23 downto 10);
  trunc_ln708_5_fu_301_p4  <= mul_ln1118_5_reg_715(25 downto 10);
  trunc_ln708_6_fu_439_p4  <= mul_ln1118_6_reg_755(24 downto 10);
  trunc_ln708_7_fu_310_p4  <= mul_ln1118_7_reg_720(25 downto 10);
  trunc_ln708_8_fu_319_p4  <= mul_ln1118_8_reg_725(25 downto 10);
  trunc_ln708_s_fu_368_p4  <= mul_ln1118_9_reg_730(25 downto 10);
  trunc_ln_fu_266_p4       <= mul_ln1118_reg_700(23 downto 10);
end behav;