library ieee;
use ieee.std_logic_1164.all;

entity and2of1not is
	port
		(
			i1, i2: in std_logic;
			o1: out std_logic
		);
end and2of1not;

architecture arch of and2of1not is
	begin
		o1 <= not(i1) and i2;
end arch;