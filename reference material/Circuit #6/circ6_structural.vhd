-- circuit 6 structural design

library ieee;
use ieee.std_logic_1164.all;

entity circ6 is
	port
	(
		a, b, c, d: in std_logic;
		e: out std_logic
	);
end circ6;

architecture structural of circ6 is
	component nor2
		port
		(
			i1, i2: in std_logic;
			o1: out std_logic
		);
	end component;
	
	component and2
		port
		(
			i1, i2: in std_logic;
			o1: out std_logic
		);
	end component;
	
	component and2of1not
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
	
	signal sig0, sig1, sig2: std_logic;
	
	begin
		unit1: nor2 port map(b, c, sig0);
		unit2: and2 port map(a, sig0, sig1);
		unit3: and2of1not port map(d, sig0, sig2);
		unit4: or2 port map(sig1, sig2, e);
end structural;