library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.types_pkg.all;

entity controler is
  port
  (
    i_clk           : in std_logic; -- clock input
    i_rst           : in std_logic; -- clear signal
    i_go            : in std_logic; -- start signal
    i_i_comp        : in std_logic; -- input signal control
    i_j_comp        : in std_logic; -- input signal control
    o_i_rst         : out std_logic; -- output signal control
    o_j_rst         : out std_logic; -- output signal control
    o_i_inc         : out std_logic; -- output signal control
    o_j_inc         : out std_logic; -- output signal control
    o_mux_mul_sel   : out std_logic;
    o_mux_err_sel   : out std_logic;
    o_err_next_wren : out std_logic;
    o_weight_wren   : out std_logic;
    o_bias_wren     : out std_logic;

    o_ready : out std_logic -- Output data
  );
end entity controler;

architecture arch of controler is
  -- Define states
  type t_STATE is (s_INIT, s_0, s_1, s_2, s_2_s_0, s_3, s_3_1, s_4, s_5, s_6, s_7, s_7_1, s_8, s_9);
  signal r_STATE, w_NEXT : t_STATE;
begin

  p_STATE : process (i_clk, i_rst)
  begin
    if i_rst = '1' then
      r_STATE <= s_INIT; -- Initial state after reset
    elsif rising_edge(i_clk) then
      r_STATE <= w_NEXT; -- Update current state at each clock edge
    end if;
  end process;

  p_NEXT : process (r_STATE, i_go, i_i_comp, i_j_comp)
  begin
    -- State transitions
    case r_STATE is
      when s_INIT =>
        if (i_GO = '1') then
          w_NEXT <= s_0;
        else
          w_NEXT <= s_INIT;
        end if;

      when s_0 =>
        if (i_j_comp = '1') then
          w_NEXT <= s_1;
        else
          w_NEXT <= s_4;
        end if;

      when s_1 =>
        w_NEXT <= s_2;

      when s_2 =>
        if (i_i_comp = '1') then
          w_NEXT <= s_3;
        else
          w_NEXT <= s_2_s_0;
        end if;

      when s_2_s_0 =>
        w_NEXT <= s_0;

      when s_3 =>
        w_NEXT <= s_3_1;

      when s_3_1 =>
        w_NEXT <= s_2;

      when s_4 =>
        w_NEXT <= s_5;

      when s_5 =>
        if (i_i_comp = '1') then
          w_NEXT <= s_6;
        else
          w_NEXT <= s_9;
        end if;

      when s_6 =>
        if (i_j_comp = '1') then
          w_NEXT <= s_7;
        else
          w_NEXT <= s_8;
        end if;

      when s_7 =>
        w_NEXT <= s_7_1;

      when s_7_1 =>
        w_NEXT <= s_6;

      when s_8 =>
        w_NEXT <= s_5;

      when s_9 =>
        w_NEXT <= s_9;

      when others =>
        w_NEXT <= s_INIT;

    end case;

  end process;

  o_i_rst <= '1' when (r_STATE = s_INIT or r_STATE = s_1 or r_STATE = s_4) else
    '0';
  o_j_rst <= '1' when (r_STATE = s_INIT or r_STATE = s_5) else
    '0';

  o_i_inc <= '1' when (r_STATE = s_3_1 or r_STATE = s_8) else
    '0';
  o_j_inc <= '1' when (r_STATE = s_2_s_0 or r_STATE = s_7_1) else
    '0';

  o_mux_mul_sel <= '1' when (r_STATE = s_1 or r_STATE = s_3_1) else
    '0';

  o_mux_err_sel <= '1' when (r_STATE = s_1) else
    '0';

  o_err_next_wren <= '1' when (r_STATE = s_1 or r_STATE = s_3_1) else
    '0';

  o_weight_wren <= '1' when (r_STATE = s_7_1) else
    '0';

  o_bias_wren <= '1' when (r_STATE = s_8) else
    '0';

  o_ready <= '1' when (r_STATE = s_9) else
    '0';
end architecture arch;