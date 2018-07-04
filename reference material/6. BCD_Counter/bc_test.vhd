-- binary counter testbench

library ieee;
use ieee.std_logic_1164.all;

entity bc_test is
end bc_test;

architecture testbench of bc_test is

component binary_counter
	port
	(
		din: in std_logic_vector(7 downto 0);
		clk, load: in std_logic;
		dout: out std_logic_vector(7 downto 0)
	);
end component;

signal tdin, tdout: std_logic_vector(7 downto 0);
signal tclk, tload: std_logic;



begin
	connect: binary_counter port map(din=>tdin, clk=>tclk, load=>tload, dout=>tdout);

	process
	begin
		tdin <= "00000010";
		-- the various value castings
		tclk <= '0';
		tload <= '0';
		wait for 50 ns;
		
		tclk <= '1';
		tload <= '1';
		wait for 50 ns;
		
		tclk <= '0';
		tload <= '0';
		wait for 50 ns;
		
		tclk <= '1';
		tload <= '0';
		wait for 50 ns;
		
		tclk <= '0';
		tload <= '0';
		wait for 50 ns;
		
		tclk <= '1';
		tload <= '0';
		wait for 50 ns;
		
		tclk <= '0';
		tload <= '0';
		wait for 50 ns;
		
		tclk <= '1';
		tload <= '0';
		wait for 50 ns;
	end process;
end testbench;