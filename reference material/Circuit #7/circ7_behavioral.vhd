-- circuit 7 in behavioral design

library ieee;
use ieee.std_logic_1164.all;

entity circ7 is
	port
	(
		a, b: in std_logic;
		o1, o2: out std_logic
	);
end circ7;

-- after designing the truth table of the function/circuit, we present the behavioral design!!
architecture behavioral of circ7 is
	begin
		process(a, b)
			begin
				if a = '0' and b = '0' then
					o1 <= '0';
					o2 <= '0';
				elsif a = '0' and b = '1' then
					o1 <= '0';
					o2 <= '1';
				elsif a = '1' and b = '0' then
					o1 <= '0';
					o2 <= '1';
				elsif a = '1' and b = '1' then
					o1 <= '1';
					o2 <= '0';
				end if;
		end process;
end behavioral;
		