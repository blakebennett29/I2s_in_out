

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_INTERPOLATE_AA is
end entity;

architecture sim of tb_INTERPOLATE_AA is

    signal clk              : std_logic := '0';
    signal reset            : std_logic := '0';

    signal data_in_left     : std_logic_vector(31 downto 0) := (others => '0');
    signal data_in_right    : std_logic_vector(31 downto 0) := (others => '0');
    signal left_valid_in    : std_logic := '0';
    signal right_valid_in   : std_logic := '0';
    signal m_tdata_valid_in : std_logic := '0';

    signal m_tdata_valid_out : std_logic;
    signal data_out_left     : std_logic_vector(31 downto 0);
    signal data_out_right    : std_logic_vector(31 downto 0);

    constant T_CLK : time := 10.173 ns;  -- about 98.304 MHz

begin

    clk <= not clk after T_CLK/2;

    uut : entity work.INTERPOLATE_AA
        port map (
            clk               => clk,
            reset             => reset,
            data_in_left      => data_in_left,
            data_in_right     => data_in_right,
            left_valid_in     => left_valid_in,
            right_valid_in    => right_valid_in,
            m_tdata_valid_in  => m_tdata_valid_in,
            m_tdata_valid_out => m_tdata_valid_out,
            data_out_left     => data_out_left,
            data_out_right    => data_out_right
        );

    stim : process
    begin
        ----------------------------------------------------------------------
        -- reset
        ----------------------------------------------------------------------
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait for 10*T_CLK;

        ----------------------------------------------------------------------
        -- sample pair 1
        ----------------------------------------------------------------------
        data_in_left      <= x"00010000";
        data_in_right     <= x"00000000";
        left_valid_in     <= '1';
        right_valid_in    <= '1';
        m_tdata_valid_in  <= '1';
        wait for T_CLK;

        left_valid_in     <= '0';
        right_valid_in    <= '0';
        m_tdata_valid_in  <= '0';
        wait for 40*T_CLK;

        ----------------------------------------------------------------------
        -- sample pair 2
        ----------------------------------------------------------------------
        data_in_left      <= x"00000000";
        data_in_right     <= x"00020000";
        left_valid_in     <= '1';
        right_valid_in    <= '1';
        m_tdata_valid_in  <= '1';
        wait for T_CLK;

        left_valid_in     <= '0';
        right_valid_in    <= '0';
        m_tdata_valid_in  <= '0';
        wait for 40*T_CLK;

        ----------------------------------------------------------------------
        -- sample pair 3
        ----------------------------------------------------------------------
        data_in_left      <= x"FFFF0000";
        data_in_right     <= x"00008000";
        left_valid_in     <= '1';
        right_valid_in    <= '1';
        m_tdata_valid_in  <= '1';
        wait for T_CLK;

        left_valid_in     <= '0';
        right_valid_in    <= '0';
        m_tdata_valid_in  <= '0';
        wait for 60*T_CLK;

        ----------------------------------------------------------------------
        -- done
        ----------------------------------------------------------------------
        assert false report "Simulation finished." severity failure;
    end process;

end architecture;