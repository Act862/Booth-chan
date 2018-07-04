--Ex.1 b)

--a 3 input nor

library ieee;
use ieee.std_logic_1164.all;

entity nor3 is
	port
	(
		i1, i2, i3: in std_logic;
		temp: inout std_logic;
		o1: out std_logic
	);
end nor3;

architecture behavioral of nor3 is
	begin
		process(i1, i2, i3, temp)
			begin
				temp <= (i1 or i2) or i3;
				if temp = '1' then
					o1 <= '0';
				elsif temp = '0' then
					o1 <= '1';
				end if;
		end process;
end behavioral;
