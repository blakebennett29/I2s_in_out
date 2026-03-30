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
        H_data_in_left     : in  std_logic_vector(31 downto 0);
        H_data_in_right    : in  std_logic_vector(31 downto 0);
        L_data_in_left     : in  std_logic_vector(31 downto 0);
        L_data_in_right    : in  std_logic_vector(31 downto 0);
        left_valid_in    : in  std_logic;
        right_valid_in   : in  std_logic;
        m_tdata_valid_in_L1 : in std_logic;
        m_tdata_valid_in_H1 : in std_logic;
        
        m_tdata_valid_out_int_aa : out std_logic;
        -- output samples
        data_out_left    : out std_logic_vector(31 downto 0);
        data_out_right   : out std_logic_vector(31 downto 0) );
end INTERPOLATE_L1;

architecture Behavioral of INTERPOLATE_L1 is

signal sum_left_s   : signed(33 downto 0) := (others => '0');
signal sum_right_s  : signed(33 downto 0) := (others => '0');
    -- high interpolate outputs
    signal H_data_out_left_s  : std_logic_vector(31 downto 0) := (others => '0');
    signal H_data_out_right_s : std_logic_vector(31 downto 0) := (others => '0');

    -- low interpolate outputs
    signal L_data_out_left_s  : std_logic_vector(31 downto 0) := (others => '0');
    signal L_data_out_right_s : std_logic_vector(31 downto 0) := (others => '0');
    
    signal m_tdata_valid_out : std_logic := '0';
    signal m_tdata_valid_in_L1_s : std_logic := '0';
    signal m_tdata_valid_in_H1_s : std_logic := '0';
    signal m_tdata_valid_out_int_aa_s : std_logic := '0';
    
    signal H_data_in_left_s : std_logic_vector(31 downto 0) := (others => '0');
    signal H_data_in_right_s : std_logic_vector(31 downto 0) := (others => '0');
    signal L_data_in_right_s : std_logic_vector(31 downto 0) := (others => '0');
    signal L_data_in_left_s : std_logic_vector(31 downto 0) := (others => '0');
    
    signal m_tdata_valid_out_s : std_logic := '0';
    signal data_out_left_s : std_logic_vector(31 downto 0) := (others => '0');
    signal data_out_right_s : std_logic_vector(31 downto 0) := (others => '0');
    
    
    type State_Add is (Idle, ADD, Assign);
    signal state, next_state : State_Add;
component H_INTP_L1 is
  Port ( clk              : in  std_logic;
        reset            : in  std_logic;

        -- input samples
        data_in_left     : in  std_logic_vector(31 downto 0);
        data_in_right    : in  std_logic_vector(31 downto 0);
        left_valid_in    : in  std_logic;
        right_valid_in   : in  std_logic;

        m_tdata_valid_in : in std_logic;

        -- output samples
        data_out_left    : out std_logic_vector(31 downto 0);
        data_out_right   : out std_logic_vector(31 downto 0);
        m_tdata_valid_out : out std_logic
        );
end component;

component L_INTP_L1 is
 Port ( clk              : in  std_logic;
        reset            : in  std_logic;

        -- input samples
        data_in_left     : in  std_logic_vector(31 downto 0);
        data_in_right    : in  std_logic_vector(31 downto 0);
        left_valid_in    : in  std_logic;
        right_valid_in   : in  std_logic;
        
        m_tdata_valid_in : in std_logic;
        
        -- output samples
        data_out_left    : out std_logic_vector(31 downto 0);
        data_out_right   : out std_logic_vector(31 downto 0)
        );
end component;

begin
m_tdata_valid_in_H1_s <= m_tdata_valid_in_H1;
m_tdata_valid_in_L1_s <= m_tdata_valid_in_L1;

H_data_in_left_s <= H_data_in_left;
H_data_in_right_s <= H_data_in_right;

L_data_in_right_s <= L_data_in_right;
L_data_in_left_s <= L_data_in_left;
data_out_left <= data_out_left_s;
data_out_right <= data_out_right_s;

m_tdata_valid_out_int_aa <= m_tdata_valid_out_s;
 --------------------------------------------------------------------------
    -- High-band interpolator
    --------------------------------------------------------------------------
    U_H_INTP_L1 : H_INTP_L1
        port map (
            clk            => clk,
            reset          => reset,
            data_in_left   => H_data_in_left_s,
            data_in_right  => H_data_in_right_s,
            left_valid_in  => left_valid_in,
            right_valid_in => right_valid_in,
            m_tdata_valid_in => m_tdata_valid_in_H1_s,
            data_out_left  => H_data_out_left_s,
            data_out_right => H_data_out_right_s,
            m_tdata_valid_out => m_tdata_valid_out_s
        );

    --------------------------------------------------------------------------
    -- Low-band interpolator
    --------------------------------------------------------------------------
    U_L_INTP_L1 : L_INTP_L1
        port map (
            clk            => clk,
            reset          => reset,
            data_in_left   => L_data_in_left_s,
            data_in_right  => L_data_in_right_s,
            left_valid_in  => left_valid_in,
            right_valid_in => right_valid_in,
            m_tdata_valid_in => m_tdata_valid_in_L1_s,
            data_out_left  => L_data_out_left_s,
            data_out_right => L_data_out_right_s
        );
--===================================================================
--Add logic for an L add and a R add then output just one lr channel 
--===================================================================
process(clk)
    begin
        if reset = '1' then
            state <= Idle;
            next_state <= Idle;
         elsif rising_edge(clk) then
            state <= next_state;
            case State is
                when Idle =>
                    if m_tdata_valid_out_s = '1' then
                        next_state <= Add;
                    end if;
                when ADD =>
                    sum_left_s <= resize(signed(H_data_out_left_s),34) + resize(signed(L_data_out_left_s),34);
                    sum_right_s <= resize(signed(H_data_out_right_s),34) + resize(signed(L_data_out_right_s),34);
                    next_state <= Assign;
                when Assign =>
                    data_out_left_s <= (std_logic_vector(resize(sum_left_s,32))); --L_data_out_left_s; --
                    data_out_right_s <= (std_logic_vector(resize(sum_right_s,32))); --L_data_out_left_s;--
                    next_state <= Idle;
            end case;
            
        end if;
--        if m_tdata_valid_out_s = '1' then
--            sum_left_s <= resize(signed(H_data_out_left_s),50) + resize(signed(L_data_out_left_s),50);
--            sum_right_s <= resize(signed(H_data_out_right_s),50) + resize(signed(L_data_out_right_s),50);
--            if m_tdata_valid_out_s = '1' then
--                data_out_left_s <= (std_logic_vector(resize(sum_left_s,31)));
--                data_out_right_s <= (std_logic_vector(resize(sum_left_s,31)));
--            end if;
--        end if;

end process;

end Behavioral;
