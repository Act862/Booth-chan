-- circ1 behavioral design

library ieee;
use ieee.std_logic_1164.all;

entity circ1 is
	port
	(
		a, b, c, d: in std_logic;
		o1: out std_logic
	);
end circ1;

architecture behavioral of circ1 is
	begin
		process(a, b, c, d)
		begin
			if a = '1' and b = '0' and c = '0' and ( d = '0' or d = '1') then
				o1 <= '1';
			elsif a = '0' and b = '0' and c = '0' and d = '0' then
				o1 <= '1';
			else
				o1 <= '0';
			end if;
		end process;
end behavioral;