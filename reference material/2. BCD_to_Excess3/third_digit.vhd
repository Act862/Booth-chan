-- Third digit calculation, 2nd bit
library ieee;
use ieee.std_logic_1164.all;

entity third_digit is
	port
	(
		a, b, c, d: in std_logic;
		o1: out std_logic
	);
end third_digit;

architecture dataflow of third_digit is
signal term1, term2: std_logic;
begin
	-- bc'd'
	term1 <= b and not(c) and not(d);
	-- c + d
	term2 <= c or d;
	-- final result: bc'd' + b'(c + d);
	o1 <= term1 or (not(b) and term2);
end dataflow;