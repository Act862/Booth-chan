-- circ5 structural design

library ieee;
use ieee.std_logic_1164.all;

entity circ5 is
	port
	(
		a0, a1: in std_logic;
		d0, d1, d2, d3: out std_logic
	);
end circ5;

architecture structural of circ5 is
	component not1
		port
		(
			i1: in std_logic;
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
	
	signal sig0, sig1: std_logic;
	
	begin
		unit1: not1 port map(a0, sig0);
		unit2: not1 port map(a1, sig1);
		unit3: and2 port map(sig0, sig1, d0);
		unit4: and2 port map(a0, sig1, d1);
		unit5: and2 port map(sig0, a1, d2);
		unit6: and2 port map(a0, a1, d3);
end structural;