LIBRARY ieee ;
USE ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity test is
end entity;

architecture tb of test is
      
component FIFO_SC is
   generic (
      G_DWIDTH       : integer := 8;                                                  -- Largeur du bus de donnee
      G_DEPTH        : integer := 256;                                                -- Profondeur memoire de la FIFO
      G_DEPTH_SIZE   : integer := 8;
      G_FWFT         : integer range 0 to 1 := 0                                      -- Donnee directement presente en sortie FIRST_WORD_FALL_THROUGH
   );
   port (
      CLK            : in    std_logic;                                               -- Horloge systeme
      RESET_N        : in    std_logic;                                               -- Reset asyncrhone actif niveau bas

      WR             : in    std_logic;                                               -- Commande d'ecriture FIFO
      DATA_IN        : in    std_logic_vector(G_DWIDTH-1 downto 0);                   -- Donnee d'entree

      RD             : in    std_logic;                                               -- Commande de lecture FIFO
      DATA_OUT       : out   std_logic_vector(G_DWIDTH-1 downto 0);                   -- Donnee de sortie

      THRESHOLD_HIGH : in    std_logic_vector(G_DEPTH_SIZE-1 downto 0);               -- Seuil programme niveau haut de la FIFO
      THRESHOLD_LOW  : in    std_logic_vector(G_DEPTH_SIZE-1 downto 0);               -- Seuil programme niveau bas de la FIFO

      ALMOST_FULL    : out   std_logic;                                               -- Niveau de haut du seuil programme de la FIFO atteint
      ALMOST_EMPTY   : out   std_logic;                                               -- Niveau de bas du seuil programme de la FIFO atteint
      LEVEL          : out   std_logic_vector(G_DEPTH_SIZE-1 downto 0);               -- Niveau de remplissage de la FIFO

      FULL           : out   std_logic;                                               -- FIFO pleine
      EMPTY          : out   std_logic                                                -- FIFO vide
   );
end component;


----------------------------- Stimulus signals
constant periode                       : time := 6.667 ns;
constant C_AWIDTH                       : integer := 10;
constant C_DWIDTH                       : integer := 36;

signal RST_N                           : std_logic := '0';
signal CLK                             : std_logic := '0';

signal out_bufg_gt_clk                 : std_logic := '0';

signal RST                             : std_logic := '0';
signal FIFO_READ_0_empty               : std_logic := '0';
signal FIFO_READ_0_rd_data             : std_logic_vector(35 downto 00) := (others => '0');
signal FIFO_READ_0_rd_en               : std_logic := '0';
signal FIFO_WRITE_0_full               : std_logic := '0';
signal FIFO_WRITE_0_wr_data            : std_logic_vector(35 downto 00) := (others => '0');
signal FIFO_WRITE_0_wr_en              : std_logic := '0';

begin


RST   <= not RST_N;

DUT_FIFO_SC : FIFO_SC
   generic map(
      G_DWIDTH       => C_DWIDTH,
      G_DEPTH        => 1024,
      G_DEPTH_SIZE   => C_AWIDTH,
      G_FWFT         => 0
   )
   port map(
      CLK            => CLK,
      RESET_N        => RST_N,
      WR             => FIFO_WRITE_0_wr_en,
      DATA_IN        => FIFO_WRITE_0_wr_data,
      RD             => FIFO_READ_0_rd_en,
      DATA_OUT       => FIFO_READ_0_rd_data,
      THRESHOLD_HIGH => (others => '1'),
      THRESHOLD_LOW  => (others => '0'),
      ALMOST_FULL    => open,
      ALMOST_EMPTY   => open,
      LEVEL          => open,
      FULL           => FIFO_WRITE_0_full,
      EMPTY          => FIFO_READ_0_empty
   );

-- generate clock 150 MHz
horloge : process
begin
   CLK   <= not CLK;
   wait for periode/2;
end process;
----------------------------------------------------------------------------
-- Scenario
----------------------------------------------------------------------------
scenario : process
begin

   RST_N <= '0';
   wait for 10 us;
   wait until rising_edge(CLK);
   RST_N <= '1';
   wait for 20 us;
   

   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   --FIFO_READ_0_rd_en <= '0';
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"1" & x"23456789";
   FIFO_WRITE_0_wr_en   <= '1';
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_data <= x"A" & x"BCDEF123";
   wait until rising_edge(CLK);
   FIFO_WRITE_0_wr_en   <= '0';
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   FIFO_READ_0_rd_en <= '1';

   wait until rising_edge(CLK);
   wait until rising_edge(CLK);
   wait until rising_edge(CLK);





   
   
   
   wait;   
end process;

end tb;
