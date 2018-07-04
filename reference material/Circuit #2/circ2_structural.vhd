-- structural design of circuit 2
-- using the and2 and or2 components

library ieee;
use ieee.std_logic_1164.all;

entity circ2 is
	port
	(
		a, b, c: in std_logic;
		q: out std_logic
	);
end circ2;

architecture structural of circ2 is

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
	
	signal sig1, sig2, sig3, sig4: std_logic;
	
	begin
		unit1: and2 port map(a, b, sig1);
		unit2: or2 port map(b, c, sig2);
		unit3: and2 port map(b, c, sig3);
		unit4: and2 port map(sig2, sig3, sig4);
		unit5: or2 port map(sig1, sig4, q);
end structural;