library ieee;
use ieee.std_logic_1164.all;

entity mult is
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		c: out std_logic
	);
	
architecture structural of mult is



