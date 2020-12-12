	component FrameBuf_single is
		port (
			clk_clk       : in  std_logic                     := 'X';             -- clk
			reset_reset   : in  std_logic                     := 'X';             -- reset
			s1_address    : in  std_logic_vector(11 downto 0) := (others => 'X'); -- address
			s1_clken      : in  std_logic                     := 'X';             -- clken
			s1_chipselect : in  std_logic                     := 'X';             -- chipselect
			s1_write      : in  std_logic                     := 'X';             -- write
			s1_readdata   : out std_logic_vector(15 downto 0);                    -- readdata
			s1_writedata  : in  std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			s1_byteenable : in  std_logic_vector(1 downto 0)  := (others => 'X')  -- byteenable
		);
	end component FrameBuf_single;

	u0 : component FrameBuf_single
		port map (
			clk_clk       => CONNECTED_TO_clk_clk,       --   clk.clk
			reset_reset   => CONNECTED_TO_reset_reset,   -- reset.reset
			s1_address    => CONNECTED_TO_s1_address,    --    s1.address
			s1_clken      => CONNECTED_TO_s1_clken,      --      .clken
			s1_chipselect => CONNECTED_TO_s1_chipselect, --      .chipselect
			s1_write      => CONNECTED_TO_s1_write,      --      .write
			s1_readdata   => CONNECTED_TO_s1_readdata,   --      .readdata
			s1_writedata  => CONNECTED_TO_s1_writedata,  --      .writedata
			s1_byteenable => CONNECTED_TO_s1_byteenable  --      .byteenable
		);

