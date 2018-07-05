-- check for basic algorithm

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity algo is
	port
	(
		input: inout std_logic_vector(3 downto 0);
		output: out std_logic_vector(3 downto 0)
	);
end algo;

architecture execution of algo is
-- component declarations
-- signal declarations
begin

	process(input)
	-- variable declarations
		variable count : integer range 0 to 100;
	begin
		count := 0;
		for I in 1 to 10 loop
			count := count + 1;
			input(I mod 4) <= '1';
		end loop;
		output <= std_logic_vector(to_unsigned(count, 4));
	end process;
end execution;
		