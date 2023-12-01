library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity gen_adder is
  generic
  (
    WIDTH : integer := 4 -- Specify the width of the adder
  );
  port
  (
    i_a   : in std_logic_vector(WIDTH - 1 downto 0); -- Input operand A
    i_b   : in std_logic_vector(WIDTH - 1 downto 0); -- Input operand B
    o_sum : out std_logic_vector(WIDTH - 1 downto 0) -- Output sum
  );
end entity gen_adder;

architecture arch of gen_adder is
begin
  o_sum <= std_logic_vector(unsigned(i_a) + unsigned(i_b));
end architecture arch;