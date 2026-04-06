----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2026 01:35:15 PM
-- Design Name: 
-- Module Name: AA_filter_1 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AA_filter_1 is
  Port (        clk : in std_logic;
                reset : in std_logic;
                left_valid_in : in std_logic;
                right_valid_in : in std_logic;
                left_reg_input : in std_logic_vector(23 downto 0);
                right_reg_input : in std_logic_vector(23 downto 0);
        
                out_data_left : out std_logic_vector(31 downto 0);
                out_data_right : out std_logic_vector(31 downto 0);
                m_tdata_valid_out: out std_logic
                );
end AA_filter_1;

architecture Behavioral of AA_filter_1 is
-- signals for fir_compiler_0 port map and logic
signal aclk_s : STD_LOGIC := '0';
signal s_axis_data_tvalid_s : STD_LOGIC := '0';
signal s_axis_data_tready_s : STD_LOGIC := '0';
signal s_axis_data_tdata_s : STD_LOGIC_VECTOR(23 DOWNTO 0) := (others => '0');
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

component AA_1_fir IS
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    event_s_data_chanid_incorrect : OUT STD_LOGIC
  );
END component;

begin
AA_1: AA_1_fir port map (
    aclk               => clk,
    s_axis_data_tvalid => s_axis_data_tvalid_s,
    s_axis_data_tready => s_axis_data_tready_s,
    s_axis_data_tdata  => s_axis_data_tdata_s,
    m_axis_data_tvalid => m_axis_data_tvalid_s,
    m_axis_data_tdata  => m_axis_data_tdata_s,
    s_axis_data_tuser  => s_axis_data_tuser_s,
    m_axis_data_tuser  => m_axis_data_tuser_s
);

m_tdata_valid_out_s <= m_axis_data_tvalid_s;
m_tdata_valid_out   <= m_tdata_valid_out_s;
out_data_left       <= out_data_L_s;
out_data_right      <= out_data_R_s;
left_valid_in_s <= left_valid_in;
right_valid_in_s <= right_valid_in;
process(clk)
begin
    if reset = '1' then
        left_valid_in_s <= '0';
        right_valid_in_s <= '0';

        s_axis_data_tvalid_s <= '0';
        s_axis_data_tdata_s  <= (others => '0');
        s_axis_data_tuser_s  <= "0";

        hold_data_s <= (others => '0');
        hold_user_s <= "0";

        out_data_L_s <= (others => '0');
        out_data_R_s <= (others => '0');

        state <= Idle;
        next_state <= Idle;

    elsif rising_edge(clk) then
        -- register your incoming valid strobes into your existing signals

        state <= next_state;
        --------------------------------------------------------------------
        -- NEW STATE MACHINE LOGIC
        -- keeps left = "1" and right = "0"
        --------------------------------------------------------------------
        case state is

            when Idle =>

                -- choose next sample source
                -- left has priority if both happen together
                if left_valid_in = '1' then
                    state <= Load_Left;
                elsif right_valid_in = '1' then
                    state <= Load_Right;
                else
                    state <= Idle;
                end if;
            when Load_Left =>
                -- keep your mapping: LEFT = "1"
                hold_data_s <= left_reg_input;
                --hold_user_s <= "1";

                s_axis_data_tdata_s  <= left_reg_input;
                --s_axis_data_tuser_s  <= "1";
                s_axis_data_tvalid_s <= '1';

                state <= Hold_Valid;

            when Load_Right =>
                -- keep your mapping: RIGHT = "0"
                hold_data_s <= right_reg_input;
                --hold_user_s <= "0";

                s_axis_data_tdata_s  <= right_reg_input;
                --s_axis_data_tuser_s  <= "0";
                s_axis_data_tvalid_s <= '1';

                state <= Hold_Valid;

            when Hold_Valid =>
                -- hold data and tag stable until FIR accepts sample
                s_axis_data_tdata_s  <= hold_data_s;
                --s_axis_data_tuser_s  <= hold_user_s;
                s_axis_data_tvalid_s <= '1';

                if (s_axis_data_tvalid_s = '1') and (s_axis_data_tuser_s = "0") then
                    if s_axis_data_tready_s = '1' then
                        s_axis_data_tvalid_s <= '0';
                        s_axis_data_tuser_s <= "1";
                        s_axis_data_tlast_s <= '1';
                        state <= Idle;
                    end if;
                elsif (s_axis_data_tvalid_s = '1') and (s_axis_data_tuser_s = "1") then
                    if s_axis_data_tready_s = '1' then
                         s_axis_data_tvalid_s <= '0';
                        s_axis_data_tuser_s <= "0";
                        s_axis_data_tlast_s <= '0';
                        state <= Idle;
                     end if;
                else
                    state <= Hold_Valid;
                end if;

            when others =>
                s_axis_data_tvalid_s <= '0';
                state <= Idle;

        end case;

        --------------------------------------------------------------------
        -- OUTPUT: keep your current mapping
        -- LEFT output when m_axis_data_tuser_s = "1"
        -- RIGHT output when m_axis_data_tuser_s = "0"
        --------------------------------------------------------------------
--        if count_M_valid_out >= 1 then
--            count_M_valid_out <= 2;
            if (m_axis_data_tvalid_s = '1') and (m_axis_data_tuser_s = "0") then
                out_data_L_s <= m_axis_data_tdata_s;
            end if;
    
            if (m_axis_data_tvalid_s = '1') and (m_axis_data_tuser_s = "1") then
                out_data_R_s <= m_axis_data_tdata_s;
            end if;
--        else
--            if m_axis_data_tvalid_s = '1' then
--                count_M_valid_out <= count_M_valid_out + 1;
--            end if;
--        end if;
    end if;
end process;

end Behavioral;
