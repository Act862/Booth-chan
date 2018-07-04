-- Ex.1 a)

-- declaring our libraries

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- declaring our entity
-- a nand gate with two inputs
entity nand2 is
	port
	(
		i1, i2: in std_logic;
		o1: out std_logic
	);
end nand2;

-- and now the architecture
--architecture dataflow of nand2 is
--	begin
--		o1 <= not(i1 and i2);
--end dataflow;

architecture behavioral of nand2 is
	begin
		process(i1, i2)
			begin
			if i1 = '1' and i2 = '1' then
				o1<= '0';
			elsif (i1 = '1' and i2 = '0') or (i1 ='1' and i2 = '0') or (i1 = '0' and i2 = '0') then
				o1<= '1';
--			else
--				report "invalid output" severity failure;
			end if;
		end process;
end behavioral;