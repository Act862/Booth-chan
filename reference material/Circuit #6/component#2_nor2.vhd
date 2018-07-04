library ieee;
use ieee.std_logic_1164.all;

entity nor2 is
	port
		(
			i1, i2: in std_logic;
			o1: out std_logic
		);
end nor2;

architecture arch of nor2 is
	begin
		o1 <= not(i1 or i2);
end arch;