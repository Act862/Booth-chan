-- binary complement

library ieee;
use ieee.std_logic_1164.all;

entity complement is
	port
	(
		i1: in std_logic_vector(7 downto 0);
--		overflow: inout std_logic;
		o1: inout std_logic_vector(7 downto 0)
	);
end complement;

architecture structural of complement is

component cla_adder
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		cin: in std_logic;
		sum: inout std_logic_vector(7 downto 0);
		cout: inout std_logic
	);
end component;

signal temp: std_logic_vector(7 downto 0);
signal one: std_logic_vector(7 downto 0);
signal temp2: std_logic;

begin
	temp <= not(i1);
	one <= "00000001";
	
	connect: cla_adder port map(temp, one, '0', o1, temp2);
end structural;