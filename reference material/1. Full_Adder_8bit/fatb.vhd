-- testbench for full_adder_4bit
library ieee;
use ieee.std_logic_1164.all;

entity fatb is
end fatb;

architecture testbench of fatb is
component full_adder_4bit
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		cin: in std_logic;
		sum: out std_logic_vector(4 downto 0);
		carry: inout std_logic
	);
end component;

signal ta, tb: std_logic_vector(3 downto 0);
signal tcin, tcarry: std_logic;
signal tsum: std_logic_vector(4 downto 0);

begin
	connect: full_adder_4bit port map(a=>ta, b=>tb, cin=>tcin, sum=>tsum, carry=>tcarry);
	
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
		