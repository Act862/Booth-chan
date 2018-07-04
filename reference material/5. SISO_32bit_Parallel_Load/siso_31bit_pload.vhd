-- SISO 32bit with parallel asynchronous reload

library ieee;
use ieee.std_logic_1164.all;

entity siso_32bit_pload is
	port
	(
		clk, load, si: in std_logic;
		pi: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0);	-- added just to observe the register value
		so: out std_logic
	);
end siso_32bit_pload;

architecture behavioral of siso_32bit_pload is
-- signal declarations
signal temp: std_logic_vector(31 downto 0);

begin
	process(clk, pi, load)
	begin
		if (load = '1') then
			temp(31 downto 0) <= pi(31 downto 0);
		elsif (clk'event and clk = '1') then
			temp(31 downto 1) <= temp(30 downto 0);
			temp(0) <= si;
		end if;
	end process;
	output <= temp;
	so <= temp(31);
end behavioral;