-- circuit 2

library ieee;
use ieee.std_logic_1164.all;

entity circ2 is
	port
	(
		a, b, c: in std_logic;
		q: out std_logic
	);
end circ2;

architecture dataflow of circ2 is
	begin
		q <= (a and b) or ((b or c) and (b and c));
end dataflow;