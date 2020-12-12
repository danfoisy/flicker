	component FrameBuf is
		port (
			mem_s1_address    : in  std_logic_vector(12 downto 0) := (others => 'X'); -- address
			mem_s1_clken      : in  std_logic                     := 'X';             -- clken
			mem_s1_chipselect : in  std_logic                     := 'X';             -- chipselect
			mem_s1_write      : in  std_logic                     := 'X';             -- write
			mem_s1_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			mem_s1_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			mem_s1_byteenable : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			mem_s2_address    : in  std_logic_vector(12 downto 0) := (others => 'X'); -- address
			mem_s2_chipselect : in  std_logic                     := 'X';             -- chipselect
			mem_s2_clken      : in  std_logic                     := 'X';             -- clken
			mem_s2_write      : in  std_logic                     := 'X';             -- write
			mem_s2_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			mem_s2_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			mem_s2_byteenable : in  std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable
			mem_clk_clk       : in  std_logic                     := 'X';             -- clk
			mem_rst_reset     : in  std_logic                     := 'X'              -- reset
		);
	end component FrameBuf;

	u0 : component FrameBuf
		port map (
			mem_s1_address    => CONNECTED_TO_mem_s1_address,    --  mem_s1.address
			mem_s1_clken      => CONNECTED_TO_mem_s1_clken,      --        .clken
			mem_s1_chipselect => CONNECTED_TO_mem_s1_chipselect, --        .chipselect
			mem_s1_write      => CONNECTED_TO_mem_s1_write,      --        .write
			mem_s1_readdata   => CONNECTED_TO_mem_s1_readdata,   --        .readdata
			mem_s1_writedata  => CONNECTED_TO_mem_s1_writedata,  --        .writedata
			mem_s1_byteenable => CONNECTED_TO_mem_s1_byteenable, --        .byteenable
			mem_s2_address    => CONNECTED_TO_mem_s2_address,    --  mem_s2.address
			mem_s2_chipselect => CONNECTED_TO_mem_s2_chipselect, --        .chipselect
			mem_s2_clken      => CONNECTED_TO_mem_s2_clken,      --        .clken
			mem_s2_write      => CONNECTED_TO_mem_s2_write,      --        .write
			mem_s2_readdata   => CONNECTED_TO_mem_s2_readdata,   --        .readdata
			mem_s2_writedata  => CONNECTED_TO_mem_s2_writedata,  --        .writedata
			mem_s2_byteenable => CONNECTED_TO_mem_s2_byteenable, --        .byteenable
			mem_clk_clk       => CONNECTED_TO_mem_clk_clk,       -- mem_clk.clk
			mem_rst_reset     => CONNECTED_TO_mem_rst_reset      -- mem_rst.reset
		);

