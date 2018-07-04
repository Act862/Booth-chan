-- circuit 3
-- dataflow

library ieee;
use ieee.std_logic_1164.all;

entity circ3 is
	port
	(
		a,b,c: in std_logic;
		y: out std_logic
	);
end circ3;

architecture dataflow of circ3 is
	begin
		y <= not((a and b) or not(c));
end dataflow;