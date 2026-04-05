------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 03/12/2026 01:35:15 PM
---- Design Name: 
---- Module Name: AA_filter_2 - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

entity AA_filter_2 is
  Port (
        clk : in std_logic;
        reset : in std_logic;
        left_valid_in : in std_logic;
        right_valid_in : in std_logic;
        m_tdata_valid_in: in std_logic;
        input_left : in std_logic_vector(31 downto 0);
        input_right : in std_logic_vector(31 downto 0);

        out_data_left : out std_logic_vector(31 downto 0);
        out_data_right : out std_logic_vector(31 downto 0);
        m_tdata_valid_out: out std_logic
  );
end AA_filter_2;

architecture Behavioral of AA_filter_2 is

-- signals for fir_compiler_0 port map and logic
signal aclk_s : STD_LOGIC := '0';
signal s_axis_data_tvalid_s : STD_LOGIC := '0';
signal s_axis_data_tready_s : STD_LOGIC := '0';
signal s_axis_data_tdata_s : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal m_axis_data_tvalid_s : STD_LOGIC := '0';
signal m_axis_data_tdata_s : STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal s_axis_data_tuser_s : std_logic_vector(0 downto 0) := "0";
signal m_axis_data_tuser_s : std_logic_vector(0 downto 0) := "0";
signal m_tdata_valid_out_s : std_logic := '0';
signal s_axis_data_tlast_s : std_logic := '0';
signal out_data_L_s : std_logic_vector(31 downto 0) := (others => '0');
signal out_data_R_s : std_logic_vector(31 downto 0) := (others => '0');

signal count_M_valid_out : integer := 0;

signal left_valid_in_s : std_logic := '0';
signal right_valid_in_s : std_logic := '0';

-- added state machine signals, while keeping your current signal names
type AXI_INPUT_STATE is (Idle, Load_Left, Load_Right, Hold_Valid);
signal state : AXI_INPUT_STATE := Idle;
signal next_state : AXI_INPUT_STATE := Idle;

-- hold buffered sample and tag stable until handshake
signal hold_data_s : std_logic_vector(23 downto 0) := (others => '0');
signal hold_user_s : std_logic_vector(0 downto 0) := "0";

    -- Internal signals used to connect Level_1 inputs to the FIR
    signal clk_s              : std_logic := '0';
    signal L1_input_left_s    : std_logic_vector(31 downto 0) := (others => '0');
    signal L1_input_right_s   : std_logic_vector(31 downto 0) := (others => '0');


    -- Internal signals used to capture FIR outputs
    signal output_left_s  : std_logic_vector(31 downto 0) := (others => '0');
    signal output_right_s : std_logic_vector(31 downto 0) := (others => '0');

    signal H_L1_output_left_s  : std_logic_vector(31 downto 0) := (others => '0');
    signal H_L1_output_right_s : std_logic_vector(31 downto 0) := (others => '0');

    signal m_tdata_valid_out_L1_s : std_logic := '0';
    signal m_tdata_valid_out_H1_s : std_logic := '0';
    
    signal M_tdata_valid_in_s : std_logic := '0';
component fir_compiler_0 IS
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_data_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_data_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_axis_data_tlast : IN STD_LOGIC
  );
END component;

begin

fir_0: fir_compiler_0 port map (
    aclk               => clk,
    s_axis_data_tvalid => s_axis_data_tvalid_s,
    s_axis_data_tready => s_axis_data_tready_s,
    s_axis_data_tdata  => s_axis_data_tdata_s,
    m_axis_data_tvalid => m_axis_data_tvalid_s,
    m_axis_data_tdata  => m_axis_data_tdata_s,
    s_axis_data_tuser  => s_axis_data_tuser_s,
    m_axis_data_tuser  => m_axis_data_tuser_s,
    s_axis_data_tlast => s_axis_data_tlast_s
);

m_tdata_valid_in_s <= m_tdata_valid_in;
m_tdata_valid_out_s <= m_tdata_valid_in_s;
m_tdata_valid_out <= m_axis_data_tvalid_s;

out_data_left <= output_left_s;
out_data_right <= output_right_s;
    process(clk)
        begin
            if rising_edge(clk) then
                -- if input channels are valid always valid for single channel every 511 aclk cycles
                -- default: no new input unless we successfully handshake
--                if s_axis_data_tvalid_s = '1's_axis_data_tvalid_s = '1' then
--                  -- if we were holding a sample, only drop tvalid after handshake
--                  if s_axis_data_tready_s = '1' then
--                    s_axis_data_tvalid_s <= '0';
--                  end if;
--                end if;
                -- load a new sample only if we're not currently holding one
                if m_tdata_valid_in_s = '1' then
                    s_axis_data_tvalid_s <= '1';
                    if s_axis_data_tuser_s = "0" then
                        --s_axis_data_tuser_s  <= "1";         -- tag = left
                        s_axis_data_tdata_s  <= input_right;
                        s_axis_data_tvalid_s <= '1';
                    elsif s_axis_data_tuser_s = "1" then
                        --right_valid_cnt <= 0;
                        --s_axis_data_tuser_s  <= "0";          -- tag = right
                        s_axis_data_tdata_s  <= input_left;
                        s_axis_data_tvalid_s <= '1';
                    end if;
                elsif m_tdata_valid_in_s = '0' then
                    if (s_axis_data_tvalid_s = '1') and (s_axis_data_tuser_s = "1") then
                            s_axis_data_tvalid_s <= '0';
                            s_axis_data_tuser_s <= "0";
                            --s_axis_data_tlast_s <= '0';
                    elsif (s_axis_data_tvalid_s = '1') and (s_axis_data_tuser_s = "0") then
                            s_axis_data_tuser_s <= "1";
                            --s_axis_data_tlast_s <= '1';
                            s_axis_data_tvalid_s <= '0';
                    end if;
                end if;
                
                -- OUTPUT: use the OUTPUT tag (NOT s_axis tag)
                if (m_axis_data_tvalid_s = '1') and (m_axis_data_tuser_s = "1") then
                    output_left_s <= m_axis_data_tdata_s;--(29 downto 6);--data out
                end if;
                if(m_axis_data_tvalid_s = '1') and (m_axis_data_tuser_s = "0") then
                    output_right_s <= m_axis_data_tdata_s;--(29 downto 6); --data out
                end if;
                -- end of input channel check
            end if;
    end process;

end Behavioral;