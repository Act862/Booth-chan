-- shift register with SISO logic [ serial-in serial-out : single bit in - single bit out ]
-- enable and disable the clock

library ieee;
use ieee.std_logic_1164.all;

entity siso_enable is
	port
	(
		clk, clk_enable, si: in std_logic;
		so: out std_logic
	);
end siso_enable;

architecture behavioral of siso_enable is

signal temp: std_logic_vector(7 downto 0) := "00000000";

begin

	process(clk, clk_enable)
	begin
		if (clk_enable = '1') then	-- I don't know if the clk should go up,  or the clk_enable, i think that in that code, it is of no importance
			if(clk'event and clk = '1') then		-- I will stick with my logic that enable is higher that clk, but I am not sure enough
				temp(7 downto 1) <= temp(6 downto 0);
				temp(0) <= si;
			else
				temp <= temp;
			end if;
		else
			temp <= temp;
		end if;
	end process;
	so <= temp(7);
end behavioral;