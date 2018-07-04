library ieee;
use ieee.std_logic_1164.all;

entity circ6 is
	port
	(
		a, b, c, d: in std_logic;
		e: out std_logic
	);
end circ6;

architecture behavioral of circ6 is
	begin
		process(a, b, c, d)
			begin
				if (a = '1' or a = '0') and b = '0' and c = '0' and d = '0' then
					e <= '1';
				elsif a = '1' and b = '0' and c = '0' and d = '1' then
					e <= '1';
				else
					e <= '0';
				end if;
		end process;
end behavioral;