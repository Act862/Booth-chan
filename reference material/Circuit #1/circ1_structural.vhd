-- the upper level of circ1

library ieee;
use ieee.std_logic_1164.all;

entity circ1 is
	port
	(
		a, b, c, d: in std_logic;
		q: out std_logic
	);
end circ1;

architecture structural of circ1 is
	component and2not
		port
		(
			i1, i2, i3: in std_logic;
			x: out std_logic
		);
	end component;
	
	component nor3
		port
		(
			i1, i2, i3: in std_logic;
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
	signal sig1, sig2: std_logic;
	
	begin
		unit1: and2not port map(a, b, c, sig1);
		unit2: nor3 port map(b, c, d, sig2);
		unit3: or2 port map(sig1, sig2, q);
end structural;