-- fourth digit calculation, end-left bit
library ieee;
use ieee.std_logic_1164.all;

entity fourth_digit is
	port
	(
		a, b, c, d: in std_logic;
		o1: out std_logic
	);
end fourth_digit;

architecture dataflow of fourth_digit is
signal term1, term2: std_logic;
begin
	-- c + d
	term1 <= c or d;
	-- b(c + d)
	term2 <= b and term1;
	-- a + b(c + d)
	o1 <= a or term2;
end dataflow;