library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.types_pkg.all;

entity backprop_accelerator_top is
  generic
  (
    DATA_WIDTH        : integer := 8; -- Specify the width of the register
    PARALELISM_FACTOR : integer := 16;
    BUFFER_DEPTH      : integer := 8;
    DRAM_WIDTH        : integer := 16;
    DRAM_DEPTH        : integer := 12
  );
  port
  (
    i_clk                 : in std_logic; -- Clock input
    i_rst                 : in std_logic; -- Reset signal
    i_clear               : in std_logic; -- Clear signal
    i_go                  : in std_logic; -- Increment counter
    i_inc_channel_row_ctr : in std_logic;
    i_inc_channel_col_ctr : in std_logic;
    i_batch               : in std_logic_vector(BUFFER_DEPTH - 1 downto 0);
    i_heigth              : in std_logic_vector(BUFFER_DEPTH - 1 downto 0);
    i_width               : in std_logic_vector(BUFFER_DEPTH - 1 downto 0);
    i_nun_channels        : in std_logic_vector(BUFFER_DEPTH - 1 downto 0);
    o_data                : out std_logic_vector(31 downto 0);
    o_ready               : out std_logic
  );
end entity backprop_accelerator_top;

architecture arch of backprop_accelerator_top is
  signal w_i_acc_clear : std_logic;
  signal w_i_acc_load  : std_logic;

  signal w_i_dram_wren   : std_logic                                 := '0';
  signal w_i_dram_data   : std_logic_vector(DRAM_WIDTH - 1 downto 0) := (others => '0');
  signal w_i_dram_addr   : std_logic_vector(DRAM_DEPTH - 1 downto 0);
  signal w_o_dram_data   : std_logic_vector(DRAM_WIDTH - 1 downto 0);
  signal w_dram_addr_inc : std_logic;

  signal w_input_router_write_out : std_logic;

  signal w_i_buffer_0_wren, w_i_buffer_1_wren   : std_logic_vector(0 to PARALELISM_FACTOR - 1);
  signal w_i_buffer_0_addr, w_i_buffer_1_addr   : std_logic_vector(BUFFER_DEPTH - 1 downto 0);
  signal w_i_buffer_0_addrs, w_i_buffer_1_addrs : t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(BUFFER_DEPTH - 1 downto 0);
  signal w_i_buffer_0_data, w_i_buffer_1_data   : std_logic_vector(DATA_WIDTH - 1 downto 0);
  signal w_i_buffer_0_datas, w_i_buffer_1_datas : t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(DATA_WIDTH - 1 downto 0);
  signal w_o_buffer_0_data, w_o_buffer_1_data   : t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(DATA_WIDTH - 1 downto 0);

  component dram
    generic
    (
      DATA_WIDTH   : integer;
      BUFFER_DEPTH : integer
    );
    port
    (
      i_clk   : in std_logic;
      i_clear : in std_logic;
      i_wren  : in std_logic;
      i_data  : in std_logic_vector(DATA_WIDTH - 1 downto 0);
      i_addr  : in std_logic_vector(BUFFER_DEPTH - 1 downto 0);
      o_data  : out std_logic_vector(DATA_WIDTH - 1 downto 0)
    );
  end component;

  component up_counter
    generic
    (
      WIDTH : integer
    );
    port
    (
      i_clk   : in std_logic;
      i_clear : in std_logic;
      i_inc   : in std_logic;
      o_q     : out std_logic_vector(WIDTH - 1 downto 0)
    );
  end component;

  component input_router
    generic
    (
      CFG_DATA_WIDTH    : integer;
      DRAM_DATA_WIDTH   : integer;
      NUM_BUFFER_BLOCKS : integer
    );
    port
    (
      i_clk           : in std_logic; -- Clock input
      i_clear         : in std_logic; -- Clear signal
      i_go            : in std_logic;
      i_dram_data     : in std_logic_vector(DRAM_DATA_WIDTH - 1 downto 0);
      o_inc_dram_addr : out std_logic;
      o_buffer_data   : out std_logic_vector(DRAM_DATA_WIDTH - 1 downto 0);
      o_buffer_wren   : out std_logic_vector(0 to NUM_BUFFER_BLOCKS - 1); -- WriteReadENable signal to memories (one_hot)
      o_buffer_addr   : out std_logic_vector(CFG_DATA_WIDTH - 1 downto 0); -- block addr
      o_ready         : out std_logic

    );
  end component;

  component input_buffer
    generic
    (
      DATA_WIDTH   : integer;
      BUFFER_DEPTH : integer;
      NUM_BLOCKS   : integer
    );
    port
    (
      i_clk   : in std_logic;
      i_clear : in std_logic;
      i_wren  : in std_logic_vector(0 to NUM_BLOCKS - 1);
      i_data  : in t_ARRAY_OF_LOGIC_VECTOR(0 to NUM_BLOCKS - 1)(DATA_WIDTH - 1 downto 0);
      i_addrs : in t_ARRAY_OF_LOGIC_VECTOR(0 to NUM_BLOCKS - 1)(BUFFER_DEPTH - 1 downto 0);
      o_data  : out t_ARRAY_OF_LOGIC_VECTOR(0 to NUM_BLOCKS - 1)(DATA_WIDTH - 1 downto 0)
    );
  end component;
  component datapath
    generic
    (
      DATA_WIDTH        : integer;
      PARALELISM_FACTOR : integer
    );
    port
    (
      i_clk       : in std_logic;
      i_clear     : in std_logic;
      i_acc_clear : in std_logic;
      i_acc_load  : in std_logic;
      i_data_0    : in t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(DATA_WIDTH - 1 downto 0);
      i_data_1    : in t_ARRAY_OF_LOGIC_VECTOR(0 to PARALELISM_FACTOR - 1)(DATA_WIDTH - 1 downto 0);
      o_data      : out std_logic_vector(31 downto 0)
    );
  end component;

  component controler
    port
    (
      i_clk                    : in std_logic;
      i_rst                    : in std_logic;
      i_go                     : in std_logic;
      o_dram_addr_inc          : out std_logic;
      o_input_router_write_out : out std_logic;
      o_ready                  : out std_logic
    );
  end component;

begin

  dram_inst : dram
  generic
  map (
  DATA_WIDTH   => DRAM_WIDTH,
  BUFFER_DEPTH => DRAM_DEPTH
  )
  port map
  (
    i_clk   => i_clk,
    i_clear => i_clear,
    i_wren  => w_i_dram_wren,
    i_data  => w_i_dram_data,
    i_addr  => w_i_dram_addr,
    o_data  => w_o_dram_data
  );

  ram_indexer : up_counter
  generic
  map (
  WIDTH => DRAM_DEPTH
  )
  port
  map (
  i_clk   => i_clk,
  i_clear => i_clear,
  i_inc   => w_dram_addr_inc,
  o_q     => w_i_dram_addr
  );

  input_router_inst : input_router
  generic
  map (
  CFG_DATA_WIDTH    => BUFFER_DEPTH,
  DRAM_DATA_WIDTH   => DRAM_WIDTH,
  NUM_BUFFER_BLOCKS => PARALELISM_FACTOR
  )
  port
  map (
  i_clk                                  => i_clk,
  i_clear                                => i_clear,
  i_go                                   => i_go,
  i_dram_data                            => w_o_dram_data,
  o_buffer_wren                          => w_i_buffer_0_wren,
  o_buffer_addr                          => w_i_buffer_0_addr,
  o_buffer_data(DATA_WIDTH - 1 downto 0) => w_i_buffer_0_data
  );

  irouter_gen : for i in 0 to PARALELISM_FACTOR - 1 generate
    w_i_buffer_0_addrs(i) <= w_i_buffer_0_addr;
    w_i_buffer_0_datas(i) <= w_i_buffer_0_data;
  end generate;

  input_buffer_0 : input_buffer
  generic
  map (
  DATA_WIDTH   => DATA_WIDTH,
  BUFFER_DEPTH => BUFFER_DEPTH,
  NUM_BLOCKS   => PARALELISM_FACTOR
  )
  port
  map
  (
  i_clk   => i_clk,
  i_clear => i_clear,
  i_wren  => w_i_buffer_0_wren,
  i_data  => w_i_buffer_0_datas,
  i_addrs => w_i_buffer_0_addrs,
  o_data  => w_o_buffer_0_data
  );

  input_buffer_1 : input_buffer
  generic
  map (
  DATA_WIDTH   => DATA_WIDTH,
  BUFFER_DEPTH => BUFFER_DEPTH,
  NUM_BLOCKS   => PARALELISM_FACTOR
  )
  port
  map (
  i_clk   => i_clk,
  i_clear => i_clear,
  i_wren  => w_i_buffer_1_wren,
  i_data  => w_i_buffer_1_datas,
  i_addrs => w_i_buffer_1_addrs,
  o_data  => w_o_buffer_1_data
  );

  datapath_inst : datapath
  generic
  map (
  DATA_WIDTH        => DATA_WIDTH,
  PARALELISM_FACTOR => PARALELISM_FACTOR
  )
  port
  map (
  i_clk       => i_clk,
  i_clear     => i_clear,
  i_acc_clear => w_i_acc_clear,
  i_acc_load  => w_i_acc_load,
  i_data_0    => w_o_buffer_0_data,
  i_data_1    => w_o_buffer_1_data,
  o_data      => o_data
  );

  controler_inst : controler
  port
  map (
  i_clk                    => i_clk,
  i_rst                    => i_rst,
  i_go                     => i_go,
  o_dram_addr_inc          => w_dram_addr_inc,
  o_input_router_write_out => w_input_router_write_out,
  o_ready                  => o_ready
  );

end architecture arch;