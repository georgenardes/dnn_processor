library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.types_pkg.all;

entity controler is
  port
  (
    i_clk                    : in std_logic; -- clock input
    i_rst                    : in std_logic; -- clear signal
    i_go                     : in std_logic; -- start signal
    o_dram_addr_inc          : out std_logic;
    o_input_router_write_out : out std_logic;
    o_ready                  : out std_logic -- Output data
  );
end entity controler;

architecture arch of controler is
  -- Define states
  type t_STATE is (s_INIT, s0, s1, s2, s3, s4, s5, s6, s7, s71, s8, s9);
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

  p_NEXT : process (r_STATE, i_go)
  begin
    -- State transitions
    case r_STATE is
      when s_INIT =>
        if (i_GO = '1') then
          w_NEXT <= s0;
        else
          w_NEXT <= s_INIT;
        end if;

      when s0 =>
        w_NEXT <= s1;

      when s1 =>
        w_NEXT <= s2;

      when s2 =>
        w_NEXT <= s3;

      when s3 =>
        w_NEXT <= s4;

      when s4 =>
        w_NEXT <= s5;

      when s5 =>
        w_NEXT <= s6;

      when s6 =>
        w_NEXT <= s7;

      when s7 =>
        w_NEXT <= s71;

      when s71 =>
        w_NEXT <= s8;

      when s8 =>
        w_NEXT <= s9;

      when s9 =>
        w_NEXT <= s_INIT;

      when others =>
        w_NEXT <= s_INIT;

    end case;

  end process;

  o_dram_addr_inc <= '1' when (r_STATE = s0 or r_STATE = s1 or r_STATE = s3 or r_STATE = s4) else
    '0';
  o_input_router_write_out <= '1'when (r_STATE = s4 or r_STATE = s5) else
    '0';

    o_ready <= '1' when (r_STATE = s9) else
    '0';
end architecture arch;