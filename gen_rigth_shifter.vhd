library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity gen_rigth_shifter is
  generic
  (
    WIDTH     : integer   := 4; -- Specify the width of the shifter
    SHIFT_AMT : integer   := 1; -- Specify the shift amount (LR)
    IS_SIGNED : std_logic := '0'
  );
  port
  (
    i_data   : in std_logic_vector(WIDTH - 1 downto 0); -- Input data
    o_result : out std_logic_vector(WIDTH - 1 downto 0) -- Output shifted data
  );
end entity gen_rigth_shifter;

architecture arch of gen_rigth_shifter is
  signal w_result : std_logic_vector(WIDTH - 1 downto 0) := (others => '0');
begin

  signed_rshifter : if IS_SIGNED = '1' generate
    w_result(WIDTH - 1 downto WIDTH - 1 - SHIFT_AMT) <= (others => i_data(WIDTH - 1));
    w_result(WIDTH - 1 - SHIFT_AMT downto 0)         <= i_data(WIDTH - 1 downto SHIFT_AMT); -- Right shift
  end generate signed_rshifter;

  unsigned_rshifter : if IS_SIGNED = '0' generate
    w_result(WIDTH - 1 - SHIFT_AMT downto 0) <= i_data(WIDTH - 1 downto SHIFT_AMT); -- Right shift
  end generate unsigned_rshifter;

  o_result <= w_result; -- Output the shifted data
end architecture arch;