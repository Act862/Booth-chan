-- circ5 dataflow design

library ieee;
use ieee.std_logic_1164.all;

entity circ5 is
	port
	(
		a0, a1: in std_logic;
		d0, d1, d2, d3: out std_logic
	);
end circ5;

architecture dataflow of circ5 is
	begin
		d0 <= not(a0) and not(a1);
		d1 <= a0 and not(a1);
		d2 <= not(a0) and a1;
		d3 <= a0 and a1;
end dataflow;