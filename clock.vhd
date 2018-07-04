library ieee;
use ieee.std_logic_1164.all;

entity clock is
port(
	clk: out std_logic);
end clock;

architecture behavioral of clock is
begin
	process
	begin
		clk <= '0';
		wait for 100 ns;
		clk <= '1';
		wait for 100 ns;
	end process;
end behavioral;