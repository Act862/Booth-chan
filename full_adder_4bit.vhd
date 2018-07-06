-- subtractor 4 bit

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity full_adder_4bit	is
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		result: out std_logic_vector(3 downto 0)
	);
end full_adder_4bit;

architecture dataflow of full_adder_4bit is
begin
	result <= a + b;
end dataflow;