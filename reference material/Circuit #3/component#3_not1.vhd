-- circuit 3 extra component
-- I am using the components from circ2
-- so, I must add a not1 gate design

library ieee;
use ieee.std_logic_1164.all;

entity not1 is
	port
	(
		i1: in std_logic;
		o1: out std_logic
	);
end not1;

architecture arch of not1 is
	begin
		o1 <= not(i1);
end arch;
