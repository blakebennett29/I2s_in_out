----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/24/2026 12:27:21 PM
-- Design Name: 
-- Module Name: Down_Up_sampling - Behavioral
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

entity Down_Up_sampling is
port (
    reset : in std_logic;
    --------------------------------------------------------------------------
    -- Sample-time pulses (1 clk wide) derived from LRCLK edges
    --------------------------------------------------------------------------
    fs96_tick   : out std_logic;  -- once per stereo frame (96 kHz)
    fs48_tick   : out std_logic;  -- once per 2 frames (48 kHz)
    fs24_tick   : out std_logic;  -- once per 4 frames (24 kHz)
    
    --------------------------------------------------------------------------
    -- Downsampled sample outputs (simple decimate-by-N of the captured 96k stream)
    -- Format: 32-bit word per channel (your choice: left-justified 24-bit in [31:8])
    --------------------------------------------------------------------------
    ds48_left   : out std_logic_vector(31 downto 0);
    ds48_right  : out std_logic_vector(31 downto 0);
    ds48_valid  : out std_logic;

    ds24_left   : out std_logic_vector(31 downto 0);
    ds24_right  : out std_logic_vector(31 downto 0);
    ds24_valid  : out std_logic;

    --------------------------------------------------------------------------
    -- Reserved ports for upsample back to 96 kHz (e.g., linear interpolation)
    -- Provide a 96k stream into this block; when us96_valid='1', TX uses it.
    --------------------------------------------------------------------------
    us96_left   : in  std_logic_vector(31 downto 0);
    us96_right  : in  std_logic_vector(31 downto 0);
    us96_valid  : in  std_logic
 );
end Down_Up_sampling;

architecture Behavioral of Down_Up_sampling is
-- i2s_in_out signials
signal clk_s : std_logic := '0';
signal reset_s : std_logic := '0';
signal sclk_s : std_logic := '0';
signal mclk_s : std_logic := '0';
signal lrclk_s : std_logic :='0';
signal data_s : std_logic :='0';

signal r_sclk_s : std_logic :='0';
signal r_mclk_s : std_logic :='0';
signal r_lrclk_s : std_logic :='0';
signal r_data_s : std_logic :='0';
--component i2s_in_out is
--  Port (    clk : in std_logic;
--            reset : in std_logic;
--            --i2s in
--            sclk : out std_logic;
--            mclk : out std_logic;
--            lrclk : out std_logic;
--            data: out std_logic;
--            --i2s out transmitter
--            r_sclk: out std_logic;
--            r_mclk: out std_logic;
--            r_lrclk: out std_logic;
--            r_data: out std_logic
--            );
--end component;





begin
--reset <= reset_s;
--i2s:  i2s_in_out Port map (
--            clk => clk_s,
--            reset => reset_s,
--            sclk => sclk_s,
--            mclk => mclk_s,
--            lrclk => lrclk_s,
--            data => data_s,
--            r_sclk => r_sclk_s,
--            r_mclk => r_mclk_s,
--            r_lrclk => r_lrclk_s,
--            r_data => r_data_s
--        );

end Behavioral;
