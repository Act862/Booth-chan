-- structural design of circuit 7
library ieee;
use ieee.std_logic_1164.all;

entity circ7 is
	port
	(
		a, b: in std_logic;
		o1, o2: out std_logic
	);
end circ7;

architecture structural of circ7 is
	component nand2
		port
		(
			i1, i2: in std_logic;
			o1: out std_logic
		);
	end component;
	
	signal sig0,sig1, sig2, sig3, sig4: std_logic;
	
	begin
		unit1: nand2 port map(a, b, sig0);
		unit2: nand2 port map(a, a, sig1);
		unit3: nand2 port map(b, b, sig2);
		unit4: nand2 port map(sig1, sig2, sig3);
		unit5: nand2 port map(sig0, sig0, o1);
		unit6: nand2 port map(sig3, sig0, sig4);
		unit7: nand2 port map(sig4, sig4, o2);
end structural;