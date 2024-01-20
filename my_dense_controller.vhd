library IEEE;
use IEEE.STD_LOGIC_1164.all;
entity my_dense_controller is
  port
  (
    ap_clk   : in std_logic;
    ap_rst   : in std_logic;
    ap_start : in std_logic;
    ap_done  : out std_logic;
    ap_idle  : out std_logic;
    ap_ready : out std_logic
  );
end entity;
architecture rtl of my_dense_controller is
  -- Define states
  type t_STATE is (s_IDLE, s_READY);
  signal r_STATE, w_NEXT : t_STATE;
begin

  p_STATE : process (ap_clk, ap_rst)
  begin
    if ap_rst = '1' then
      r_STATE <= s_IDLE;
    elsif rising_edge(ap_clk) then
      r_STATE <= w_NEXT;
    end if;
  end process;

  p_NEXT : process (r_STATE, ap_start)
  begin

    case r_STATE is
      when s_IDLE =>
        if (ap_start = '1') then
          w_NEXT <= s_READY;
        else
          w_NEXT <= s_IDLE;
        end if;

      when s_READY =>
        w_NEXT <= s_IDLE;

      when others =>
        w_NEXT <= s_IDLE;

    end case;

  end process;

  ap_done <= '1' when ((r_STATE = s_READY) or (ap_start = '0' and r_STATE = s_IDLE)) else
    '0';

  ap_idle <= '1' when ((ap_start = '0') and (r_STATE = s_IDLE)) else
    '0';

  ap_ready <= '1' when (r_STATE = s_READY) else
    '0';

end architecture rtl;