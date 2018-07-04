-- bcd to excess3
library ieee;
use ieee.std_logic_1164.all;

entity bcd_to_excess3 is
	port
	(
		input: in std_logic_vector(3 downto 0);
		output: out std_logic_vector(3 downto 0)
	);
end bcd_to_excess3;

architecture structural of bcd_to_excess3 is
-- output(0)
component first_digit
	port
	(
		a, b, c, d: in std_logic;
		o1: out std_logic
	);
end component;
-- output(1)
component second_digit
	port
	(
		a, b, c, d: in std_logic;
		o1: out std_logic
	);
end component;
-- output(2)
component third_digit
	port
	(
		a, b, c, d: in std_logic;
		o1: out std_logic
	);
end component;
-- output(3)
component fourth_digit
	port
	(
		a, b, c, d: in std_logic;
		o1: out std_logic
	);
end component;
signal o1, o2, o3, o4: std_logic;
begin
	-- output(0) = d'
	digit1: first_digit port map(input(3), input(2), input(1), input(0), o1);
	-- output(1) = c'd' + cd
	digit2: second_digit port map(input(3), input(2), input(1), input(0), o2);
	-- output(2) = bc'd' + b'(c + d)
	digit3:	third_digit port map(input(3), input(2), input(1), input(0), o3);
	-- output(3) = a + b(c + d);
	digit4:	fourth_digit port map(input(3), input(2), input(1), input(0), o4);
	
	output(0) <= o1;
	output(1) <= o2;
	output(2) <= o3;
	output(3) <= o4;
	
end structural;