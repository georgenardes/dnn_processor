library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity memory_bank is
  generic
  (
    DATA_WIDTH          : integer := 8; -- Specify the width of the register
    GRADIENT_DATA_DEPTH : integer := 8;
    INPUT_DATA_DEPTH    : integer := 8;
    WEIGHT_DATA_DEPTH   : integer := 8;
    ERR_NEXT_DATA_DEPTH : integer := 8;
    BIAS_DATA_DEPTH     : integer := 6
  );
  port
  (
    i_clk   : in std_logic; -- Clock input
    i_clear : in std_logic; -- Clear signal
    i_wren  : in std_logic_vector(4 downto 0); -- WriteReadENable signal to memories (one_hot)
    i_gradient      : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data
    i_gradient_addr : in std_logic_vector(GRADIENT_DATA_DEPTH - 1 downto 0); -- Input data addr
    i_input      : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data
    i_input_addr : in std_logic_vector(INPUT_DATA_DEPTH - 1 downto 0); -- Input data addr
    i_weight      : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data
    i_weight_addr : in std_logic_vector(WEIGHT_DATA_DEPTH - 1 downto 0); -- Input data addr
    i_err_next      : in std_logic_vector(2 * DATA_WIDTH - 1 downto 0); -- Input data
    i_err_next_addr : in std_logic_vector(ERR_NEXT_DATA_DEPTH - 1 downto 0); -- Input data addr
    i_bias      : in std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data
    i_bias_addr : in std_logic_vector(BIAS_DATA_DEPTH - 1 downto 0); -- Input data addr
    
    o_gradient      : out std_logic_vector(DATA_WIDTH - 1 downto 0); -- Output data
    o_input      : out std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data
    o_weight      : out std_logic_vector(DATA_WIDTH - 1 downto 0); -- Input data
    o_err_next      : out std_logic_vector(2 * DATA_WIDTH - 1 downto 0); -- Input data
    o_bias      : out std_logic_vector(DATA_WIDTH - 1 downto 0) -- Input data
  );
end entity memory_bank;

architecture arch of memory_bank is
  component ram_quartus_ip
    generic
    (
      INIT_FILE_NAME : string;
      DATA_WIDTH : integer;
      DATA_DEPTH : integer
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

  gradient_mem : ram_quartus_ip
    generic
    map (
    INIT_FILE_NAME => "mem_init_files/mem_gradient.mif",
    DATA_WIDTH => DATA_WIDTH,
    DATA_DEPTH => GRADIENT_DATA_DEPTH
    )
    port map
    (
      address => i_gradient_addr,
      clock   => i_clk,
      data    => i_gradient,
      wren    => i_wren(0),
      q       => o_gradient
    );

  input_mem : ram_quartus_ip
    generic
    map (
    INIT_FILE_NAME => "mem_init_files/mem_input.mif",
    DATA_WIDTH => DATA_WIDTH,
    DATA_DEPTH => INPUT_DATA_DEPTH
    )
    port
    map
    (
    address => i_input_addr,
    clock   => i_clk,
    data    => i_input,
    wren    => i_wren(1),
    q       => o_input
    );
  weight_mem : ram_quartus_ip
    generic
    map (
    INIT_FILE_NAME => "mem_init_files/mem_weight.mif",
    DATA_WIDTH => DATA_WIDTH,
    DATA_DEPTH => WEIGHT_DATA_DEPTH
    )
    port
    map
    (
    address => i_weight_addr,
    clock   => i_clk,
    data    => i_weight,
    wren    => i_wren(2),
    q       => o_weight
    );

  err_next_mem : ram_quartus_ip
    generic
    map (
    INIT_FILE_NAME => "",
    DATA_WIDTH => 2 * DATA_WIDTH,
    DATA_DEPTH => ERR_NEXT_DATA_DEPTH
    )
    port
    map
    (
    address => i_err_next_addr,
    clock   => i_clk,
    data    => i_err_next,
    wren    => i_wren(3),
    q       => o_err_next
    );

  bias_mem : ram_quartus_ip
    generic
    map (
    INIT_FILE_NAME => "mem_init_files/mem_bias.mif",
    DATA_WIDTH => DATA_WIDTH,
    DATA_DEPTH => BIAS_DATA_DEPTH
    )
    port
    map
    (
    address => i_bias_addr,
    clock   => i_clk,
    data    => i_bias,
    wren    => i_wren(4),
    q       => o_bias
    );
end architecture arch;