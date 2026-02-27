----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2026 12:36:52 PM
-- Design Name: 
-- Module Name: Down_Sample - Behavioral
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

entity Down_Sample is
port (
    clk : in std_logic;
    reset : in std_logic;
    --------------------------------------------------------------------------
    -- Downsampled sample outputs (simple decimate-by-N of the captured 96k stream)
    -- Format: 32-bit word per channel (your choice: left-justified 24-bit in [31:8])
    --------------------------------------------------------------------------
    ds_by2_left   : out std_logic_vector(23 downto 0);
    ds_by2_right  : out std_logic_vector(23 downto 0);
    ds_by2_valid  : out std_logic;

    ds_by4_left   : out std_logic_vector(23 downto 0);
    ds_by4_right  : out std_logic_vector(23 downto 0);
    ds_by4_valid  : out std_logic

 );
end Down_Sample;

architecture Behavioral of Down_Sample is
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
signal right_reg_output : std_logic_vector(31 downto 0) := (others =>'0');--hold for sample period
signal left_reg_output : std_logic_vector(31 downto 0) := (others =>'0');--hold for sample period
signal left_reg_shift_s : std_logic_vector(31 downto 0) := (others =>'0');--shift to output dac
signal right_reg_shift_s : std_logic_vector(31 downto 0) := (others =>'0');-- shift to ouput dac
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

signal ds48_left_s  : std_logic_vector(23 downto 0);
signal ds48_right_s : std_logic_vector(23 downto 0);
signal ds48_valid_s : std_logic;

signal ds24_left_s  : std_logic_vector(23 downto 0);
signal ds24_right_s : std_logic_vector(23 downto 0);
signal ds24_valid_s : std_logic;

signal us96_left_s  : std_logic_vector(23 downto 0)  := (others => '0');
signal us96_right_s : std_logic_vector(23 downto 0)  := (others => '0');
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
signal ds_by2_valid_s : std_logic := '0';
signal ds_by4_valid_s : std_logic := '0';

begin
ds_by2_left <= left_sample_96khz;
ds_by2_right <= right_sample_96khz;
ds_by4_left <= left_sample_48khz;
ds_by4_right <= right_sample_48khz;
ds_by2_valid <= ds_by2_valid_s;
ds_by4_valid <= ds_by4_valid_s;
    process(clk)
        begin
            if reset = '1' then
                mcnt <= 0;
                scnt <= 0;
                lrcnt <= 0;
                mclk_s  <= '0';
                sclk_s  <= '0';
                lrclk_s <= '0';
                reset_s <= '0';
                shift_Reg_load <= (others => '0');
                shift_cnt <= 0;
                state <= Idle;
                next_state <= Idle;
            elsif rising_edge(clk) then 
                state <= next_state; -- continue if reset isn't high
            --------------------------------------------------------------------
            --master clk generation
                if mcnt >= 1 then   --creating that 25mhz clk (divide the clk by 4)
                    mcnt <= 0;
                    mclk_s <= not mclk_s; --toggle the clk
                else
                    mcnt <= mcnt + 1;
                end if;
                --------------------------------------------------------------------
                --sclk generation
                if scnt >= 7 then
                    scnt <= 0;
                     -- detect the *falling* edge (about to go low 1 -> 0)
                    if sclk_s = '1' then
                        sclk_fall_pulse <= '1';
                    end if;
                    sclk_s <= not sclk_s;
                else
                    scnt <= scnt + 1;
                end if;
                --------------------------------------------------------------------
                --lrclk generation
                if lrcnt >= 511 then
                    lrcnt <= 0;
                    --not nessisary code------------
                    if lrclk_s = '0' then   --lr edge detection "rising"
                        lrclk_rise_pulse <= '1';
                    end if;
                    if lrclk_s = '1' then --"falling" edge detection
                        lrclk_fall_pulse <= '1';
                    end if;
                    
                    --block above not nessassary -------------
                    lrclk_s <= not lrclk_s;
                else
                    lrcnt <= lrcnt + 1;
                end if;

                    
                --====================================================
                -- Code for sampling every 48khz--24khz for testing-- or 1 lrclk of 96/97 khz
                --=======================================================
                -- left right clk_sampling data for 48khz
                --left register
                if lrclk_rise_pulse = '1' then --rising edge detection
                    lrclk_rise_pulse <= '0';
                    if sample_left_48khz_cnt = 3 then
                        left_sample_48khz <= left_reg(31 downto 8);
                        sample_left_48khz_cnt <= 0;
                    else
                        sample_left_48khz_cnt <= sample_left_48khz_cnt + 1;
                    end if;
                end if;
                if lrclk_fall_pulse = '1' then
                    lrclk_fall_pulse <= '0';
                    --right register
                    if sample_right_48khz_cnt = 3 then
                        right_sample_48khz <= right_reg(31 downto 8);
                        sample_right_48khz_cnt <= 0;
                    else
                        sample_right_48khz_cnt <= sample_right_48khz_cnt + 1;
                    end if;
                end if;
                --=====
                --end of 48khz clk code --24 for testing--
                --=====
                
                
                 --====================================================
                -- Code for sampling every 96khz or --48khz for testing pmod-- 1 lrclk of 96/97 khz
                --=======================================================
                -- left right clk_sampling data for 48khz
                --left register
                if lrclk_rise_pulse = '1' then --rising edge detection
                    lrclk_rise_pulse <= '0';
                    if sample_left_96khz_cnt = 1 then
                        left_sample_96khz <= left_reg(31 downto 8);
                        sample_left_96khz_cnt <= 0;
                    else
                        sample_left_96khz_cnt <= sample_left_96khz_cnt + 1;
                    end if;
                end if;
                if lrclk_fall_pulse = '1' then
                    lrclk_fall_pulse <= '0';
                    --right register
                    if sample_right_96khz_cnt = 1 then
                        right_sample_96khz <= right_reg(31 downto 8);
                        sample_right_96khz_cnt <= 0;
                    else
                        sample_right_96khz_cnt <= sample_right_96khz_cnt + 1;
                    end if;
                end if;
                
                --=====
                --end of 96khz clk code
                --===== 
                    
            end if;
            
    end process;
end Behavioral;
