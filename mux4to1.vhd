-- mux 4 to 1
library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
	port
	(
		a, b, c, d: in std_logic_vector(3 downto 0);
		slc: in std_logic_vector(1 downto 0);
		output: out std_logic_vector(3 downto 0)
	);
end mux4to1;

architecture dataflow of mux4to1 is
begin
	output <= a when (slc = "00") else
				b when (slc = "01") else
				c when (slc = "10") else
				d;
end dataflow;