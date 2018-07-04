-- first digit calculation, 0th
library ieee;
use ieee.std_logic_1164.all;

entity first_digit is
	port
	(
		a, b, c, d: in std_logic;
		o1: out std_logic
	);
end first_digit;

architecture dataflow of first_digit is
begin
	o1 <= not(d);
end dataflow;