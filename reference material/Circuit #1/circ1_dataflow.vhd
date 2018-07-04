-- work package #4
-- circuit 1
-- dataflow

library ieee;
use ieee.std_logic_1164.all;

entity circ1 is
	port
	(
		a, b, c, d: in std_logic;
		q: out std_logic
	);
end circ1;

architecture dataflow of circ1 is
	begin
		q <= ((a and not(b) and not(c)) or (not(b) and not(c) and not(d)));
end dataflow;