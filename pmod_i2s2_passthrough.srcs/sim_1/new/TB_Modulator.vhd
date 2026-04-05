----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/02/2026 09:39:36 PM
-- Design Name: 
-- Module Name: TB_Modulator - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- Testbench for Modulator
-- 
-- Dependencies: 
-- Modulator.vhd
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- Drives several test cases into the Modulator and reports outputs.
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity TB_Modulator is
end TB_Modulator;

architecture Behavioral of TB_Modulator is

    --------------------------------------------------------------------------
    -- DUT declaration
    --------------------------------------------------------------------------
    component Modulator
        Port (
            clk               : in  std_logic;
            reset             : in  std_logic;

            left_input_L1_H   : in  std_logic_vector(31 downto 0);
            right_input_L1_H  : in  std_logic_vector(31 downto 0);
            left_input_L1_L   : in  std_logic_vector(31 downto 0);
            right_input_L1_L  : in  std_logic_vector(31 downto 0);
            Env_fol_in        : in  std_logic_vector(16 downto 0);
            m_tvalid_in       : in  std_logic;

            left_output_L1_H  : out std_logic_vector(31 downto 0);
            right_output_L1_H : out std_logic_vector(31 downto 0);
            left_output_L1_L  : out std_logic_vector(31 downto 0);
            right_output_L1_L : out std_logic_vector(31 downto 0)
        );
    end component;

    --------------------------------------------------------------------------
    -- Signals
    --------------------------------------------------------------------------
    signal clk               : std_logic := '0';
    signal reset             : std_logic := '0';

    signal left_input_L1_H   : std_logic_vector(31 downto 0) := (others => '0');
    signal right_input_L1_H  : std_logic_vector(31 downto 0) := (others => '0');
    signal left_input_L1_L   : std_logic_vector(31 downto 0) := (others => '0');
    signal right_input_L1_L  : std_logic_vector(31 downto 0) := (others => '0');
    signal Env_fol_in        : std_logic_vector(16 downto 0) := (others => '0');
    signal m_tvalid_in       : std_logic := '0';

    signal left_output_L1_H  : std_logic_vector(31 downto 0);
    signal right_output_L1_H : std_logic_vector(31 downto 0);
    signal left_output_L1_L  : std_logic_vector(31 downto 0);
    signal right_output_L1_L : std_logic_vector(31 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin

    --------------------------------------------------------------------------
    -- DUT instantiation
    --------------------------------------------------------------------------
    uut: Modulator
        port map (
            clk               => clk,
            reset             => reset,
            left_input_L1_H   => left_input_L1_H,
            right_input_L1_H  => right_input_L1_H,
            left_input_L1_L   => left_input_L1_L,
            right_input_L1_L  => right_input_L1_L,
            Env_fol_in        => Env_fol_in,
            m_tvalid_in       => m_tvalid_in,
            left_output_L1_H  => left_output_L1_H,
            right_output_L1_H => right_output_L1_H,
            left_output_L1_L  => left_output_L1_L,
            right_output_L1_L => right_output_L1_L
        );

    --------------------------------------------------------------------------
    -- Clock generation
    --------------------------------------------------------------------------
    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for CLK_PERIOD/2;
            clk <= '1';
            wait for CLK_PERIOD/2;
        end loop;
    end process;

    --------------------------------------------------------------------------
    -- Stimulus process
    --------------------------------------------------------------------------
    stim_proc : process
    begin
        ----------------------------------------------------------------------
        -- Reset
        ----------------------------------------------------------------------
        report "Starting simulation";

        reset <= '1';
        m_tvalid_in <= '0';
        left_input_L1_H  <= (others => '0');
        right_input_L1_H <= (others => '0');
        left_input_L1_L  <= (others => '0');
        right_input_L1_L <= (others => '0');
        Env_fol_in       <= (others => '0');

        wait for 4 * CLK_PERIOD;
        reset <= '0';
        wait for 2 * CLK_PERIOD;

        ----------------------------------------------------------------------
        -- TEST 1
        -- Positive inputs, envelope about 0.5
        ----------------------------------------------------------------------
        report "TEST 1";

        left_input_L1_H  <= std_logic_vector(to_signed(100000, 32));
        right_input_L1_H <= std_logic_vector(to_signed( 80000, 32));
        left_input_L1_L  <= std_logic_vector(to_signed( 60000, 32));
        right_input_L1_L <= std_logic_vector(to_signed( 40000, 32));

        -- about +0.5 in your 18-bit envelope format
        Env_fol_in <= "10000000000000000";

        m_tvalid_in <= '1';
        wait for CLK_PERIOD;
        m_tvalid_in <= '0';

        -- your FSM needs a few clocks:
        -- IDLE -> MODULATE -> OUTPUT_STATE -> IDLE
        wait for 4 * CLK_PERIOD;

        report "TEST 1 outputs:";
        report "left_output_L1_H  = " & integer'image(to_integer(signed(left_output_L1_H)));
        report "right_output_L1_H = " & integer'image(to_integer(signed(right_output_L1_H)));
        report "left_output_L1_L  = " & integer'image(to_integer(signed(left_output_L1_L)));
        report "right_output_L1_L = " & integer'image(to_integer(signed(right_output_L1_L)));

        ----------------------------------------------------------------------
        -- TEST 2
        -- Mixed positive and negative, envelope about 0.25
        ----------------------------------------------------------------------
        report "TEST 2";

        left_input_L1_H  <= std_logic_vector(to_signed( 120000, 32));
        right_input_L1_H <= std_logic_vector(to_signed(-120000, 32));
        left_input_L1_L  <= std_logic_vector(to_signed(  50000, 32));
        right_input_L1_L <= std_logic_vector(to_signed( -50000, 32));

        -- about +0.25
        Env_fol_in <= "01000000000000000";

        m_tvalid_in <= '1';
        wait for CLK_PERIOD;
        m_tvalid_in <= '0';

        wait for 4 * CLK_PERIOD;

        report "TEST 2 outputs:";
        report "left_output_L1_H  = " & integer'image(to_integer(signed(left_output_L1_H)));
        report "right_output_L1_H = " & integer'image(to_integer(signed(right_output_L1_H)));
        report "left_output_L1_L  = " & integer'image(to_integer(signed(left_output_L1_L)));
        report "right_output_L1_L = " & integer'image(to_integer(signed(right_output_L1_L)));

        ----------------------------------------------------------------------
        -- TEST 3
        -- Zero envelope
        ----------------------------------------------------------------------
        report "TEST 3";

        left_input_L1_H  <= std_logic_vector(to_signed(200000, 32));
        right_input_L1_H <= std_logic_vector(to_signed(150000, 32));
        left_input_L1_L  <= std_logic_vector(to_signed(100000, 32));
        right_input_L1_L <= std_logic_vector(to_signed( 50000, 32));

        Env_fol_in <= (others => '0');

        m_tvalid_in <= '1';
        wait for CLK_PERIOD;
        m_tvalid_in <= '0';

        wait for 4 * CLK_PERIOD;

        report "TEST 3 outputs:";
        report "left_output_L1_H  = " & integer'image(to_integer(signed(left_output_L1_H)));
        report "right_output_L1_H = " & integer'image(to_integer(signed(right_output_L1_H)));
        report "left_output_L1_L  = " & integer'image(to_integer(signed(left_output_L1_L)));
        report "right_output_L1_L = " & integer'image(to_integer(signed(right_output_L1_L)));

        ----------------------------------------------------------------------
        -- TEST 4
        -- Change inputs, but valid low, outputs should hold
        ----------------------------------------------------------------------
        report "TEST 4";

        left_input_L1_H  <= std_logic_vector(to_signed(777777, 32));
        right_input_L1_H <= std_logic_vector(to_signed(666666, 32));
        left_input_L1_L  <= std_logic_vector(to_signed(555555, 32));
        right_input_L1_L <= std_logic_vector(to_signed(444444, 32));
        Env_fol_in       <= "10000000000000000";

        m_tvalid_in <= '0';

        wait for 5 * CLK_PERIOD;

        report "TEST 4 outputs:";
        report "left_output_L1_H  = " & integer'image(to_integer(signed(left_output_L1_H)));
        report "right_output_L1_H = " & integer'image(to_integer(signed(right_output_L1_H)));
        report "left_output_L1_L  = " & integer'image(to_integer(signed(left_output_L1_L)));
        report "right_output_L1_L = " & integer'image(to_integer(signed(right_output_L1_L)));

        ----------------------------------------------------------------------
        -- TEST 5
        -- Small values, envelope about 0.75
        ----------------------------------------------------------------------
        report "TEST 5";

        left_input_L1_H  <= std_logic_vector(to_signed( 1000, 32));
        right_input_L1_H <= std_logic_vector(to_signed(-1000, 32));
        left_input_L1_L  <= std_logic_vector(to_signed( 2000, 32));
        right_input_L1_L <= std_logic_vector(to_signed(-2000, 32));

        -- about +0.75
        Env_fol_in <= "11000000000000000";

        m_tvalid_in <= '1';
        wait for CLK_PERIOD;
        m_tvalid_in <= '0';

        wait for 4 * CLK_PERIOD;

        report "TEST 5 outputs:";
        report "left_output_L1_H  = " & integer'image(to_integer(signed(left_output_L1_H)));
        report "right_output_L1_H = " & integer'image(to_integer(signed(right_output_L1_H)));
        report "left_output_L1_L  = " & integer'image(to_integer(signed(left_output_L1_L)));
        report "right_output_L1_L = " & integer'image(to_integer(signed(right_output_L1_L)));

        report "Simulation complete";
        wait;
    end process;

end Behavioral;