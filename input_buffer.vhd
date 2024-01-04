library IEEE;
use IEEE.STD_LOGIC_1164.all;

library work;
use work.types_pkg.all;

entity input_buffer is
  generic
  (
    DATA_WIDTH   : integer := 8; -- Specify the width of the register
    BUFFER_DEPTH : integer := 8; -- log2(depth) for addressing
    NUM_BLOCKS   : integer := 16
  );
  port
  (
    i_clk   : in std_logic; -- Clock input
    i_clear : in std_logic; -- Clear signal
    i_wren  : in std_logic_vector(0 to NUM_BLOCKS - 1); -- WriteReadENable signal to memories (one_hot)
    i_data  : in t_ARRAY_OF_LOGIC_VECTOR(0 to NUM_BLOCKS - 1)(DATA_WIDTH - 1 downto 0);
    i_addrs : in t_ARRAY_OF_LOGIC_VECTOR(0 to NUM_BLOCKS - 1)(BUFFER_DEPTH - 1 downto 0);
    o_data  : out t_ARRAY_OF_LOGIC_VECTOR(0 to NUM_BLOCKS - 1)(DATA_WIDTH - 1 downto 0)
  );
end entity input_buffer;

architecture arch of input_buffer is

  component ram_quartus_ip
    generic
    (
      INIT_FILE_NAME : string;
      DATA_WIDTH     : integer;
      DATA_DEPTH     : integer
    );
    port
    (
      address : in std_logic_vector (DATA_DEPTH - 1 downto 0);
      clock   : in std_logic;
      data    : in std_logic_vector (DATA_WIDTH - 1 downto 0);
      wren    : in std_logic;
      q       : out std_logic_vector (DATA_WIDTH - 1 downto 0)
    );
  end component;

begin

  gen_mem_blocks :
  for i in 0 to NUM_BLOCKS - 1 generate

    mem_block : ram_quartus_ip
    generic
    map (
    INIT_FILE_NAME => "",
    DATA_WIDTH     => DATA_WIDTH,
    DATA_DEPTH     => BUFFER_DEPTH
    )
    port map
    (
      address => i_addrs(i),
      clock   => i_clk,
      data    => i_data(i),
      wren    => i_wren(i),
      q       => o_data(i)
    );

  end generate gen_mem_blocks;

end architecture arch;