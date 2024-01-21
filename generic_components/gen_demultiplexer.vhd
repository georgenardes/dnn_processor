library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library work;
use work.types_pkg.all;

entity gen_demultiplexer is
  generic
  (
    NC_SEL_WIDTH : integer := 2;
    DATA_WIDTH   : integer := 32
  );
  port
  (
    i_A   : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    i_SEL : in std_logic_vector(NC_SEL_WIDTH - 1 downto 0);
    o_Q   : out t_ARRAY_OF_LOGIC_VECTOR(0 to (2 ** NC_SEL_WIDTH) - 1)(DATA_WIDTH - 1 downto 0) := (others => (others => '0'))
  );
end gen_demultiplexer;

architecture arch of gen_demultiplexer is
begin

  p_DEMUX : process (i_A, i_SEL)
  begin
    for i in 0 to (2**NC_SEL_WIDTH - 1) loop
      o_Q(i) <= (others => '0');
    end loop;

    o_Q(to_integer(unsigned(i_SEL))) <= i_A;
  end process;

end arch;
------------------------------------------------------