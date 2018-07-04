library ieee;
use ieee.std_logic_1164.all;

entity circ6 is
	port
	(
		a, b, c, d: in std_logic;
		e: out std_logic
	);
end circ6;

architecture dataflow of circ6 is
	signal sig0, sig1, sig2: std_logic;
	begin
		sig0 <= not(b or c);
		sig1 <= sig0 and a;
		sig2 <= sig0 and not(d);
		e <= sig1 or sig2;
end dataflow;