-- circuit 4 dataflow design

library ieee;
use ieee.std_logic_1164.all;

entity circ4 is
	port
	(
		a, b, c: in std_logic;
		y: out std_logic
	);
end circ4;

architecture dataflow of circ4 is
	begin
		y <= not(not(c)) and not(a and b);
end dataflow;