-- testbench for clk enable siso reg 8 bit!
library ieee;
use ieee.std_logic_1164.all;

entity siso_enable_tb is
end siso_enable_tb;

architecture testbench of siso_enable_tb is

-- component declarations
component siso_enable
	port
	(
		clk, clk_enable, si: in std_logic;
		so: out std_logic
	);
end component;

-- signal declarations
signal tclk , tclk_enable, tsi, tso: std_logic;

-- start the testbench code
begin
	connect: siso_enable port map(clk => tclk, clk_enable => tclk_enable, si => tsi, so => tso);
	
	process
	begin
		-- first test
		tclk <= '0';
		tclk_enable <= '1';	-- even if its enable, it won't do anything, since it is surely on negative_edge
		tsi <= '1';
		wait for 100 ns;
		
		tclk <= '1';
		tclk_enable <= '1';
		tsi <= '1';
		wait for 100 ns;
		
		tclk <= '0';
		tclk_enable <= '1';
		tsi <= '0';
		wait for 100 ns;
		
		tclk <= '1';
		tclk_enable <= '0';
		tsi <= '1';
		wait for 100 ns;
		
		tclk <= '0';
		tclk_enable <= '0';
		tsi <= '1';
		wait for 100 ns;
		
		tclk <= '1';
		tclk_enable <= '1';
		tsi <= '1';
		wait for 100 ns;
		
		tclk <= '0';
		tclk_enable <= '1';
		tsi <= '0';
		wait for 100 ns;
	end process;
end testbench;