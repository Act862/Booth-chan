-- subtractor

library ieee;
use ieee.std_logic_1164.all;

entity subtractor is
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		cin: in std_logic;
		sum: inout std_logic_vector(7 downto 0)
--		cout: inout std_logic
	);
end subtractor;

architecture structural of subtractor is 

component cla_adder
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		cin: std_logic;
		sum: inout std_logic_vector(7 downto 0);
		cout: inout std_logic
	);
end component;

component complement
	port
	(
		i1: in std_logic_vector(7 downto 0);
		o1: inout std_logic_vector(7 downto 0)
	);
end component;

signal c_b: std_logic_vector(7 downto 0);
signal ignored: std_logic;

begin
	connect: complement port map(b, c_b);
	connect2: cla_adder port map(a, c_b, cin, sum, ignored);
end structural;