library ieee;
use ieee.std_logic_1164.all;

entity and2not is
	port
	(
		i1, i2, i3: in std_logic;
		x: out std_logic
	);
end and2not;

architecture arch of and2not is
	begin
		x <= i1 and not(i2) and not(i3);
end arch;