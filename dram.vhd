library IEEE;
use IEEE.STD_LOGIC_1164.all;

library work;
use work.types_pkg.all;

entity dram is
  generic
  (
    DATA_WIDTH   : integer := 8; -- Specify the width of the register
    BUFFER_DEPTH : integer := 12 -- log2(depth) for addressing
  );
  port
  (
    i_clk   : in std_logic; -- Clock input
    i_clear : in std_logic; -- Clear signal
    i_wren  : in std_logic; -- WriteReadENable signal to memories (one_hot)
    i_data  : in std_logic_vector(DATA_WIDTH - 1 downto 0);
    i_addr  : in std_logic_vector(BUFFER_DEPTH - 1 downto 0);
    o_data  : out std_logic_vector(DATA_WIDTH - 1 downto 0)
  );
end entity dram;

architecture arch of dram is

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
  mem_block : ram_quartus_ip
  generic
  map (
  INIT_FILE_NAME => "mem_init_files/dram_mlp_full_data.mif",
  DATA_WIDTH     => DATA_WIDTH,
  DATA_DEPTH     => BUFFER_DEPTH
  )
  port map
  (
    address => i_addr,
    clock   => i_clk,
    data    => i_data,
    wren    => i_wren,
    q       => o_data
  );
end architecture arch;