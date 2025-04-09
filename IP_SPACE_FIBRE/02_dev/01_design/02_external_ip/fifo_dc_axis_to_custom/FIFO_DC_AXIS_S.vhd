----------------------------------------------------------------------------
-- Auteur(s)        :
--
-- Projet           :
--
-- Date de creation :
--
-- Description      : Module FIFO dual clock avec interface AXIS slave
--                    Interface AXIS slave (write) et Interface custom (read)
----------------------------------------------------------------------------

---------------------------------------------------------------------------
-- DECLARATION DES LIBRAIRIES
---------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

---------------------------------------------------------------------------
-- DECLARATION DE L'ENTITE
---------------------------------------------------------------------------
entity FIFO_DC_AXIS_S is
	generic (
		-- Users to add parameters here
        G_DWIDTH                : integer := 36;                                 -- Data bus fifo length
        G_AWIDTH                : integer := 10;                                 -- Address bus fifo length
        G_THRESHOLD_HIGH        : integer := 2**10;                              -- high threshold
        G_THRESHOLD_LOW         : integer := 0;                                  -- low threshold
        -- User parameters ends
        S_AXIS_TDATA_WIDTH	    : integer := 32;                                 -- Data AXIS length
		S_AXIS_TUSER_WIDTH	    : integer := 4                                   -- User AXIS length
	);
	port (
		-- Users to add ports here
		aresetn      	        : in std_logic;
		-- Custom interface master (rd)
		RD_CLK                  : in  std_logic;                                -- Clock
        RD_DATA                 : out std_logic_vector(G_DWIDTH-1 downto 0);    -- Data read bus
        RD_DATA_EN              : in  std_logic;                                -- Read command
        RD_DATA_VLD             : out std_logic;                                -- Data valid
		-- STATUS FIFO
        CMD_FLUSH               : in  std_logic;                                -- fifo flush
        STATUS_BUSY_FLUSH       : out std_logic;                                -- fifo is flushing
        STATUS_THRESHOLD_HIGH   : out std_logic;                                -- threshold high reached flag (sur WR_CLK)
        STATUS_THRESHOLD_LOW    : out std_logic;                                -- threshold low reached flag (sur RD_CLK)
        STATUS_FULL             : out std_logic;                                -- full fifo flag (sur WR_CLK)
        STATUS_EMPTY            : out std_logic;                                -- empty fifo flag (sur RD_CLK)
        STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);    -- Niveau de remplissage de la FIFO (sur WR_CLK)
        STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0) ;   -- Niveau de remplissage de la FIFO (sur RD_CLK)
        -- User ports ends
		-- Do not modify the ports beyond this line
		-- Ports of Axi SLAVE Bus Interface S00_AXIS
		S_AXIS_ACLK	            : in std_logic;
		S_AXIS_TREADY        	: out std_logic;
		S_AXIS_TDATA         	: in std_logic_vector(S_AXIS_TDATA_WIDTH-1 downto 0);
		S_AXIS_TUSER         	: in std_logic_vector(S_AXIS_TUSER_WIDTH-1 downto 0);
		S_AXIS_TLAST         	: in std_logic;
		S_AXIS_TVALID        	: in std_logic
	);
end FIFO_DC_AXIS_S;

---------------------------------------------------------------------------
-- DECLARATION DE L'ARCHITECTURE
---------------------------------------------------------------------------
architecture arch_imp of FIFO_DC_AXIS_S is

   ---------------------------------------------------------------------------
   -- COMPONENT DECLARATION
   ---------------------------------------------------------------------------
	component AXIS_SLAVE is
		generic (
		G_DWIDTH                : integer   := 36;
		S_AXIS_TDATA_WIDTH	    : integer	:= 32;
		S_AXIS_TUSER_WIDTH	    : integer	:= 4
		);
		port (
        wr_data                 : out std_logic_vector(G_DWIDTH-1 downto 0);
        wr_enable               : out std_logic;
        status_full             : in std_logic;
        status_busy_flush       : in std_logic;
		s00_axis_aclk           : in std_logic;
		s00_axis_aresetn	    : in std_logic;
		s00_axis_tready	        : out std_logic;
		s00_axis_tdata	        : in std_logic_vector(S_AXIS_TDATA_WIDTH-1 downto 0);
		s00_axis_tuser	        : in std_logic_vector(S_AXIS_TUSER_WIDTH-1 downto 0);
		s00_axis_tlast	        : in std_logic;
		s00_axis_tvalid	        : in std_logic
		);
	end component AXIS_SLAVE;

	component FIFO_DC is
        generic (
        G_DWIDTH                : integer := 36;                                 -- Data bus fifo length
        G_AWIDTH                : integer := 10;                                 -- Address bus fifo length
        G_THRESHOLD_HIGH        : integer := 2**10;                              -- high threshold
        G_THRESHOLD_LOW         : integer := 0                                   -- low threshold
        );
        port (
        RST_N                   : in  std_logic;

        -- Writing port
        WR_CLK                  : in  std_logic;                                -- Clock
        WR_DATA                 : in  std_logic_vector(G_DWIDTH-1 downto 0);    -- Data write bus
        WR_DATA_EN              : in  std_logic;                                -- Write command

        -- Reading port
        RD_CLK                  : in  std_logic;                                -- Clock
        RD_DATA                 : out std_logic_vector(G_DWIDTH-1 downto 0);    -- Data read bus
        RD_DATA_EN              : in  std_logic;                                -- Read command
        RD_DATA_VLD             : out std_logic;                                -- Data valid

        -- Command port
        CMD_FLUSH               : in  std_logic;                                -- fifo flush
        STATUS_BUSY_FLUSH       : out std_logic;                                -- fifo is flushing

        -- Status port
        STATUS_THRESHOLD_HIGH   : out std_logic;                                -- threshold high reached flag (sur WR_CLK)
        STATUS_THRESHOLD_LOW    : out std_logic;                                -- threshold low reached flag (sur RD_CLK)
        STATUS_FULL             : out std_logic;                                -- full fifo flag (sur WR_CLK)
        STATUS_EMPTY            : out std_logic;                                -- empty fifo flag (sur RD_CLK)
        STATUS_LEVEL_WR         : out std_logic_vector(G_AWIDTH-1 downto 0);    -- Niveau de remplissage de la FIFO (sur WR_CLK)
        STATUS_LEVEL_RD         : out std_logic_vector(G_AWIDTH-1 downto 0)     -- Niveau de remplissage de la FIFO (sur RD_CLK)
        );
    end component FIFO_DC;

   ---------------------------------------------------------------------------
   -- DECLARATION DES SIGNAUX
   ---------------------------------------------------------------------------

    -- AXIS Slave to FIFO
    signal wr_data_reg           :  std_logic_vector(G_DWIDTH-1 downto 0);
    signal wr_enable_reg         :  std_logic;
    signal status_full_reg       :  std_logic;
    signal status_busy_flush_reg :  std_logic;


begin

    ---------------------------------------------------------------------------
    -- assign status
    ---------------------------------------------------------------------------
    STATUS_FULL       <= status_full_reg;
    STATUS_BUSY_FLUSH <= status_busy_flush_reg;
    ---------------------------------------------------------------------------
    -- instanciation
    ---------------------------------------------------------------------------

    -- Instantiation of Axi Bus Interface S00_AXIS
    AXIS_SLAVE_inst : AXIS_SLAVE
        generic map (
           G_DWIDTH             => G_DWIDTH,
           S_AXIS_TDATA_WIDTH   => S_AXIS_TDATA_WIDTH,
             S_AXIS_TUSER_WIDTH => S_AXIS_TUSER_WIDTH
        )
        port map (
            wr_data             => wr_data_reg,
            wr_enable           => wr_enable_reg,
            status_full         => status_full_reg,
            status_busy_flush   => status_busy_flush_reg,
            s00_axis_aclk       => S_AXIS_ACLK,
            s00_axis_aresetn	=> aresetn,
            s00_axis_tready 	=> S_AXIS_TREADY,
            s00_axis_tdata 	    => S_AXIS_TDATA,
            s00_axis_tuser	    => S_AXIS_TUSER,
            s00_axis_tlast	    => S_AXIS_TLAST ,
            s00_axis_tvalid 	=> S_AXIS_TVALID
        );

	-- Instantiation of FIFO dual-clock
    fifo_dc_inst : FIFO_DC
        generic map (
            G_DWIDTH              => G_DWIDTH,
            G_AWIDTH              => G_AWIDTH,
            G_THRESHOLD_HIGH      => G_THRESHOLD_HIGH,
            G_THRESHOLD_LOW       => G_THRESHOLD_LOW
        )
        port map (
            RST_N                 => aresetn,
            WR_CLK                => S_AXIS_ACLK,
            WR_DATA               => wr_data_reg,
            WR_DATA_EN            => wr_enable_reg,
            RD_CLK                => RD_CLK,
            RD_DATA               => RD_DATA,
            RD_DATA_EN            => RD_DATA_EN,
            RD_DATA_VLD           => RD_DATA_VLD,
            CMD_FLUSH             => CMD_FLUSH,
            STATUS_BUSY_FLUSH     => status_busy_flush_reg,
            STATUS_THRESHOLD_HIGH => STATUS_THRESHOLD_HIGH,
            STATUS_THRESHOLD_LOW  => STATUS_THRESHOLD_LOW,
            STATUS_FULL           => status_full_reg,
            STATUS_EMPTY          => STATUS_EMPTY,
            STATUS_LEVEL_WR       => STATUS_LEVEL_WR ,
            STATUS_LEVEL_RD       => STATUS_LEVEL_RD
        );


end arch_imp;
