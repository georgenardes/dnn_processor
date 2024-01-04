-- PACOTE DE TIPOS CUSTOMIZADOS e CONSTANTES GLOBAIS

library ieee;
use ieee.std_logic_1164.all;

package types_pkg is

  type t_ARRAY_OF_INTEGER is array (integer range <>) of integer;
  type t_ARRAY_OF_LOGIC_VECTOR is array(integer range <>) of std_logic_vector;
  type t_MAT_OF_LOGIC_VECTOR is array(integer range <>, integer range <>) of std_logic_vector;

end package types_pkg;