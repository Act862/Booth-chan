library ieee;
use ieee.std_logic_1164.all;

entity right_shifter is
	port
	(
		input: in std_logic_vector(8 downto 0);
		output: out std_logic_vector(8 downto 0)
	);
end right_shifter;

architecture dataflow of right_shifter is

--	component declarations
--	signal declarations
begin
	output(7 downto 0) <= input(8 downto 1);
	output(8) <= input(8);
end dataflow;