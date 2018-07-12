-- testbench for the behavioral booth multiplication algorithm
library ieee;
use ieee.std_logic_1164.all;

entity bm_testbench is
end bm_testbench;

architecture testbench of bm_testbench is
-- components

component mult
	port
	(
		q, m: in std_logic_vector(1 downto 0);
		-- reset: in std_logic;
		obs: out std_logic;
		output: out std_logic_vector(3 downto 0)
	);
end component;

-- signals
signal tq, tm: std_logic_vector(1 downto 0);
signal tclk: std_logic;
signal tout: std_logic_vector(3 downto 0);

begin
--	architecture
	connect: mult port map(q => tq, m => tm, obs => tclk, output=>tout);
	process
	begin
--		0.
		tq <= "00";
		tm <= "00";
		-- tr <= '1';
		wait for 400 ns;
		
--		1.
		tq <= "10";
		tm <= "11";
		-- tr <= '0';
		wait for 400 ns;
		
--		2.
		tq <= "10";
		tm <= "00";
		-- tr <= '0';
		wait for 400 ns;
		
--		3.
		tq <= "11";
		tm <= "11";
		-- tr <= '0';
		wait for 400 ns;
		
-- 		4.
		tq <= "11";
		tm <= "10";
		wait for 400 ns;

--		5.
		tq <= "01";
		tm <= "11";
		wait for 400 ns;
		
	end process;
end testbench;