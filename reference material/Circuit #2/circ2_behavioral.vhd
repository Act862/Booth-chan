-- circuit 2 behavioral

library ieee;
use ieee.std_logic_1164.all;

entity circ2 is
	port
	(
		a, b, c: in std_logic;
		q: out std_logic
	);
end circ2;

architecture behavioral of circ2 is
	begin
	process(a,b,c)
		begin
			if (a = '1' or a = '0') and b = '1' and c = '1' then
				q <= '1';
			elsif a = '1' and b = '1' and c = '0' then
				q <= '1';
			else
				q <= '0';
			end if;
	end process;
end behavioral;