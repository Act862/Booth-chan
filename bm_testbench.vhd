-- testbench for the behavioral booth multiplication algorithm
library ieee;
use ieee.std_logic_1164.all;

entity bm_testbench is
end bm_testbench;

architecture testbench of bm_testbench
-- components

component mult
	port
	(
		q, m: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(15 downto 0)
	);
end component;

-- signals
signal tq, tm: std_logic_vector(7 downto 0);
signal tout: std_logic_vector(15 downto 0);

begin
--	architecture
	connect: mult port map(q => tq, tm => m, output=>tout);
	process
	begin
		
--		1.
		tq <= "00001000";
		tm <= "00000010";
		wait for 100 ns;
		
--		2.
		tq <= "00010010";
		tm <= "00010000";
		wait for 100 ns;
		
--		3.
		tq <= "11111111";
		tm <= "11111111";
		wait for 100 ns;
		
-- 		4.
		tq <= "11001101";
		tm <= "00000011";
		wait for 100 ns;
	end process;
end testbench;