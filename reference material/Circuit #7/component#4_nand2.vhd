-- circuit 7
-- structural circuit using nand

library ieee;
use ieee.std_logic_1164.all;

entity nand2 is
	port
	(
		i1, i2: in std_logic;
		o1: out std_logic
	);
end nand2;

architecture arch of nand2 is
	begin
		o1 <= not(i1 and i2);
end arch;