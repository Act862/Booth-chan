-- structural of circuit 2
-- or2 gate

library ieee;
use ieee.std_logic_1164.all;

entity or2 is
	port
	(
		i1, i2: in std_logic;
		o1: out std_logic
	);
end or2;

architecture arch of or2 is
	begin
		o1 <= i1 or i2;
end arch;