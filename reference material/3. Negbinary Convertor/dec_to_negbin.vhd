-- the basic negbinary converter using the combinational logic
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity dec_to_negbin is
	port
	(
		i1: in integer;
		o1: out std_logic_vector(4 downto 0)
	);
end dec_to_negbin;

architecture dataflow of dec_to_negbin is

signal temp: std_logic_vector(3 downto 0);
signal temp1, temp2, temp3, temp4, temp5: std_logic;

begin

	temp <= std_logic_vector(to_unsigned(i1, 4));
	
	-- here begins the convertion from binary to negbinary
	-- temp(3) : x, temp(2): y, temp(1): z, temp(0): w
	
	-- f1 or the first (o1(4))
	o1(4) <= temp(3) or (temp(2) and temp(1));
	
	-- f2
	temp1 <= not(temp(3)) and temp(2) and temp(1);
	temp2 <= temp(3) and not(temp(1));
	temp3 <= temp(3) and not(temp(2));
	o1(3) <= temp1 or temp2 or temp3;
	
	-- f3
	temp4 <= not(temp(3)) and not(temp(2)) and temp(1);
	temp5 <= (not(temp(2)) and temp(1)) or (not(temp(1)) and temp(2));
	o1(2) <= temp4 or temp5;
	-- f4
	o1(1) <= temp(1);
	-- f5
	o1(0) <= temp(0);
	
end dataflow;