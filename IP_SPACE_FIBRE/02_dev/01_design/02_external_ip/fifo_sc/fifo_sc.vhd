---------------------------------------------------------------------------------
--                                                                             --
-- Auteur           : Florian TUTZO                                            --
--                                                                             --
-- Projet           :                                                          --
--                                                                             --
-- Date de creation :  22/03/15                                                --
--                                                                             --
-- Description      : FIFO Simple clock, simple port                           --
--                                                                             --
-- Dependance       :                                                          --
--                                                                             --
-- ------------------------------------------------------------------------------
-- -- Copyright (c) 2014                                                       --
-- -- Tous les droits sont reserves. Toute reproduction totale ou partielle est--
-- -- interdite sans le consentement ecrit du proprietaire des droits d'auteur.--
-- ------------------------------------------------------------------------------

---------------------------------------------------------------------------
-- DECLARATION DES LIBRAIRIES
---------------------------------------------------------------------------
library ieee;
   use ieee.std_logic_1164.all;
   use ieee.numeric_std.all;

library work;
   use work.pkg_tools.all;

---------------------------------------------------------------------------
-- DECLARATION DE L'ENTITE
---------------------------------------------------------------------------
entity FIFO_SC is
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
end entity FIFO_SC;

---------------------------------------------------------------------------
-- DECLARATION DE L'ARCHITECTURE
---------------------------------------------------------------------------
architecture ARCH_FIFO_SC of FIFO_SC is

---------------------------------------------------------------------------
-- DECLARATION DES COMPOSANTS
---------------------------------------------------------------------------
   constant CST_AWIDTH : integer := G_DEPTH_SIZE-1;

---------------------------------------------------------------------------
-- DECLARATION DES CONSTANTES
---------------------------------------------------------------------------

---------------------------------------------------------------------------
-- DECLARATION DES SIGNAUX
---------------------------------------------------------------------------
   type ramType is array(0 to G_DEPTH-1) of std_logic_vector(G_DWIDTH-1 downto 0);

   signal ram                : ramType;                                 -- RAM

   signal cmd_rd             : std_logic;                               -- Commande de lecture

   signal ptr_wr             : unsigned(CST_AWIDTH-1 downto 0);         -- Pointeur d'ecriture
   signal ptr_wr_inc         : unsigned(CST_AWIDTH-1 downto 0);         -- Pointeur d'ecriture + 1
   signal ptr_rd             : unsigned(CST_AWIDTH-1 downto 0);         -- Pointeur de lecture
   signal ptr_rd_inc         : unsigned(CST_AWIDTH-1 downto 0);         -- Pointeur de lecture + 1

   signal level_r            : unsigned(CST_AWIDTH downto 0);           -- Niveau de remplissage de la FIFO

   signal full_r             : std_logic;                               -- Flag FIFO pleine
   signal empty_r            : std_logic;                               -- Flag FIFO vide

   signal threshold_high_dec : unsigned(CST_AWIDTH downto 0);           -- THRESHOLD_HIGH - 1
   signal threshold_low_inc  : unsigned(CST_AWIDTH downto 0);           -- THRESHOLD_LOW + 1

   ---- Buffer signals for the G_FWFT mode
   signal buff_empty         : std_logic;                               -- buffer vide

---------------------------------------------------------------------------
-- DEBUT DU CODE
---------------------------------------------------------------------------
begin

---------------------------------------------------------------------------
-- GESTION DE LA RAM
---------------------------------------------------------------------------

   ------------------------------------------------------------------------
   -- PROCESS : P_WR_DATA
   -- Description : gestion de l'ecriture de la donnee dans la RAM
   ------------------------------------------------------------------------
   P_WR_DATA : process(CLK)
   begin
      if rising_edge(CLK) then
         if WR = '1' and full_r = '0' then
            ram(to_integer(ptr_wr)) <= DATA_IN;
         end if;
      end if;
   end process P_WR_DATA;

   ------------------------------------------------------------------------
   -- PROCESS : P_RD_DATA
   -- Description : gestion de l'ecriture de la donnee dans la RAM
   ------------------------------------------------------------------------
   P_RD_DATA : process(CLK, RESET_N)
   begin
      if RESET_N = '0' then
         DATA_OUT <= (others => '0');
      elsif rising_edge(CLK) then
         if cmd_rd = '1' then
            DATA_OUT <= ram(to_integer(ptr_rd));
         end if;
      end if;
   end process P_RD_DATA;

---------------------------------------------------------------------------
-- GESTION DES POINTEURS
---------------------------------------------------------------------------
   ------------------------------------------------------------------------
   -- COMBINATOIRE
   -- Description : commande de lecture de la RAM
   ------------------------------------------------------------------------
   cmd_rd <= RD or buff_empty when G_FWFT = 1 else RD;

   ------------------------------------------------------------------------
   -- PROCESS : P_PTR_WR
   -- Description : gestion du pointeur ecriture FIFO
   ------------------------------------------------------------------------
   P_PTR_WR : process(CLK, RESET_N)
   begin
      if RESET_N = '0' then
         ptr_wr <= (others => '0');
      elsif rising_edge(CLK) then
         if WR = '1' and full_r = '0' then
            ptr_wr <= ptr_wr_inc;
         end if;
      end if;
   end process P_PTR_WR;

   ------------------------------------------------------------------------
   -- PROCESS : P_PTR_RD
   -- Description : gestion du pointeur de lecture FIFO
   ------------------------------------------------------------------------
   P_PTR_RD : process(CLK, RESET_N)
   begin
      if RESET_N = '0' then
         ptr_rd <= (others => '0');
      elsif rising_edge(CLK) then
         if cmd_rd = '1' and empty_r = '0' then
            ptr_rd <= ptr_rd_inc;
         end if;
      end if;
   end process P_PTR_RD;

   ------------------------------------------------------------------------
   -- COMBINATOIRE
   -- Description : offset pointeur de d'adresse RAM
   ------------------------------------------------------------------------
   ptr_rd_inc  <= ptr_rd + 1;
   ptr_wr_inc  <= ptr_wr + 1;

   LEVEL <= std_logic_vector(level_r);

---------------------------------------------------------------------------
-- GESTION DES STATUTS
---------------------------------------------------------------------------

   ------------------------------------------------------------------------
   -- COMBINATOIRE
   -- Description : gestion du niveau de remplissage de la FIFO
   ------------------------------------------------------------------------

   threshold_low_inc  <= resize(unsigned(THRESHOLD_LOW) + 1, threshold_low_inc'length);
   threshold_high_dec <= resize(unsigned(THRESHOLD_HIGH) - 1, threshold_low_inc'length);
   
   FULL  <= full_r;

   GEN_NOT_FWFT : if G_FWFT = 0 generate
      EMPTY     <= empty_r;
   end generate GEN_NOT_FWFT;

   GEN_FWFT : if G_FWFT = 1 generate
      EMPTY     <= buff_empty; 
   end generate GEN_FWFT;

   ------------------------------------------------------------------------
   -- PROCESS : P_EMPTY
   -- Description : gestion du flag fifo vide
   --               - FIFO devient vide lorsqu'il reste une donnee et qu'une
   --                 commande lecture est active
   --               - FIFO devient plus vide lorsque qu'un donnee est ecrite
   --                 dans la FIFO
   --               - Si lecture et ecriture en meme temps le statut ne
   --                 change pas
   ------------------------------------------------------------------------
   P_EMPTY : process(CLK, RESET_N)
   begin
      if RESET_N = '0' then
         empty_r <= '1';                                       -- Vide a l'etat initial
      elsif rising_edge(CLK) then
         if ptr_rd_inc = ptr_wr and cmd_rd = '1' and WR = '0' then -- Lecture seulement et une seule donnee dans la FIFO
            empty_r <= '1';
         elsif WR = '1' then
            empty_r <= '0';
         end if;
      end if;
   end process P_EMPTY;

   ------------------------------------------------------------------------
   -- PROCESS : P_FULL
   -- Description : gestion du flag fifo pleine
   --               - FIFO devient pleine lorsqu'il reste qu'une adresse de
   --                 libre dans la FIFO et et qu'une commande ecriture est acive
   --               - FIFO devient plus pleine lorsque qu'un donnee est lue
   --                 dans la FIFO
   --               - Si lecture et ecriture en meme temps le statut ne
   --                 change pas
   ------------------------------------------------------------------------
   P_FULL : process(CLK, RESET_N)
   begin
      if RESET_N = '0' then
         full_r <= '0';                                         -- vide a l'etat initial
      elsif rising_edge(CLK) then
         if ptr_wr_inc = ptr_rd and WR = '1' and cmd_rd = '0' then -- Ecriture et seulement plus q'une adresse de libre dans la FIFO
            full_r <= '1';
         elsif cmd_rd = '1' then
            full_r <= '0';
         end if;
      end if;
   end process P_FULL;

   ------------------------------------------------------------------------
   -- PROCESS : P_LEVEL_R
   -- Description : gestion du compteur du nombre de donnee dans la FIFO
   ------------------------------------------------------------------------
   P_LEVEL_R : process(CLK, RESET_N)
   begin
      if RESET_N = '0' then
         level_r <= (others => '0');
      elsif rising_edge(CLK) then
         if WR = '1' and RD = '0' and full_r = '0' then
            level_r <= level_r + 1;
         elsif (WR and not full_r) = '0' and RD = '1' and ((empty_r    = '0' and G_FWFT = 0) or (buff_empty = '0' and G_FWFT = 1)) then
            level_r <= level_r - 1;
         end if;
      end if;
   end process P_LEVEL_R;

   ------------------------------------------------------------------------
   -- PROCESS : P_ALMOST_EMPTY
   -- Description : gestion du flag fifo presque vide
   ------------------------------------------------------------------------
   P_ALMOST_EMPTY : process(CLK, RESET_N)
   begin
      if RESET_N = '0' then
         ALMOST_EMPTY <= '1';                                                      -- vide au demarrage
      elsif rising_edge(CLK) then
         if level_r = threshold_low_inc and RD = '1' and WR = '0' then             -- Lecture/pas ecriture niveau de la FIFO = seuil bas + 1 => lors de la lecture on atteind le seuil bas
            ALMOST_EMPTY <= '1';
         elsif level_r = unsigned(THRESHOLD_LOW) and WR = '1' and RD = '0' then    -- Eciture/pas lecture niveau de la FIFO = seuil haut => lors de l'ecriture on est plus dans le seuil bas
            ALMOST_EMPTY <= '0';
         end if;
      end if;
   end process P_ALMOST_EMPTY;


   ------------------------------------------------------------------------
   -- PROCESS : P_ALMOST_FULL
   -- Description : gestion du flag fifo presque pleine
   ------------------------------------------------------------------------
   P_ALMOST_FULL : process(CLK, RESET_N)
   begin
      if RESET_N = '0' then
         ALMOST_FULL <= '0';                                                                                           -- vide au demarrage
      elsif rising_edge(CLK) then
         if (level_r = threshold_high_dec or level_r = unsigned(THRESHOLD_HIGH)) and WR = '1' and RD = '0' then        -- Eciture et niveau de la FIFO = seuil haut => lors de l'ecriture on atteind le seuil haut
            ALMOST_FULL <= '1';
         elsif level_r = unsigned(THRESHOLD_HIGH) and RD = '1' and WR = '0' and full_r = '0' then                      -- Lecture/pas ecriture niveau de la FIFO = seuil haut => lors de la lecture on est plus dans le seuil haut
            ALMOST_FULL <= '0';
         end if;
      end if;
   end process P_ALMOST_FULL;

---------------------------------------------------------------------------
-- GESTION DU BUFFER
---------------------------------------------------------------------------
   P_BUFF_EMPTY : process(CLK, RESET_N)
   begin
      if RESET_N = '0' then
         buff_empty <= '1';
      elsif rising_edge(CLK) then
         if empty_r = '1' and RD = '1' then
            buff_empty <= '1';
         elsif empty_r = '0' then
            buff_empty <= '0';
         end if;
      end if;
   end process P_BUFF_EMPTY;



end architecture ARCH_FIFO_SC;
---------------------------------------------------------------------------
-- FIN DU CODE
---------------------------------------------------------------------------
