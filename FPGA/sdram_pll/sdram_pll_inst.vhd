	component sdram_pll is
		port (
			sdram_reset_reset_n    : in    std_logic                     := 'X';             -- reset_n
			sdram_s1_address       : in    std_logic_vector(21 downto 0) := (others => 'X'); -- address
			sdram_s1_byteenable_n  : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- byteenable_n
			sdram_s1_chipselect    : in    std_logic                     := 'X';             -- chipselect
			sdram_s1_writedata     : in    std_logic_vector(15 downto 0) := (others => 'X'); -- writedata
			sdram_s1_read_n        : in    std_logic                     := 'X';             -- read_n
			sdram_s1_write_n       : in    std_logic                     := 'X';             -- write_n
			sdram_s1_readdata      : out   std_logic_vector(15 downto 0);                    -- readdata
			sdram_s1_readdatavalid : out   std_logic;                                        -- readdatavalid
			sdram_s1_waitrequest   : out   std_logic;                                        -- waitrequest
			sdram_wire_addr        : out   std_logic_vector(11 downto 0);                    -- addr
			sdram_wire_ba          : out   std_logic_vector(1 downto 0);                     -- ba
			sdram_wire_cas_n       : out   std_logic;                                        -- cas_n
			sdram_wire_cke         : out   std_logic;                                        -- cke
			sdram_wire_cs_n        : out   std_logic;                                        -- cs_n
			sdram_wire_dq          : inout std_logic_vector(15 downto 0) := (others => 'X'); -- dq
			sdram_wire_dqm         : out   std_logic_vector(1 downto 0);                     -- dqm
			sdram_wire_ras_n       : out   std_logic;                                        -- ras_n
			sdram_wire_we_n        : out   std_logic;                                        -- we_n
			pll_inclk_clk          : in    std_logic                     := 'X';             -- clk
			pll_reset_reset        : in    std_logic                     := 'X';             -- reset
			pll_c1_clk             : out   std_logic;                                        -- clk
			pll_sdram_clk          : out   std_logic                                         -- clk
		);
	end component sdram_pll;

	u0 : component sdram_pll
		port map (
			sdram_reset_reset_n    => CONNECTED_TO_sdram_reset_reset_n,    -- sdram_reset.reset_n
			sdram_s1_address       => CONNECTED_TO_sdram_s1_address,       --    sdram_s1.address
			sdram_s1_byteenable_n  => CONNECTED_TO_sdram_s1_byteenable_n,  --            .byteenable_n
			sdram_s1_chipselect    => CONNECTED_TO_sdram_s1_chipselect,    --            .chipselect
			sdram_s1_writedata     => CONNECTED_TO_sdram_s1_writedata,     --            .writedata
			sdram_s1_read_n        => CONNECTED_TO_sdram_s1_read_n,        --            .read_n
			sdram_s1_write_n       => CONNECTED_TO_sdram_s1_write_n,       --            .write_n
			sdram_s1_readdata      => CONNECTED_TO_sdram_s1_readdata,      --            .readdata
			sdram_s1_readdatavalid => CONNECTED_TO_sdram_s1_readdatavalid, --            .readdatavalid
			sdram_s1_waitrequest   => CONNECTED_TO_sdram_s1_waitrequest,   --            .waitrequest
			sdram_wire_addr        => CONNECTED_TO_sdram_wire_addr,        --  sdram_wire.addr
			sdram_wire_ba          => CONNECTED_TO_sdram_wire_ba,          --            .ba
			sdram_wire_cas_n       => CONNECTED_TO_sdram_wire_cas_n,       --            .cas_n
			sdram_wire_cke         => CONNECTED_TO_sdram_wire_cke,         --            .cke
			sdram_wire_cs_n        => CONNECTED_TO_sdram_wire_cs_n,        --            .cs_n
			sdram_wire_dq          => CONNECTED_TO_sdram_wire_dq,          --            .dq
			sdram_wire_dqm         => CONNECTED_TO_sdram_wire_dqm,         --            .dqm
			sdram_wire_ras_n       => CONNECTED_TO_sdram_wire_ras_n,       --            .ras_n
			sdram_wire_we_n        => CONNECTED_TO_sdram_wire_we_n,        --            .we_n
			pll_inclk_clk          => CONNECTED_TO_pll_inclk_clk,          --   pll_inclk.clk
			pll_reset_reset        => CONNECTED_TO_pll_reset_reset,        --   pll_reset.reset
			pll_c1_clk             => CONNECTED_TO_pll_c1_clk,             --      pll_c1.clk
			pll_sdram_clk          => CONNECTED_TO_pll_sdram_clk           --   pll_sdram.clk
		);

