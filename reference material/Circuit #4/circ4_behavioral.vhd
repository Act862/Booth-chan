-- circuit 4 dataflow design

library ieee;
use ieee.std_logic_1164.all;

entity circ4 is
	port
	(
		a, b, c: in std_logic;
		y: out std_logic
	);
end circ4;

architecture dataflow of circ4 is
	begin
		process(a, b, c)
			if (a = '1' or a = '0') and b = '0' and c = '1' then
				q <= '1';
			elsif a = '0' and b = '1' and c = '1' then
				q <= '1';
			else
				q <= '0';
			end if;
		end process;
end dataflow;
