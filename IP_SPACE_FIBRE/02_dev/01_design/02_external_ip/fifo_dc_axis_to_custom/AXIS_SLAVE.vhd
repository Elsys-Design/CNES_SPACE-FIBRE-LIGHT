library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AXIS_SLAVE is
	generic (
		-- Users to add parameters here
        G_DWIDTH            : integer   := 36;
		-- User parameters ends
		-- Do not modify the parameters beyond this line
		S_AXIS_TDATA_WIDTH	: integer	:= 32;
		S_AXIS_TUSER_WIDTH	: integer	:= 4
	);
	port (
		-- Users to add ports here
        wr_data         : out std_logic_vector(G_DWIDTH-1 downto 0);
        wr_enable       : out std_logic;
        status_full     : in std_logic;
		-- User ports ends
		-- Do not modify the ports beyond this line
		s00_axis_aclk	: in std_logic;                     -- AXI4Stream sink: Clock
		s00_axis_aresetn: in std_logic;                     -- AXI4Stream sink: Reset
		s00_axis_tready	: out std_logic;                    -- Ready to accept data in
		s00_axis_tdata	: in std_logic_vector(S_AXIS_TDATA_WIDTH-1 downto 0);
		s00_axis_tuser	: in std_logic_vector(S_AXIS_TUSER_WIDTH-1 downto 0);
		s00_axis_tlast	: in std_logic;                     -- Indicates boundary of last packet
		s00_axis_tvalid	: in std_logic                      -- Data is in valid
	);
end AXIS_SLAVE;

architecture implementation of AXIS_SLAVE is
begin
	-- Add user logic here
    s00_axis_tready     <= not status_full;                 -- Ecriture permise si la fifo n'est pas pleine
    wr_enable           <= s00_axis_tvalid;                 -- Ecriture si donn�e valide
    wr_data             <= s00_axis_tuser & s00_axis_tdata; -- Reconstruction du mot de 36 bits
	-- User logic ends
end implementation;
