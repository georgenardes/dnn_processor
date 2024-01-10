library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.types_pkg.all;

entity gen_comparator is
  generic
  (
    WIDTH : integer := 32
  );
  port
  (
    i_A : in std_logic_vector(WIDTH - 1 downto 0);
    i_B : in std_logic_vector(WIDTH - 1 downto 0);
    o_Q : out std_logic
  );
end gen_comparator;

architecture arch of gen_comparator is
begin

  o_Q <= '1' when (to_integer(signed(i_A)) < to_integer(signed(i_B))) else
    '0';
end arch;