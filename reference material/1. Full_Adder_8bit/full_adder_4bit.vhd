-- work package #2, full-adder part
-- the top level is at last here

library ieee;
use ieee.std_logic_1164.all;

entity full_adder_4bit is
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		cin: in std_logic;
		sum: out std_logic_vector(4 downto 0);
		carry: inout std_logic
	);
end full_adder_4bit;

architecture structural of full_adder_4bit is

-- component declarations
component full_adder
	port
	(
		a, b, cin: in std_logic;
		sum, carry: out std_logic
	);
end component;
-- signal declarations
signal sig0, sig1, sig2: std_logic;

-- start the connection of components, the structural design
begin
	phase1: full_adder port map(a(0), b(0), cin, sum(0), sig0);
	phase2: full_adder port map(a(1), b(1), sig0, sum(1), sig1);
	phase3: full_adder port map(a(2), b(2), sig1, sum(2), sig2);
	phase4: full_adder port map(a(3), b(3), sig2, sum(3), carry);
	sum(4) <= carry;
end structural;