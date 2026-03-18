----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2026 04:52:50 PM
-- Design Name: 
-- Module Name: INTERPOLATE_L1 - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity INTERPOLATE_L1 is
 Port (
        clk              : in  std_logic;
        reset            : in  std_logic;

        -- input samples
        H_data_in_left     : in  std_logic_vector(23 downto 0);
        H_data_in_right    : in  std_logic_vector(23 downto 0);
        L_data_in_left     : in  std_logic_vector(23 downto 0);
        L_data_in_right    : in  std_logic_vector(23 downto 0);
        left_valid_in    : in  std_logic;
        right_valid_in   : in  std_logic;

        -- output samples
        data_out_left    : out std_logic_vector(23 downto 0);
        data_out_right   : out std_logic_vector(23 downto 0) );
end INTERPOLATE_L1;

architecture Behavioral of INTERPOLATE_L1 is

signal sum_left_s   : signed(24 downto 0);
signal sum_right_s  : signed(24 downto 0);
    -- high interpolate outputs
    signal H_data_out_left_s  : std_logic_vector(23 downto 0);
    signal H_data_out_right_s : std_logic_vector(23 downto 0);

    -- low interpolate outputs
    signal L_data_out_left_s  : std_logic_vector(23 downto 0);
    signal L_data_out_right_s : std_logic_vector(23 downto 0);

component H_INTP_L1 is
  Port ( clk              : in  std_logic;
        reset            : in  std_logic;

        -- input samples
        data_in_left     : in  std_logic_vector(23 downto 0);
        data_in_right    : in  std_logic_vector(23 downto 0);
        left_valid_in    : in  std_logic;
        right_valid_in   : in  std_logic;

        -- output samples
        data_out_left    : out std_logic_vector(23 downto 0);
        data_out_right   : out std_logic_vector(23 downto 0)
        );
end component;

component L_INTP_L1 is
 Port ( clk              : in  std_logic;
        reset            : in  std_logic;

        -- input samples
        data_in_left     : in  std_logic_vector(23 downto 0);
        data_in_right    : in  std_logic_vector(23 downto 0);
        left_valid_in    : in  std_logic;
        right_valid_in   : in  std_logic;

        -- output samples
        data_out_left    : out std_logic_vector(23 downto 0);
        data_out_right   : out std_logic_vector(23 downto 0)
        );
end component;

begin
 --------------------------------------------------------------------------
    -- High-band interpolator
    --------------------------------------------------------------------------
    U_H_INTP_L1 : H_INTP_L1
        port map (
            clk            => clk,
            reset          => reset,
            data_in_left   => H_data_in_left,
            data_in_right  => H_data_in_right,
            left_valid_in  => left_valid_in,
            right_valid_in => right_valid_in,
            data_out_left  => H_data_out_left_s,
            data_out_right => H_data_out_right_s
        );

    --------------------------------------------------------------------------
    -- Low-band interpolator
    --------------------------------------------------------------------------
    U_L_INTP_L1 : L_INTP_L1
        port map (
            clk            => clk,
            reset          => reset,
            data_in_left   => L_data_in_left,
            data_in_right  => L_data_in_right,
            left_valid_in  => left_valid_in,
            right_valid_in => right_valid_in,
            data_out_left  => L_data_out_left_s,
            data_out_right => L_data_out_right_s
        );
--===================================================================
--Add logic for an L add and a R add then output just one lr channel 
--===================================================================


end Behavioral;
