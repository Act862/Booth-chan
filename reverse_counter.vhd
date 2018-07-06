--	counter reprise

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity reverse_counter is
	port
	(
		number: in std_logic_vector(3 downto 0);
		reset: in std_logic;
		output: out std_logic_vector(3 downto 0);
		zero: inout std_logic
	);
end reverse_counter;

architecture behavioral of reverse_counter is

component clock
	port
	(
		clk: out std_logic
	);
end component;

signal temp: std_logic_vector(3 downto 0);
signal clk: std_logic;

begin
	clk_out: clock port map(clk);
	process(clk, reset)
	begin
		if reset = '1' then
			temp <= number;
		elsif(clk'event and clk = '1' and zero /= '1') then
			temp <= temp - 1;
		end if;
		if temp = "0000" then
			zero <= '1';
		else
			zero <= '0';
		end if;
	end process;
	output <= temp;
end behavioral;