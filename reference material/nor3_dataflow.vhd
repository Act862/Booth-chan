--Ex.1 b)

--a 3 input nor

library ieee;
use ieee.std_logic_1164.all;

entity nor3 is
	port
	(
		i1, i2, i3: in std_logic;
		o1: out std_logic
	);
end nor3;

architecture dataflow of nor3 is
	begin
		o1 <= not((i1 or i2) or i3);
end dataflow;
