----------------------------------------------------------------------------
-- Auteur(s)        : 
--
-- Projet           : 
--
-- Date de creation : 
--
-- Description      : Module FIFO dual clock avec interface AXIS MASTER
--                    Interface custom (write) et Interface AXIS Master (read)
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
entity FIFO_DC_AXIS_M is
	generic (
		-- Users to add parameters here
        G_DWIDTH                : integer := 36;                                 -- Data bus fifo length
        G_AWIDTH                : integer := 10;                                 -- Address bus fifo length
        G_THRESHOLD_HIGH        : integer := 2**10;                              -- high threshold
        G_THRESHOLD_LOW         : integer := 0;                                  -- low threshold
        -- User parameters ends
        M_AXIS_TDATA_WIDTH      : integer := 32;                                  -- Data AXIS length
		M_AXIS_TUSER_WIDTH      : integer := 4                                    -- User AXIS length
	);
	port (
		-- Users to add ports here
		aresetn      	        : in std_logic;
		-- Custom interface (slave)
		WR_CLK                  : in  std_logic;                                -- Clock
        WR_DATA                 : in  std_logic_vector(G_DWIDTH-1 downto 0);    -- Data write bus
        WR_DATA_EN              : in  std_logic;                                -- Write command
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
		-- Ports of Axi Master Bus Interface M00_AXIS
		M_AXIS_ACLK	            : in std_logic;
		M_AXIS_TVALID	        : out std_logic;
		M_AXIS_TDATA	        : out std_logic_vector(M_AXIS_TDATA_WIDTH-1 downto 0);
		M_AXIS_TLAST	        : out std_logic;
		M_AXIS_TREADY	        : in std_logic;
		M_AXIS_TUSER            : out std_logic_vector(M_AXIS_TUSER_WIDTH-1 downto 0)
	);
end FIFO_DC_AXIS_M;

---------------------------------------------------------------------------
-- DECLARATION DE L'ARCHITECTURE
---------------------------------------------------------------------------
architecture arch_imp of FIFO_DC_AXIS_M is

   ---------------------------------------------------------------------------
   -- COMPONENT DECLARATION
   ---------------------------------------------------------------------------
	component AXIS_MASTER is
		generic (
		G_DWIDTH                : integer := 36;   
		M_AXIS_TDATA_WIDTH      : integer := 32;
		M_AXIS_TUSER_WIDTH      : integer := 4
		);
		port (
		rd_data                 : in std_logic_vector(G_DWIDTH-1 downto 0);
		rd_data_vld             : in std_logic;
		rd_data_en              : out std_logic;
		m00_axis_aclk	        : in std_logic;
		m00_axis_aresetn	    : in std_logic;
		m00_axis_tvalid	        : out std_logic;
		m00_axis_tdata	        : out std_logic_vector(M_AXIS_TDATA_WIDTH-1 downto 0);
		m00_axis_tlast	        : out std_logic;
		m00_axis_tready	        : in std_logic;
		m00_axis_tuser          : out std_logic_vector(M_AXIS_TUSER_WIDTH-1 downto 0)
		);
	end component AXIS_MASTER;
	
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
   
   -- FIFO to AXIS Master
    signal rd_data_reg          : std_logic_vector(G_DWIDTH-1 downto 0);  
    signal rd_data_vld_reg      : std_logic;
    signal rd_data_en_reg       : std_logic;


begin

    ---------------------------------------------------------------------------
    -- instanciation
    ---------------------------------------------------------------------------
    
    -- Instantiation of Axi Bus Interface M00_AXIS
    AXIS_MASTER_inst : AXIS_MASTER
        generic map (
           G_DWIDTH                => G_DWIDTH,
           M_AXIS_TDATA_WIDTH      => M_AXIS_TDATA_WIDTH,
		   M_AXIS_TUSER_WIDTH      => M_AXIS_TUSER_WIDTH
        )
        port map (
            rd_data                => rd_data_reg,
            rd_data_vld            => rd_data_vld_reg,
            rd_data_en             => rd_data_en_reg,
            m00_axis_aclk	       => M_AXIS_ACLK,
            m00_axis_aresetn	   => aresetn,
            m00_axis_tvalid	       => M_AXIS_TVALID,
            m00_axis_tdata	       => M_AXIS_TDATA,
            m00_axis_tlast	       => M_AXIS_TLAST,
            m00_axis_tready	       => M_AXIS_TREADY,
            m00_axis_tuser         => M_AXIS_TUSER        
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
            WR_CLK                => WR_CLK,                     
            WR_DATA               => WR_DATA,    
            WR_DATA_EN            => WR_DATA_EN,                    
            RD_CLK                => M_AXIS_ACLK,                             
            RD_DATA               => rd_data_reg,      
            RD_DATA_EN            => rd_data_en_reg,                      
            RD_DATA_VLD           => rd_data_vld_reg,                         
            CMD_FLUSH             => CMD_FLUSH,                          
            STATUS_BUSY_FLUSH     => STATUS_BUSY_FLUSH,                              
            STATUS_THRESHOLD_HIGH => STATUS_THRESHOLD_HIGH,                       
            STATUS_THRESHOLD_LOW  => STATUS_THRESHOLD_LOW,                  
            STATUS_FULL           => STATUS_FULL,                             
            STATUS_EMPTY          => STATUS_EMPTY,                            
            STATUS_LEVEL_WR       => STATUS_LEVEL_WR ,     
            STATUS_LEVEL_RD       => STATUS_LEVEL_RD   
        );


end arch_imp;
