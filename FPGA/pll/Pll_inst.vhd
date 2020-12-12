	component Pll is
		port (
			clk_in_clk    : in  std_logic := 'X'; -- clk
			clk_rst_reset : in  std_logic := 'X'; -- reset
			gsclk_clk     : out std_logic;        -- clk
			sclk_x2_clk   : out std_logic;        -- clk
			sdram_clk_clk : out std_logic         -- clk
		);
	end component Pll;

	u0 : component Pll
		port map (
			clk_in_clk    => CONNECTED_TO_clk_in_clk,    --    clk_in.clk
			clk_rst_reset => CONNECTED_TO_clk_rst_reset, --   clk_rst.reset
			gsclk_clk     => CONNECTED_TO_gsclk_clk,     --     gsclk.clk
			sclk_x2_clk   => CONNECTED_TO_sclk_x2_clk,   --   sclk_x2.clk
			sdram_clk_clk => CONNECTED_TO_sdram_clk_clk  -- sdram_clk.clk
		);

