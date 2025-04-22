library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

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

	-- Define the states of state machine
	type state is ( IDLE,
	               SEND_STREAM,
	               WAIT_READY
	               );

	-- State variable
	signal  mst_exec_state : state;

	-- Signaux
	signal axis_tvalid      : std_logic;
	signal axis_tlast       : std_logic;

	signal stream_data	    : std_logic_vector(M_AXIS_TDATA_WIDTH-1 downto 0);
    signal stream_data_out	: std_logic_vector(M_AXIS_TDATA_WIDTH-1 downto 0);

    signal stream_user	    : std_logic_vector(M_AXIS_TUSER_WIDTH-1 downto 0);
    signal stream_user_out	: std_logic_vector(M_AXIS_TUSER_WIDTH-1 downto 0);

    signal start_frame :std_logic;
    signal end_frame : std_logic;


begin

-- IO
     rd_data_en      <= m00_axis_tready;
     m00_axis_tvalid <= axis_tvalid;
     m00_axis_tlast	 <= axis_tlast;
     m00_axis_tdata	 <= stream_data_out;
     m00_axis_tuser	 <= stream_user_out;
     
-- Delai sur les donnees d'entree pour se synchroniser avec tlast
process(m00_axis_aclk, m00_axis_aresetn)
	begin
	   if(m00_axis_aresetn = '0') then
	       stream_data     <= (others => '0');
	       stream_user     <= (others => '0');
        elsif (rising_edge (m00_axis_aclk)) then
            if m00_axis_tready = '1' then
                stream_data    <= rd_data(M_AXIS_TDATA_WIDTH-1 downto 0);
	           stream_user     <= rd_data(M_AXIS_TDATA_WIDTH + M_AXIS_TUSER_WIDTH-1 downto M_AXIS_TDATA_WIDTH);
	       end if;
	   end if;
end process;

-- Control state machine implementation
process(m00_axis_aclk, m00_axis_aresetn)
	begin
	   if(m00_axis_aresetn = '0') then
	       mst_exec_state  <= IDLE;
	       axis_tvalid     <= '0';
	       axis_tlast      <= '0';
	       stream_data_out <= (others => '0');
	       stream_user_out <= (others => '0');
	       start_frame     <= '0';
	       end_frame       <= '0';

        elsif (rising_edge (m00_axis_aclk)) then
	       case (mst_exec_state) is
            when IDLE =>
                -- Derniere donnee en attente de tready pour etre lue et nouvelle trame a lire
                if end_frame = '1' and m00_axis_tready = '0' and rd_data_vld = '1' then
                    mst_exec_state  <= WAIT_READY;
                    axis_tvalid     <= '0';

                -- Derniere donnee en attente de tready pour etre lue
                elsif end_frame = '1' and m00_axis_tready = '0' and rd_data_vld = '0' then
                    mst_exec_state  <= IDLE;

                -- Nouvelle trame e lire mais attente de tready
	            elsif rd_data_vld = '1' and m00_axis_tready = '0' then
	                mst_exec_state  <= WAIT_READY;
	                axis_tvalid     <= '0';
                    axis_tlast      <= '0';

                -- Debut de lecture d'une nouvelle trame
	            elsif rd_data_vld = '1' then
	               mst_exec_state   <= SEND_STREAM;
	               axis_tvalid      <= '0';
                   axis_tlast       <= '0';
	               start_frame      <= '1';

	            -- Fin de lecture d'une trame
	            elsif m00_axis_tready = '1' then
	               axis_tvalid      <= '0';
                   axis_tlast       <= '0';
                   end_frame        <= '0';
	           end if;

            when SEND_STREAM  =>
                -- Cas particulier : une seule donnee
                if start_frame = '1' and m00_axis_tready = '0' and rd_data_vld = '0' then
                    mst_exec_state <= WAIT_READY;
	                axis_tvalid    <= '0' ;
	                end_frame      <= '1';

                -- Lecture pas commencee en attente tready
                elsif start_frame = '1' and m00_axis_tready = '0' then
	               mst_exec_state <= WAIT_READY;
	               axis_tvalid    <= '0' ;

	            -- Lecture en cours en attente tready
	            elsif rd_data_vld = '1' and m00_axis_tready = '0' then
	               mst_exec_state <= WAIT_READY;
	               axis_tvalid    <= '1' ;

	            -- Derniere donnee e lire en attente de tready
	            elsif rd_data_vld = '0' and m00_axis_tready = '0' then
	               mst_exec_state <= WAIT_READY;
	               axis_tvalid    <= '1' ;
	               end_frame      <= '1';

	            -- Fin de lecture
	            elsif rd_data_vld = '0' and m00_axis_tready = '1' then
	               mst_exec_state <= IDLE;
	               axis_tlast <= '1';
	               axis_tvalid <= '1' ;
	               stream_data_out <= stream_data;
	               stream_user_out <= stream_user;
	               start_frame <= '0';
	               end_frame <= '1';

	           -- Lecture en cours
	           else
	                start_frame <= '0';
	                axis_tlast <= '0';
	                axis_tvalid <= '1' ;
	                stream_data_out <= stream_data;
	                stream_user_out <= stream_user;
	           end if;



	        when WAIT_READY =>
	           -- Cas particulier : une seule donnee 
	           if m00_axis_tready = '1'  and end_frame = '1' and start_frame = '1' then
	               stream_data_out <= stream_data;
	               stream_user_out <= stream_user;
	               mst_exec_state  <= IDLE;
	               axis_tlast <= '1';
	               end_frame <= '1';
	               axis_tvalid <= '1';
	               start_frame <= '0';

	           -- Derniere donnee lue puis attente d'une nouvele trame
	           elsif m00_axis_tready = '1'  and end_frame = '1' and axis_tvalid = '1' then
	               stream_data_out <= stream_data;
	               stream_user_out <= stream_user;
	               mst_exec_state  <= IDLE;
	               axis_tlast <= '1';
	               end_frame <= '1';

	          -- Derniere donnee lue et nouvelle trame e lire
	          elsif m00_axis_tready = '1'  and end_frame = '1'  then
	               axis_tvalid <= '1';
	               mst_exec_state  <= SEND_STREAM;
	               end_frame <= '0';

                -- Suite de lecture de la trame
	           elsif m00_axis_tready = '1'  and axis_tvalid = '1' then
	               mst_exec_state  <= SEND_STREAM;
	               stream_data_out <= stream_data;
	               stream_user_out <= stream_user;

	           -- Debut de lecture 
	           elsif m00_axis_tready = '1'  and start_frame = '1' then
	               mst_exec_state  <= SEND_STREAM;
	               stream_data_out <= stream_data;
	               stream_user_out <= stream_user;
	               start_frame <= '0';
	               axis_tvalid <= '1';


	           elsif m00_axis_tready = '1' then
	               mst_exec_state  <= SEND_STREAM;
	           end if;

	        when others    =>
	          mst_exec_state <= IDLE;

	      end case;
	    end if;
	end process;

end implementation;




