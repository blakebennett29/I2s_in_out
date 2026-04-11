library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tb_Modulator is
end tb_Modulator;

architecture Behavioral of tb_Modulator is

    --------------------------------------------------------------------------
    -- DUT signals
    --------------------------------------------------------------------------
    signal clk              : std_logic := '0';
    signal reset            : std_logic := '0';

    signal left_input_L1_H  : std_logic_vector(31 downto 0) := (others => '0');
    signal right_input_L1_H : std_logic_vector(31 downto 0) := (others => '0');
    signal left_input_L1_L  : std_logic_vector(31 downto 0) := (others => '0');
    signal right_input_L1_L : std_logic_vector(31 downto 0) := (others => '0');

    signal Env_fol_in_H_L_1 : std_logic_vector(16 downto 0) := (others => '0');
    signal Env_fol_in_L_L_1 : std_logic_vector(16 downto 0) := (others => '0');

    signal in_valid_l       : std_logic := '0';
    signal m_tvalid_in      : std_logic := '0';

    signal Mod_valid_out    : std_logic;
    signal left_output_L1_H : std_logic_vector(31 downto 0);
    signal right_output_L1_H: std_logic_vector(31 downto 0);
    signal left_output_L1_L : std_logic_vector(31 downto 0);
    signal right_output_L1_L: std_logic_vector(31 downto 0);

    constant CLK_PERIOD : time := 10 ns;

begin

    --------------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------------
    DUT: entity work.Modulator
        port map (
            clk              => clk,
            reset            => reset,

            left_input_L1_H  => left_input_L1_H,
            right_input_L1_H => right_input_L1_H,
            left_input_L1_L  => left_input_L1_L,
            right_input_L1_L => right_input_L1_L,

            Env_fol_in_H_L_1 => Env_fol_in_H_L_1,
            Env_fol_in_L_L_1 => Env_fol_in_L_L_1,

            in_valid_l       => in_valid_l,
            m_tvalid_in      => m_tvalid_in,

            Mod_valid_out    => Mod_valid_out,
            left_output_L1_H => left_output_L1_H,
            right_output_L1_H=> right_output_L1_H,
            left_output_L1_L => left_output_L1_L,
            right_output_L1_L=> right_output_L1_L
        );

    --------------------------------------------------------------------------
    -- Clock
    --------------------------------------------------------------------------
    clk <= not clk after CLK_PERIOD/2;

    --------------------------------------------------------------------------
    -- Stimulus
    --------------------------------------------------------------------------
    stim_proc: process
    begin
        ----------------------------------------------------------------------
        -- Reset
        ----------------------------------------------------------------------
        reset <= '1';
        wait for 4*CLK_PERIOD;
        reset <= '0';
        wait for 2*CLK_PERIOD;

        ----------------------------------------------------------------------
        -- Test 1: 0.5 gain
        -- ufixed(-1 downto -17):
        -- bit -1 = 0.5
        -- so "10000000000000000" = 0.5
        ----------------------------------------------------------------------
        Env_fol_in_H_L_1 <= "10000000000000000";  -- 0.5
        Env_fol_in_L_L_1 <= "10000000000000000";  -- 0.5

        -- High band inputs
        left_input_L1_H  <= std_logic_vector(to_signed(100000, 32));
        right_input_L1_H <= std_logic_vector(to_signed(-80000, 32));

        -- Low band inputs
        left_input_L1_L  <= std_logic_vector(to_signed(40000, 32));
        right_input_L1_L <= std_logic_vector(to_signed(-20000, 32));

        -- pulse valid for one clock
        wait until rising_edge(clk);
        in_valid_l <= '1';
        wait until rising_edge(clk);
        in_valid_l <= '0';

        -- wait for DUT output valid
        wait until rising_edge(clk) and Mod_valid_out = '1';

        ----------------------------------------------------------------------
        -- Test 2: near full gain
        ----------------------------------------------------------------------
        wait for 3*CLK_PERIOD;

        Env_fol_in_H_L_1 <= "11111111111111111";  -- ~1.0
        Env_fol_in_L_L_1 <= "01000000000000000";  -- 0.25

        left_input_L1_H  <= std_logic_vector(to_signed(120000, 32));
        right_input_L1_H <= std_logic_vector(to_signed(-120000, 32));

        left_input_L1_L  <= std_logic_vector(to_signed(60000, 32));
        right_input_L1_L <= std_logic_vector(to_signed(-60000, 32));

        wait until rising_edge(clk);
        in_valid_l <= '1';
        wait until rising_edge(clk);
        in_valid_l <= '0';

        wait until rising_edge(clk) and Mod_valid_out = '1';

        ----------------------------------------------------------------------
        -- End
        ----------------------------------------------------------------------
        wait for 5*CLK_PERIOD;
        assert false report "Simulation finished." severity failure;
    end process;

end Behavioral;