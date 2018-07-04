-- structural of circuit 2
-- and2 gate

library ieee;
use ieee.std_logic_1164.all;

entity and2 is
	port
	(
		i1, i2: in std_logic;
		o1: out std_logic
	);
end and2;

architecture arch of and2 is
	begin
		o1 <= i1 and i2;
end arch;