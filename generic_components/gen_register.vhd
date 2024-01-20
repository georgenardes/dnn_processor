library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity gen_register is
  generic
  (
    DATA_WIDTH : integer := 4 -- Specify the DATA_width of the register
  );
  port
  (
    i_clk   : in std_logic; -- Clock input
    i_clear : in std_logic; -- Clear signal
    i_load  : in std_logic; -- Load signal
    i_data  : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data
    o_q     : out std_logic_vector(DATA_WIDTH - 1 downto 0) -- Output data
  );
end entity gen_register;

architecture arch of gen_register is
  signal r_reg : std_logic_vector(DATA_WIDTH - 1 downto 0);
begin
  process (i_clk, i_clear, i_load, i_data)
  begin
    if i_clear = '1' then
      r_reg <= (others => '0'); -- Clear the r_register
    elsif rising_edge(i_clk) then
      if i_load = '1' then
        r_reg <= i_data; -- Load new data
      end if;
    end if;
  end process;

  o_q <= r_reg; -- Output data
end architecture arch;