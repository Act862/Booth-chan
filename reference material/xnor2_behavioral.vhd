-- ex.1 c)

--xnor 2

library ieee;
use ieee.std_logic_1164.all;

entity xnor2 is
	port
	(
		i1, i2: in std_logic;
		o1: out std_logic
	);
end xnor2;

architecture behavioral of xnor2 is

	begin
		process(i1, i2)
		begin
			if (i1 xor i2) = '1' then
				o1 <= '0';
			else
				o1 <= '1';
			end if;
		end process;
end behavioral;