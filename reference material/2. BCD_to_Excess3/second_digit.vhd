-- Second digit calculation, 1st bit
library ieee;
use ieee.std_logic_1164.all;

entity second_digit is
	port
	(
		a, b, c, d: in std_logic;
		o1: out std_logic
	);
end second_digit;

architecture dataflow of second_digit is
signal term1, term2, term3, term4: std_logic;
begin
	-- c'd' == (c + d)'
	term1 <= not(c or d);
	term2 <= c and d;
	o1 <= term1 or term2;
end dataflow;