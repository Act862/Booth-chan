-- comparator for the alu
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity comparator is
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		res: out std_logic_vector(7 downto 0);
		c: out std_logic_vector(1 downto 0)
	);
end comparator;

architecture structural of comparator is

component substructor
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		cin: in std_logic;
		sum: inout std_logic_vector(7 downto 0)
	);
end component;

signal output: std_logic_vector(7 downto 0);

begin
	connect: substructor port map(a, b, '0', output);
	
	process(output)
	begin
		if(unsigned(output) = 0) then
			c <= "11";
		elsif (unsigned(output) <= unsigned(a)) then
			c <= "10";
		elsif (unsigned(output) > unsigned(a)) then
			c <= "01";
		end if;
	end process;
	res <= output;
end structural;
			