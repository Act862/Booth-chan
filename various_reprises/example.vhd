-- example
library ieee;
use ieee.std_logic_1164.all;

entity check is
end check;

architecture execution of check is

component clock
	port(
		clk: out std_logic
	);
end component;

signal a, b: std_logic_vector(0 to 4);
signal clk: std_logic;

begin
	clk_out: clock port map(clk);
	
	process(clk)
		variable var: std_logic_vector(0 to 4);
		begin
			if(rising_edge(clk)) then
				var := "01111";
				a <= var;
				b <= var;
			end if;
		end process;
end execution;
	