-- testbench for full_adder_4bit_ha
library ieee;
use ieee.std_logic_1164.all;

entity fahatb is
end fahatb;

architecture testbench of fahatb is
component full_adder_4bit_ha
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		cin: in std_logic;
		sum: inout std_logic_vector(4 downto 0);
		carry: inout std_logic
	);
end component;

signal ta, tb: std_logic_vector(3 downto 0);
signal tcin, tcarry: std_logic;
signal tsum: std_logic_vector(4 downto 0);

begin
	connect: full_adder_4bit_ha port map(a=>ta, b=>tb, cin=>tcin, sum=>tsum, carry=>tcarry);
	
	process
	begin
	
		ta <= "0010";
		tb <= "0110";
		tcin <= '1';
		wait for 200 ns;
		
		ta <= "1111";
		tb <= "0001";
		tcin <= '0';
		wait for 200 ns;
		
		ta <= "1001";
		tb <= "0110";
		tcin <= '0';
		wait for 200 ns;
		
		ta <= "1001";
		tb <= "1001";
		tcin <= '0';
		wait for 200 ns;
	end process;
end testbench;
		