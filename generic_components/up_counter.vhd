library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity up_counter is
  generic
  (
    WIDTH : integer := 4 -- Specify the width of the register
  );
  port
  (
    i_clk   : in std_logic; -- Clock input
    i_clear : in std_logic; -- Clear signal
    i_inc   : in std_logic; -- Increment counter
    o_q     : out std_logic_vector(WIDTH - 1 downto 0) -- Output data
  );
end entity up_counter;

architecture arch of up_counter is

  signal r_reg : std_logic_vector(WIDTH - 1 downto 0);
begin
  process (i_clk, i_clear, i_inc)
  begin
    if i_clear = '1' then
      r_reg <= (others => '0'); -- Clear the r_register
    elsif rising_edge(i_clk) then
      if i_inc = '1' then
        r_reg <= std_logic_vector(unsigned(r_reg) + 1);
      end if;
    end if;
  end process;

  o_q <= r_reg; -- Output data
end architecture arch;