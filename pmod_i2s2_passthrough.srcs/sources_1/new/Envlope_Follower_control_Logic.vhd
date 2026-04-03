----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/30/2026 10:57:48 PM
-- Design Name: 
-- Module Name: Envlope_Follower_control_Logic - Behavioral
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
use IEEE.NUMERIC_STD.ALL;
use IEEE.fixed_pkg.ALL;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Envlope_Follower_control_Logic is
    Port (  env_in : in std_logic_vector(17 downto 0);
            env_start: in STD_LOGIC;
            env_clk : in STD_LOGIC;
            env_rst : in STD_LOGIC;
            env_out : out std_logic_vector(17 downto 0)
             );
end Envlope_Follower_control_Logic;

architecture Behavioral of Envlope_Follower_control_Logic is

signal env_in_s : std_logic_vector (17 downto 0) := (others => '0');
signal env_start_s : std_logic :='0';
signal env_clk_s : std_logic := '0';
signal env_rst_s : std_logic := '0';
signal env_out_s : std_logic_vector(17 downto 0);

component Envelope_Follower is
    Port ( env_in : in STD_LOGIC_VECTOR (17 downto 0);
           env_start: in STD_LOGIC;
           env_clk : in STD_LOGIC;
           env_rst : in STD_LOGIC;
           env_out : out STD_LOGIC_VECTOR (17 downto 0));
end component;

begin
env_in_s <= env_in;
env_start_s <= env_start;
env_clk_s <= env_clk;
env_rst_s <= env_rst;
env_out <= env_out_s;
EV: Envelope_Follower port map(
           env_in => env_in_s,
           env_start => env_start_s,
           env_clk => env_clk_s,
           env_rst => env_rst_s,
           env_out => env_out_s
           );


end Behavioral;
