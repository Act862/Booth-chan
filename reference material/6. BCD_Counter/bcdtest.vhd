-- the testbench for the BCD Counter 8-bit

library ieee;
use ieee.std_logic_1164.all;

entity bcdc8 is
end bcdc8;

architecture testbench of bcdc8 is

component counter
	port
	(
		clock_enable, clock, reset: in std_logic;
		output: out std_logic_vector(7 downto 0)
	);
end component;

signal ce, clk, r: std_logic;
signal ou: std_logic_vector(7 downto 0);

begin
	connect: counter port map(clock_enable=>ce, clock=>clk, reset=>r, output=>ou);
	
	process
	begin
		clk <= '0';
		ce <= '0';
		r <= '1';
		wait for 100 ns;
		
		clk <= '1';
		ce <= '0';
		r <= '0';
		wait for 100 ns;
		
		clk <= '0';
		ce <= '1';
		r <= '0';
		wait for 100 ns;
		
		clk <= '1';
		ce <= '0';
		r <= '0';
		wait for 100 ns;
		
		clk <= '0';
		ce <= '1';
		r <= '0';
		wait for 100 ns;
		
		clk <= '1';
		ce <= '1';
		r <= '0';
		wait for 100 ns;
		
		clk <= '0';
		ce <= '0';
		r <= '0';
		wait for 100 ns;
		
		clk <= '1';
		ce <= '1';
		r <= '1';
		wait for 100 ns;
	end process;
end testbench;