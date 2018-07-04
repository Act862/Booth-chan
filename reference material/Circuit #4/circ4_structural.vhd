-- the 4th circuit uses the same gates as the 3rd, except the or-gate
-- this means that I have to just make the new structural design
-- based on the already existent gates

library ieee;
use ieee.std_logic_1164.all;

entity circ4 is
	port
	(
		a, b, c: in std_logic;
		y: out std_logic
	);
end circ4;

architecture structural of circ4 is
	component and2
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
	
	signal sig1, sig2, sig3, sig4: std_logic;
	
	begin
		unit1: and2 port map(a, b, sig1);
		unit2: not1 port map(sig1, sig2);
		unit3: not1 port map(c, sig3);
		unit4: not1 port map(sig3, sig4);
		unit5: and2 port map(sig2, sig4, y);
end structural;