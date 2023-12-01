library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity gen_multiplier is
  generic
  (
    WIDTH : integer := 4 -- Specify the width of the multiplier
  );
  port
  (
    i_a      : in std_logic_vector(WIDTH - 1 downto 0); -- Input operand A
    i_b      : in std_logic_vector(WIDTH - 1 downto 0); -- Input operand B
    o_result : out std_logic_vector(2 * WIDTH - 1 downto 0) -- Output result
  );
end entity gen_multiplier;

architecture arch of gen_multiplier is
begin
  o_result <= std_logic_vector(signed(i_a) * signed(i_b)); -- Output the result
end architecture arch;