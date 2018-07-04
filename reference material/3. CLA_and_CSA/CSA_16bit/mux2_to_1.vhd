-- 2 to 1 MUX
library ieee;
use ieee.std_logic_1164.all;

entity mux2_to_1 is
	port
	(
		a, b: in std_logic;
		slc: in std_logic;
		output: out std_logic
	);
end mux2_to_1;

architecture dataflow of mux2_to_1 is
begin

	output <= a when (slc = '1') else
			b;
end dataflow;