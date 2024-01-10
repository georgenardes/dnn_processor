library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

library work;
use work.types_pkg.all;

entity input_router is
  generic
  (
    CFG_DATA_WIDTH    : integer := 8;
    DRAM_DATA_WIDTH   : integer := 8;
    NUM_BUFFER_BLOCKS : integer := 16
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
end entity input_router;

architecture arch of input_router is
  --
  signal w_input_batch_ctr_clear : std_logic;
  signal w_inc_input_batch_ctr   : std_logic;
  signal w_input_batch_ctr       : std_logic_vector(CFG_DATA_WIDTH - 1 downto 0);
  signal r_input_batch           : std_logic_vector(CFG_DATA_WIDTH - 1 downto 0);
  signal w_input_batch_comp      : std_logic;

  signal w_input_channel_ctr_clear : std_logic;
  signal w_inc_input_channel_ctr   : std_logic;
  signal w_input_channel_ctr       : std_logic_vector(CFG_DATA_WIDTH - 1 downto 0);
  signal r_input_channel           : std_logic_vector(CFG_DATA_WIDTH - 1 downto 0);
  signal w_input_channel_comp      : std_logic;

  signal w_buffer_col_ctr_clear : std_logic;
  signal w_inc_buffer_col_ctr   : std_logic;
  signal w_buffer_col_ctr       : std_logic_vector(CFG_DATA_WIDTH - 1 downto 0);
  signal r_buffer_col           : std_logic_vector(CFG_DATA_WIDTH - 1 downto 0);
  signal w_buffer_col_comp      : std_logic;

  signal w_buffer_row_ctr_clear : std_logic;
  signal w_inc_buffer_row_ctr   : std_logic;
  signal w_buffer_row_ctr       : std_logic_vector(CFG_DATA_WIDTH - 1 downto 0);
  signal r_buffer_row           : std_logic_vector(CFG_DATA_WIDTH - 1 downto 0);
  signal w_buffer_row_comp      : std_logic;

  signal w_buffer_wren : std_logic_vector(0 to NUM_BUFFER_BLOCKS - 1); -- WriteReadENable signal to memories (one_hot)

  component gen_comparator
    generic
    (
      WIDTH : integer
    );
    port
    (
      i_A : in std_logic_vector(WIDTH - 1 downto 0);
      i_B : in std_logic_vector(WIDTH - 1 downto 0);
      o_Q : out std_logic
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

  component one_hot_encoder
    generic
    (
      DATA_WIDTH : integer;
      OUT_WIDTH  : integer
    );
    port
    (
      i_DATA : in std_logic_vector(DATA_WIDTH - 1 downto 0);
      o_DATA : out std_logic_vector(OUT_WIDTH - 1 downto 0)
    );
  end component;

  -- Define states
  type t_STATE is (s_INIT, s0, s1, s1_0, s2, s3, s4, s5, s6, s7, s_END);
  signal r_STATE, w_NEXT : t_STATE;

begin
  ------------------------------------------------------------------------------------------------------------------------

  p_STATE : process (i_clk, i_clear)
  begin
    if i_clear = '1' then
      r_STATE <= s_INIT; -- Initial state after reset
    elsif rising_edge(i_clk) then
      r_STATE <= w_NEXT; -- Update current state at each clock edge
    end if;
  end process;

  p_NEXT : process (r_STATE, i_go)
  begin
    -- State transitions
    case r_STATE is
      when s_INIT =>
        if (i_GO = '1') then
          w_NEXT <= s0;
        else
          w_NEXT <= s_INIT;
        end if;

      when s0 =>
        if w_input_batch_comp = '1' then
          w_NEXT <= s1;
        else
          w_NEXT <= s_END;
        end if;

      when s1 =>
        if w_input_channel_comp = '1' then
          w_NEXT <= s2;
        else
          w_NEXT <= s1_0;
        end if;

      when s1_0 =>
        w_NEXT <= s0;

      when s2 =>
        w_NEXT <= s3;

      when s3 =>
        w_NEXT <= s4;

      when s4 =>
        if w_buffer_row_comp = '1' then
          w_NEXT <= s1;
        else
          w_NEXT <= s5;
        end if;

      when s5 =>
        w_NEXT <= s6;

      when s6 =>
        if w_buffer_col_comp = '1' then
          w_NEXT <= s1;
        else
          w_NEXT <= s7;
        end if;

      when s7 =>
        w_NEXT <= s_END;

      when s_END =>
        w_NEXT <= s_INIT;

      when others =>
        w_NEXT <= s_INIT;

    end case;

  end process;
  ------------------------------------------------------------------------------------------------------------------------

  w_input_channel_ctr_clear <= '1' when (r_STATE = s0) else
    '0';
  w_inc_input_channel_ctr <= '1' when (r_STATE = s3) else
    '0';
  w_inc_buffer_row_ctr <= '1' when (r_STATE = s3) else
    '0';
  w_inc_input_batch_ctr <= '1' when(r_STATE = s1_0) else
    '0';

  o_inc_dram_addr <= '1' when (r_STATE = s3) else
    '0';
  o_buffer_data <= i_dram_data;
  o_buffer_addr <= w_buffer_col_ctr;
  o_buffer_wren <= w_buffer_wren when (r_STATE = s3) else
    (others => '0');
  ------------------------------------------------------------------------------------------------------------------------

  -- conta exemplos do batch da entrada
  input_batch_ctr : up_counter
  generic
  map (
  WIDTH => CFG_DATA_WIDTH
  )
  port map
  (
    i_clk   => i_clk,
    i_clear => w_input_batch_ctr_clear,
    i_inc   => w_inc_input_batch_ctr,
    o_q     => w_input_batch_ctr
  );
  input_batch_comp : gen_comparator
  generic
  map (
  WIDTH => CFG_DATA_WIDTH
  )
  port
  map (
  i_A => w_input_batch_ctr,
  i_B => r_input_batch,
  o_Q => w_input_batch_comp
  );
  -- conta canais da entrada
  input_channel_ctr : up_counter
  generic
  map (
  WIDTH => CFG_DATA_WIDTH
  )
  port
  map
  (
  i_clk   => i_clk,
  i_clear => w_input_channel_ctr_clear,
  i_inc   => w_inc_input_channel_ctr,
  o_q     => w_input_channel_ctr
  );
  input_channel_comp : gen_comparator
  generic
  map (
  WIDTH => CFG_DATA_WIDTH
  )
  port
  map (
  i_A => w_input_channel_ctr,
  i_B => r_input_channel,
  o_Q => w_input_channel_comp
  );

  -- conta colunas do buffer
  buffer_col_ctr : up_counter
  generic
  map (
  WIDTH => CFG_DATA_WIDTH
  )
  port
  map
  (
  i_clk   => i_clk,
  i_clear => w_buffer_col_ctr_clear,
  i_inc   => w_inc_buffer_col_ctr,
  o_q     => w_buffer_col_ctr
  );
  buffer_col_comp : gen_comparator
  generic
  map (
  WIDTH => CFG_DATA_WIDTH
  )
  port
  map (
  i_A => w_buffer_col_ctr,
  i_B => r_buffer_col,
  o_Q => w_buffer_col_comp
  );

  -- conta linhas do buffer
  buffer_row_ctr : up_counter
  generic
  map (
  WIDTH => CFG_DATA_WIDTH
  )
  port
  map
  (
  i_clk   => i_clk,
  i_clear => w_buffer_row_ctr_clear,
  i_inc   => w_inc_buffer_row_ctr,
  o_q     => w_buffer_row_ctr
  );

  buffer_row_comp : gen_comparator
  generic
  map (
  WIDTH => CFG_DATA_WIDTH
  )
  port
  map (
  i_A => w_buffer_row_ctr,
  i_B => r_buffer_row,
  o_Q => w_buffer_row_comp
  );

  -- one hot for buffer wren
  one_hot_encoder_inst : one_hot_encoder
  generic
  map (
  DATA_WIDTH => CFG_DATA_WIDTH,
  OUT_WIDTH  => NUM_BUFFER_BLOCKS
  )
  port
  map (
  i_DATA => w_buffer_row_ctr,
  o_DATA => w_buffer_wren
  );
end architecture arch;