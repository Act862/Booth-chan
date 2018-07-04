-- circ5 behavioral design

library ieee;
use ieee.std_logic_1164.all;

entity circ5 is
	port
	(
		a0, a1: in std_logic;
		d0, d1, d2, d3: out std_logic
	);
end circ5;

architecture behavioral of circ5 is
	begin
		process(a0, a1)
		begin
			if a0 = '0' and a1 = '0' then
				d0 <= '1';
				d1 <= '0';
				d2 <= '0';
				d3 <= '0';
			elsif a0 = '0' and a1 = '1' then
				d0 <= '0';
				d1 <= '0';
				d2 <= '1';
				d3 <= '0';
			elsif a0 = '1' and a1 = '0' then
				d0 <= '0';
				d1 <= '1';
				d2 <= '0';
				d3 <= '0';
			elsif a0 = '1' and a1 = '1' then
				d0 <= '0';
				d1 <= '0';
				d2 <= '0';
				d3 <= '1';
			end if;
		end process;
end behavioral;