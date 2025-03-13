library ieee;
use ieee.std_logic_1164.all;
--use ieee.numeric_std.all;

entity AXIS_MASTER is
	generic (
		-- Users to add parameters here
        G_DWIDTH                : integer := 36;  
		-- User parameters ends
		-- Do not modify the parameters beyond this line
		-- Width of S_AXIS address bus. The slave accepts the read and write addresses of width C_M_AXIS_TDATA_WIDTH.
		M_AXIS_TDATA_WIDTH      : integer := 32;
		M_AXIS_TUSER_WIDTH      : integer := 4
	);
	port (
		-- Users to add ports here
        rd_data                 : in std_logic_vector(G_DWIDTH-1 downto 0);     -- Data read bus
		rd_data_vld             : in std_logic;                                 -- Read command 
		rd_data_en              : out std_logic;                                -- Data valid
		-- User ports ends
		-- Do not modify the ports beyond this line
		-- Global ports
		m00_axis_aclk	        : in std_logic;
		m00_axis_aresetn	    : in std_logic;
		m00_axis_tvalid	        : out std_logic;
		m00_axis_tdata	        : out std_logic_vector(M_AXIS_TDATA_WIDTH-1 downto 0);
		m00_axis_tlast	        : out std_logic;
		m00_axis_tready	        : in std_logic;
		m00_axis_tuser          : out std_logic_vector(M_AXIS_TUSER_WIDTH-1 downto 0)
	);
end AXIS_MASTER;

architecture implementation of AXIS_MASTER is

-- Add user logic here
signal prev_rd_data_vld      : std_logic := '0';
signal rd_data_delay         : std_logic_vector(M_AXIS_TDATA_WIDTH-1 downto 0) := (others => '0'); 
signal rd_user_delay         : std_logic_vector(M_AXIS_TUSER_WIDTH-1 downto 0) := (others => '0');

begin
	
    process(m00_axis_aclk, m00_axis_aresetn)
    begin
        if rising_edge(m00_axis_aclk) then
            if m00_axis_aresetn = '0' then
                prev_rd_data_vld   <= '0';
                rd_data_delay      <= (others => '0');
                rd_user_delay      <= (others => '0');
            else
                prev_rd_data_vld   <= rd_data_vld;
                -- Séparation des données et du contexte
                rd_data_delay      <= rd_data(M_AXIS_TDATA_WIDTH-1 downto 0); 
                rd_user_delay      <= rd_data(M_AXIS_TDATA_WIDTH+M_AXIS_TUSER_WIDTH-1 downto M_AXIS_TDATA_WIDTH); 
            end if;
        end if;
    end process;
    
    -- Assignation des signaux de sortie
    m00_axis_tdata   <= rd_data_delay;   
    m00_axis_tvalid  <= prev_rd_data_vld; 
    m00_axis_tuser   <= rd_user_delay;
    m00_axis_tlast   <= '1' when (prev_rd_data_vld = '1' and rd_data_vld = '0') else '0'; -- génération de tlast avant que tvalid passe à 0
    rd_data_en       <= m00_axis_tready;

end implementation;
