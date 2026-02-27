
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/26/2026 01:35:46 PM
-- Design Name: 
-- Module Name: tb_TOP - Behavioral
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

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;


entity tb_TOP is

end entity;

architecture sim of tb_TOP is
  ---------------------------------------------------------------------------
  -- DUT ports / signals
  ---------------------------------------------------------------------------
  signal clk     : std_logic := '0';
  signal reset   : std_logic := '0';

  -- Receiver-side (TOP outputs)
  signal r_sclk  : std_logic;
  signal r_mclk  : std_logic;
  signal r_lrclk : std_logic;

  -- Receiver data into TOP (TOP input)
  signal r_data  : std_logic := '0';

  -- Transmitter-side (TOP outputs)
  signal t_sclk  : std_logic;
  signal t_mclk  : std_logic;
  signal t_lrclk : std_logic;
  signal t_data  : std_logic;

  
  signal right_reg_output : std_logic_vector(23 downto 0);
  signal left_reg_output : std_logic_vector(23 downto 0);
  constant T_CLK : time := 10 ns; -- 100 MHz
begin

  -- 100 MHz clock generator
  clk <= not clk after T_CLK/2;

  -- DUT instantiation
  uut: entity work.TOP
    port map (
      clk   => clk,
      reset => reset,
      r_sclk => r_sclk,
      r_mclk => r_mclk,
      r_lrclk => r_lrclk,
      r_data => r_data,
        
      t_sclk => t_sclk,
      t_mclk => t_mclk,
      t_lrclk => t_lrclk,
      t_data => t_data
    );

  -- Reset stimulus + runtime control
  stim: process
  begin
    -- apply reset
    reset <= '1';
    wait for 100 ns;
    reset <= '0';

    -- run simulation long enough to observe mclk toggles
    wait for 150 us;

    -- end sim
    assert false report "Simulation finished." severity failure;
  end process;

  -- Optional: measure mclk half-period (time between toggles)
  monitor: process
    variable t_last : time := 0 ns;
  begin
    wait until r_mclk'event;  -- any toggle
    if t_last /= 0 ns then
      report "r_mclk toggle dt = " & time'image(now - t_last);
    end if;
    t_last := now;
  end process;

end architecture;

