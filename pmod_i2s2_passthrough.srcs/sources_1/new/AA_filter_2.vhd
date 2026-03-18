----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2026 01:35:15 PM
-- Design Name: 
-- Module Name: AA_filter_2 - Behavioral
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

entity AA_filter_2 is
  Port (    clk : in std_logic;
            reset : in std_logic;
            left_valid_in : in std_logic;
            right_valid_in : in std_logic;
            left_reg_input : in std_logic_vector(23 downto 0);
            right_reg_input : in std_logic_vector(23 downto 0);
            
            out_data_left : out std_logic_vector(23 downto 0);
            out_data_right : out std_logic_vector(23 downto 0);
           -- m_out_data : out std_logic_vector(23 downto 0);
            m_tdata_valid_out: out std_logic
            );
end AA_filter_2;

architecture Behavioral of AA_filter_2 is

-- signals for fir_compiler_0 port map and logic
signal    aclk_s :  STD_LOGIC := '0';
signal    s_axis_data_tvalid_s :  STD_LOGIC := '0';
signal    s_axis_data_tready_s :  STD_LOGIC := '0';
signal    s_axis_data_tdata_s :  STD_LOGIC_VECTOR(23 DOWNTO 0) := (others => '0');
signal    m_axis_data_tvalid_s :  STD_LOGIC := '0';
signal    m_axis_data_tdata_s :  STD_LOGIC_VECTOR(31 DOWNTO 0) := (others => '0');
signal    s_axis_data_tuser_s : std_logic_vector(0 downto 0) := "0";
signal    m_axis_data_tuser_s : std_logic_vector(0 downto 0) := "0";
signal    m_tdata_valid_out_s : std_logic := '0';

signal    out_data_L_s : std_logic_vector(23 downto 0) := (others => '0');
signal    out_data_R_s : std_logic_vector(23 downto 0) := (others => '0');

signal    count_M_valid_out : integer := 0;

signal    left_valid_in_s : std_logic := '0';
signal    right_valid_in_s : std_logic := '0';



component fir_compiler_0 IS
  PORT (
    aclk : IN STD_LOGIC;
    s_axis_data_tvalid : IN STD_LOGIC;
    s_axis_data_tready : OUT STD_LOGIC;
    s_axis_data_tdata : IN STD_LOGIC_VECTOR(23 DOWNTO 0);
    m_axis_data_tvalid : OUT STD_LOGIC;
    m_axis_data_tdata : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    s_axis_data_tuser : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    m_axis_data_tuser : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END component;
begin
fir_0: fir_compiler_0 port map (
    aclk               => clk,
    s_axis_data_tvalid  => s_axis_data_tvalid_s,
    s_axis_data_tready  => s_axis_data_tready_s,
    s_axis_data_tdata   => s_axis_data_tdata_s,
    m_axis_data_tvalid  => m_axis_data_tvalid_s,
    m_axis_data_tdata   => m_axis_data_tdata_s,
    s_axis_data_tuser => s_axis_data_tuser_s,
    m_axis_data_tuser => m_axis_data_tuser_s
);

m_tdata_valid_out_s <= m_axis_data_tvalid_s;
m_tdata_valid_out <= m_tdata_valid_out_s;
out_data_left <= out_data_L_s;
out_data_right <= out_data_R_s;
left_valid_in_s <= left_valid_in;
right_valid_in_s <= right_valid_in;

    process(clk)
        begin
            if reset = '1' then
                left_valid_in_s <= '0';
                right_valid_in_s <= '0';
            elsif rising_edge(clk) then
                -- if input channels are valid always valid for single channel every 511 aclk cycles
                -- default: no new input unless we successfully handshake
                if s_axis_data_tvalid_s = '1' then
                  -- if we were holding a sample, only drop tvalid after handshake
                  if s_axis_data_tready_s = '1' then
                    s_axis_data_tvalid_s <= '0';
                  end if;
                end if;
                -- load a new sample only if we're not currently holding one
                if s_axis_data_tvalid_s = '0' then
                  if left_valid_in = '1' then
                    s_axis_data_tuser_s  <= "1";          -- tag = left
                    s_axis_data_tdata_s  <= left_reg_input;
                    s_axis_data_tvalid_s <= '1';
                  elsif right_valid_in = '1' then
                    s_axis_data_tuser_s  <= "0";          -- tag = right
                    s_axis_data_tdata_s  <= right_reg_input;
                    s_axis_data_tvalid_s <= '1';
                  end if;
                end if;
--                if m_axis_data_tvalid_s = '1' then
                    
--                    count_M_valid_out <= count_M_valid_out + 1;
                --every system clk theis m_valid_out_s will be high
--                if count_M_valid_out <= 2 then
--                    m_tdata_valid_out_s <= '0';
--                else
--                    count_M_valid_out <= 3;
--                    m_tdata_valid_out_s <= '1';
--                end if;
                    
--                end if;
                -- OUTPUT: use the OUTPUT tag (NOT s_axis tag)
                if (m_axis_data_tvalid_s = '1') and (m_axis_data_tuser_s = "1") then
                    out_data_L_s <= m_axis_data_tdata_s(29 downto 6);--data out
                end if;
                if(m_axis_data_tvalid_s = '1') and (m_axis_data_tuser_s = "0") then
                    out_data_R_s <= m_axis_data_tdata_s(29 downto 6); --data out
                end if;
                -- end of input channel check
            end if;
    end process;

end Behavioral;
