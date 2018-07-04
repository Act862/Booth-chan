-- four input and gate
library ieee;
use ieee.std_logic_1164.all;

entity and4 is
	port
	(
		i1, i2, i3, i4: in std_logic;
		o1: out std_logic
	);
end and4;

architecture dataflow of and4 is
begin

	o1 <= i1 and i2 and i3 and i4;
end dataflow;