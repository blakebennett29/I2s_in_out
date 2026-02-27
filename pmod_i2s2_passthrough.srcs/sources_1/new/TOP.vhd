----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2026 03:21:23 PM
-- Design Name: 
-- Module Name: TOP - Behavioral
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

entity TOP is
  Port (    clk: in std_logic;
            reset: in std_logic;
              
            r_sclk: out std_logic;
            r_mclk: out std_logic;
            r_lrclk: out std_logic;
            r_data: out std_logic; --in for actual use
            
            t_sclk: out std_logic;
            t_mclk: out std_logic;
            t_lrclk: out std_logic;
            t_data: out std_logic
            );
end TOP;

architecture Behavioral of TOP is
signal mcnt : integer := 0;
signal scnt : integer :=0;
signal lrcnt : integer :=0;
signal mclk_s : std_logic := '0';
signal sclk_s : std_logic := '0';
signal lrclk_s : std_logic :='0';
signal reset_s : std_logic := '0';
--blk memory signials
signal ena_s : std_logic := '1';
signal wea_s : std_logic_vector(0 downto 0) := "0";
signal addra_s : std_logic_vector(4 downto 0) :="00000";
signal dina_s : std_logic_vector(31 downto 0) := x"00000000";
signal douta_s : std_logic_vector(31 downto 0) := (others => '0');
--shift register data
signal shift_Reg_load: std_logic_vector(31 downto 0) := (others => '0');
signal shift_cnt : integer := 0;
signal shift_cnt_out : integer := 0;
signal address : integer :=0;
signal sclk_fall_pulse : std_logic := '0';
signal lrclk_fall_pulse : std_logic := '0';
signal lrclk_rise_pulse : std_logic := '0';

-- additional registers for reciver side
signal right_reg : std_logic_vector(31 downto 0) := (others =>'0');
signal left_reg : std_logic_vector(31 downto 0) := (others =>'0');
signal right_reg_output_s : std_logic_vector(31 downto 0) := (others =>'0');--hold for sample period
signal left_reg_output_s : std_logic_vector(31 downto 0) := (others =>'0');--hold for sample period
signal left_reg_shift_c : std_logic_vector(23 downto 0) := (others =>'0');--shift to output dac
signal right_reg_shift_c : std_logic_vector(23 downto 0) := (others =>'0');-- shift to ouput dac
-- state machine for l and R channel output
type LR_State is (Idle, Right, Left);
signal state, next_state : LR_State;
-- ============================================================
-- Signals for Down_Up_sampling instance (all *_s)
-- ============================================================
--signal reset_s     : std_logic;

signal fs96_tick_s : std_logic;
signal fs48_tick_s : std_logic;
signal fs24_tick_s : std_logic;

signal ds48_left_s  : std_logic_vector(31 downto 0);
signal ds48_right_s : std_logic_vector(31 downto 0);
signal ds48_valid_s : std_logic;

signal ds24_left_s  : std_logic_vector(31 downto 0);
signal ds24_right_s : std_logic_vector(31 downto 0);
signal ds24_valid_s : std_logic;

signal us96_left_s  : std_logic_vector(31 downto 0)  := (others => '0');
signal us96_right_s : std_logic_vector(31 downto 0)  := (others => '0');
signal us96_valid_s : std_logic := '0';
-- ============================================================
-- Signals for lrclk rising and falling detection 
-- ============================================================
signal sample_left_48khz_cnt : integer := 0;
signal sample_right_48khz_cnt : integer := 0;
signal sample_left_96khz_cnt : integer := 0;
signal sample_right_96khz_cnt : integer := 0;
--down sampling signials
signal left_sample_48khz : std_logic_vector(23 downto 0) := (others => '0');
signal right_sample_48khz : std_logic_vector(23 downto 0):= (others => '0');
signal left_sample_96khz : std_logic_vector(23 downto 0) := (others => '0');
signal right_sample_96khz : std_logic_vector(23 downto 0) := (others => '0');

component I2S_in is
  Port (    clk : in std_logic;
            reset : in std_logic;
            
            r_sclk: out std_logic;
            r_mclk: out std_logic;
            r_lrclk: out std_logic;
            r_data: out std_logic;
            left_reg_output : out std_logic_vector(23 downto 0);
            right_reg_output : out std_logic_vector(23 downto 0)
            );
end component;

component I2S_out is
  Port (    clk : in std_logic;
            reset : in std_logic;
            right_reg_shift : in std_logic_vector(23 downto 0);
            left_reg_shift : in std_logic_vector(23 downto 0);
            
            t_sclk: out std_logic;
            t_mclk: out std_logic;
            t_lrclk: out std_logic;
            t_data: out std_logic
            );
end component;

begin
reset_s <= reset;
--assinments for I2S_in

--assinments for I2S_out
--left_reg_shift_c <= left_reg_output;
--right_reg_shift_c <= right_reg_output;
I2s_o : I2S_out port map (
    clk => clk,
    reset => reset_s,
    right_reg_shift => right_reg_shift_c,
    left_reg_shift => left_reg_shift_c,
    
    t_sclk => sclk_s,
    t_mclk => mclk_s,
    t_lrclk => lrclk_s,
    t_data => t_data
    );
I2s_i : I2S_in port map (
    clk => clk,--assined to top clk
    reset => reset, --assined to top reset
    
    r_sclk => r_sclk,
    r_mclk => r_mclk,
    r_lrclk => r_lrclk,
    r_data => r_data, --update in I2S in to take serial data in instead of blk_mem
    
    left_reg_output => left_reg_shift_c,
    right_reg_output => right_reg_shift_c
);

end Behavioral;
