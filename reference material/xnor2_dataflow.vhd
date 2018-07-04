-- ex.1 c)

--xnor 2

library ieee;
use ieee.std_logic_1164.all;

entity xnor2 is
	port
	(
		i1, i2: in std_logic;
		o1: out std_logic
	);
end xnor2;

architecture dataflow of xnor2 is
	begin
		o1 <= not( i1 xor i2 );
end dataflow;