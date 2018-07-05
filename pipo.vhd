-- parallel input - parallel output shift register
library ieee;
use ieee.std_logic_1164.all;

entity pipo is
	port
	(
		clk, reset: in std_logic;
		data_in: in std_logic_vector(3 downto 0);
		data_out: out std_logic_vector(3 downto 0)
	);
end pipo;

architecture behavioral of pipo is
begin
	pipo: process(clk, data_in, reset) is
		begin
			if(reset = '1') then
				data_out <= "0000";
			else(rising_edge(clk)) then
				data_out <= data_in;
			end if;
		end process pipo;
end behavioral;