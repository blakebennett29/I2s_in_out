library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_AA_Interpolation_48khz is
end entity;

architecture sim of tb_AA_Interpolation_48khz is

    signal clk              : std_logic := '0';
    signal reset            : std_logic := '0';

    signal data_in_left     : std_logic_vector(31 downto 0) := (others => '0');
    signal data_in_right    : std_logic_vector(31 downto 0) := (others => '0');
    signal left_valid_in    : std_logic := '0';
    signal right_valid_in   : std_logic := '0';
    signal m_tdata_valid_in : std_logic := '0';

    signal data_out_left    : std_logic_vector(23 downto 0);
    signal data_out_right   : std_logic_vector(23 downto 0);

    constant T_CLK : time := 10.173 ns;  -- about 98.304 MHz
    constant LEFT_WORD : std_logic_vector(31 downto 0) := x"00040000";

begin

    --------------------------------------------------------------------------
    -- clock
    --------------------------------------------------------------------------
    clk <= not clk after T_CLK/2;

    --------------------------------------------------------------------------
    -- DUT
    --------------------------------------------------------------------------
    uut : entity work.AA_Interpolation_48khz
        port map (
            clk              => clk,
            reset            => reset,
            data_in_left     => data_in_left,
            data_in_right    => data_in_right,
            left_valid_in    => left_valid_in,
            right_valid_in   => right_valid_in,
            m_tdata_valid_in => m_tdata_valid_in,
            data_out_left    => data_out_left,
            data_out_right   => data_out_right
        );

    --------------------------------------------------------------------------
    -- stimulus
    --------------------------------------------------------------------------
    stim : process
    begin
        ----------------------------------------------------------------------
        -- reset
        ----------------------------------------------------------------------
        reset <= '1';
        data_in_left      <= (others => '0');
        data_in_right     <= (others => '0');
        left_valid_in     <= '0';
        right_valid_in    <= '0';
        m_tdata_valid_in  <= '0';

        wait for 100 ns;
        reset <= '0';
        wait for 10*T_CLK;

        ----------------------------------------------------------------------
        -- one LEFT input word only
        -- valid is a 1-clock pulse
        -- data itself stays present for 511 clk cycles
        ----------------------------------------------------------------------
        data_in_left      <= LEFT_WORD;
        data_in_right     <= x"00000000";
        left_valid_in     <= '1';
        right_valid_in    <= '0';
        m_tdata_valid_in  <= '1';
        wait until rising_edge(clk);

        -- drop valid after one clock pulse
        m_tdata_valid_in  <= '0';
        left_valid_in     <= '0';

        -- keep the left word sitting on the input for 511 more clocks
        for i in 1 to 511 loop
            wait until rising_edge(clk);
        end loop;

        ----------------------------------------------------------------------
        -- clear inputs
        ----------------------------------------------------------------------
        data_in_left      <= (others => '0');
        data_in_right     <= (others => '0');
        right_valid_in    <= '0';

        ----------------------------------------------------------------------
        -- let pipeline flush
        ----------------------------------------------------------------------
        wait for 2000*T_CLK;

    end process;

end architecture;