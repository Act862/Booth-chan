-- circuit 7 in dataflow design

library ieee;
use ieee.std_logic_1164.all;

entity circ7 is
	port
	(
		a, b: in std_logic;
		o1, o2: out std_logic
	);
end circ7;

architecture dataflow of circ7 is
	signal sig0, sig1, sig2, sig3, sig4: std_logic;
	begin
		sig0 <= a nand b;
		sig1 <= a nand a;
		sig2 <= b nand b;
		sig3 <= sig1 nand sig2;
		o1 <= sig0 nand sig0;
		sig4 <= sig0 nand sig3;
		o2 <= sig4 nand sig4;
end dataflow;
		