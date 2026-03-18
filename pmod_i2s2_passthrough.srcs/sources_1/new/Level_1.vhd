----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2026 12:45:21 PM
-- Design Name: 
-- Module Name: Level_1 - Behavioral
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

entity Level_1 is
  Port (   
           clk : in std_logic;
           L1_input_left  : in std_logic_vector(23 downto 0);
           L1_input_right : in std_logic_vector(23 downto 0);
           left_valid_in : in std_logic;
           right_valid_in : in std_logic;
           --High output
           H_L1_output_left : out std_logic_vector(23 downto 0);
           H_L1_output_right : out std_logic_vector(23 downto 0);
           --low output
           L_L1_output_left : out std_logic_vector(23 downto 0);
           L_L1_output_right : out std_logic_vector(23 downto 0)
           );
end Level_1;

architecture Behavioral of Level_1 is
    -- Internal signals used to connect Level_1 inputs to the FIR
    signal clk_s              : std_logic;
    signal L1_input_left_s    : std_logic_vector(23 downto 0);
    signal L1_input_right_s   : std_logic_vector(23 downto 0);
    signal left_valid_in_s    : std_logic;
    signal right_valid_in_s   : std_logic;

    -- Internal signals used to capture FIR outputs
    signal L_L1_output_left_s  : std_logic_vector(23 downto 0);
    signal L_L1_output_right_s : std_logic_vector(23 downto 0);

    signal H_L1_output_left_s  : std_logic_vector(23 downto 0);
    signal H_L1_output_right_s : std_logic_vector(23 downto 0);


component L_L1_FIR is
    Port ( 
           clk : in std_logic;
           L1_input_left  : in std_logic_vector(23 downto 0);
           L1_input_right : in std_logic_vector(23 downto 0);
           left_valid_in : in std_logic;
           right_valid_in : in std_logic;
             --low output
           L_L1_output_left : out std_logic_vector(23 downto 0);
           L_L1_output_right : out std_logic_vector(23 downto 0));
end component;

component H_L1_FIR is
  Port ( 
           clk : in std_logic;
           L1_input_left  : in std_logic_vector(23 downto 0);
           L1_input_right : in std_logic_vector(23 downto 0);
           left_valid_in : in std_logic;
           right_valid_in : in std_logic;
           --High output
           H_L1_output_left : out std_logic_vector(23 downto 0);
           H_L1_output_right : out std_logic_vector(23 downto 0)
  );
end component;
begin
    -- Connect top-level inputs to internal signals
    clk_s            <= clk;
    L1_input_left_s  <= L1_input_left;
    L1_input_right_s <= L1_input_right;
    left_valid_in_s  <= left_valid_in;
    right_valid_in_s <= right_valid_in;
    
    -- Instantiate low-pass FIR
    U_L_L1_FIR : L_L1_FIR
        port map (
            clk               => clk_s,
            L1_input_left     => L1_input_left_s,
            L1_input_right    => L1_input_right_s,
            left_valid_in     => left_valid_in_s,
            right_valid_in    => right_valid_in_s,
            L_L1_output_left  => L_L1_output_left_s,
            L_L1_output_right => L_L1_output_right_s
        );
        
        -- Instantiate high-pass FIR
    U_H_L1_FIR : H_L1_FIR
        port map (
            clk               => clk_s,
            L1_input_left     => L1_input_left_s,
            L1_input_right    => L1_input_right_s,
            left_valid_in     => left_valid_in_s,
            right_valid_in    => right_valid_in_s,
            H_L1_output_left  => H_L1_output_left_s,
            H_L1_output_right => H_L1_output_right_s
        );

    -- Drive top-level low outputs from FIR output signals
    L_L1_output_left  <= L_L1_output_left_s;
    L_L1_output_right <= L_L1_output_right_s;
    
     -- High outputs  connected
    H_L1_output_left  <= H_L1_output_left_s;
    H_L1_output_right <= H_L1_output_right_s;
    
end Behavioral;
