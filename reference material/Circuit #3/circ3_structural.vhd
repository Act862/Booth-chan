-- structural design of circuit 3

library ieee;
use ieee.std_logic_1164.all;

entity circ3 is
	port
	(
		a, b, c: in std_logic;
		y: out std_logic
	);
end circ3;

architecture structural of circ3 is
	
	component and2
		port
		(
			i1, i2: in std_logic;
			o1: out std_logic
		);
	end component;
	
	component or2
		port
		(
			i1, i2: in std_logic;
			o1: out std_logic
		);
	end component;
	
	component not1
		port
		(
			i1: in std_logic;
			o1: out std_logic
		);
	end component;
	
	signal sig1, sig2, sig3: std_logic;
	
	begin
		unit1: and2 port map(a, b, sig1);
		unit2: not1 port map(c, sig2);
		unit3: or2 port map(sig1, sig2, sig3);
		unit4: not1 port map(sig3, y);
end structural;