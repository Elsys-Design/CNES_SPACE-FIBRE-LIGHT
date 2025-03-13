
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

library work;
use work.data_link_lib.all;

entity data_crc_check_tb is
end data_crc_check_tb;

architecture Behavioral of data_crc_check_tb is

    -- Component Declaration for the Unit Under Test (UUT)
    component data_crc_check
        Port (
            CLK         : in  STD_LOGIC;
            RST_N       : in  STD_LOGIC;
            DATA_FROM_DWI     : in  STD_LOGIC_VECTOR(31 downto 0);
            CRC_16B        : in  STD_LOGIC_VECTOR(15 downto 0); 
            CRC_8B        : in  STD_LOGIC_VECTOR(7 downto 0); 
            TYPE_INCOM_FRAME : in  STD_LOGIC_VECTOR(1 downto 0);     
            data_valid  : in  STD_LOGIC;
            crc_out    : out STD_LOGIC_VECTOR(15 downto 0);
            CRC_ERR                : out std_logic
        );
    end component;

    -- Inputs
    signal CLK         : STD_LOGIC := '0';
    signal RST_N       : STD_LOGIC := '0';
    signal DATA_FROM_DWI     : STD_LOGIC_VECTOR(31 downto 0);
    signal CRC_16B     : STD_LOGIC_VECTOR(15 downto 0);
    signal TYPE_INCOM_FRAME : STD_LOGIC_VECTOR(1 downto 0);   
    signal data_valid  : STD_LOGIC := '0';

    -- Outputs
    signal crc_out    : STD_LOGIC_VECTOR(15 downto 0);
    signal CRC_ERR    : STD_LOGIC;
    signal CRC_8B        : STD_LOGIC_VECTOR(7 downto 0); 

    -- Clock process definitions
    constant CLOCK_PERIOD : time := 10 ns;

begin

    -- Instantiate the Unit Under Test (UUT)
    uut: data_crc_check port map (
        CLK => CLK,
        RST_N => RST_N,
        DATA_FROM_DWI => DATA_FROM_DWI,
        CRC_16B => CRC_16B,
        CRC_8B => CRC_8B,
        TYPE_INCOM_FRAME => TYPE_INCOM_FRAME,
        data_valid => data_valid,
        crc_out => crc_out,
        CRC_ERR => CRC_ERR
    );

    -- Clock process
    CLK_process :process
    begin
        CLK <= '0';
        wait for CLOCK_PERIOD/2;
        CLK <= '1';
        wait for CLOCK_PERIOD/2;
    end process;

    -- Stimulus process
    stim_proc: process
    begin
        -- RST_N the CRC
        RST_N <= '0';
        wait for 2 * CLOCK_PERIOD;
        RST_N <= '1';
        --------------------------------------------------------------------------------------
        -------------------------- Test 1: Broadcast frame------------------------------------
        --------------------------------------------------------------------------------------
        TYPE_INCOM_FRAME <= "10";

        -- Send the frame data
        -- COMMA SDF 0x01 0x00
        DATA_FROM_DWI <= C_RESERVED_SYMB & C_RESERVED_SYMB & C_SBF_SYMB & C_K28_7_SYMB;
        data_valid <= '1';
        wait for CLOCK_PERIOD;
        data_valid <= '0';
        CRC_8B <= x"29";

        -- Send the frame data
        -- COMMA SDF 0x01 0x00
        DATA_FROM_DWI <= C_RESERVED_SYMB & C_RESERVED_SYMB & C_RESERVED_SYMB &C_RESERVED_SYMB;
        data_valid <= '1';
        wait for CLOCK_PERIOD;
        data_valid <= '0';

        -- Send the frame data
        -- COMMA SDF 0x01 0x00
        DATA_FROM_DWI <= x"01" & x"01" & x"01" & x"01";
        data_valid <= '1';
        wait for CLOCK_PERIOD;
        data_valid <= '0';

        -- Send the frame data
        -- COMMA SDF 0x01 0x00
        DATA_FROM_DWI <= x"29" & x"41" & x"00" & C_K28_2_SYMB;
        data_valid <= '1';
        wait for CLOCK_PERIOD;
        data_valid <= '0';
        
        -- Wait for a while to observe the output
        
        wait for 10 * CLOCK_PERIOD;

        -- Send the frame data
        -- COMMA SDF 0x01 0x00
        DATA_FROM_DWI <= x"4F" & x"01" & x"01" & C_K28_3_SYMB;
        data_valid <= '1';
        wait for CLOCK_PERIOD;
        data_valid <= '0';
        CRC_8B <= x"4F";
        
        -- Wait for a while to observe the output
        
        wait for 10 * CLOCK_PERIOD;
        --------------------------------------------------------------------------------------
        -------------------------- Test 2: Data frame------------------------------------
        --------------------------------------------------------------------------------------
        TYPE_INCOM_FRAME <= "01";
        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= C_RESERVED_SYMB & x"01" & C_SDF_SYMB & C_K28_7_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';
        -- CRC_16B <= x"35" & x"3D";

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= C_FILL_SYMB & C_FILL_SYMB & C_EOP_SYMB &C_RESERVED_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= x"35" & x"3D" & x"7D" & C_K28_0_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';

        -- DATA_FROM_DWI <= (others =>'0');

        -- -- Wait for a while to observe the output
        -- wait for 10 * CLOCK_PERIOD;

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= C_RESERVED_SYMB & x"01" & C_SDF_SYMB & C_K28_7_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';
        -- CRC_16B <= x"B7" & x"A1";

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= C_EOP_SYMB & x"02" & x"01" & C_RESERVED_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';

        -- -- Send the frame data
        -- -- COMMA SDF 0x01 0x00
        -- DATA_FROM_DWI <= x"B7" & x"A1" & x"7E" & C_K28_0_SYMB;
        -- data_valid <= '1';
        -- wait for CLOCK_PERIOD;
        -- data_valid <= '0';

        -- End of stimulus process
        wait;
    end process;

end Behavioral;
