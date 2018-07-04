-- bcd counter 8-bit

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity counter is
	port
	(
		clock_enable, clock, reset: in std_logic;
		output: out std_logic_vector(7 downto 0)
	);
end counter;

architecture behavioral of counter is

signal temp: std_logic_vector(7 downto 0);

begin
	process(clock, reset)	-- I want both the clock and reset in the sl
	begin
		if(reset = '1') then
			temp <= "00000000";	-- simple, since the reset is asynchronous
		elsif (RISING_EDGE(clock)) then
			if(clock_enable = '0') then
				if(temp = "10000001") then
					temp <= "00000000";
				else
					temp <= std_logic_vector(unsigned(temp) + 1);
				end if;
			end if;
		end if;
	end process;
	
	output <= temp;
end behavioral;