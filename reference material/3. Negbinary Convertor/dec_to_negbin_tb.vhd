-- testbench for dec to negbin converter
library ieee;
use ieee.std_logic_1164.all;

entity dec_to_negbin_tb is
end dec_to_negbin_tb;

architecture testbench of dec_to_negbin_tb is

-- component declarations
component dec_to_negbin
	port
	(
		i1: in integer;
		o1: out std_logic_vector(4 downto 0)
	);
end component;

-- signal declarations
signal ti1: integer;
signal to1: std_logic_vector(4 downto 0);

begin
	connect: dec_to_negbin port map(i1=>ti1, o1=>to1);
	
	process
	begin
		ti1 <= 0;
		wait for 100 ns;
		
		ti1 <= 1;
		wait for 100 ns;
		
		ti1 <= 2;
		wait for 100 ns;
		
		ti1 <= 3;
		wait for 100 ns;
		
		ti1 <= 4;
		wait for 100 ns;
		
		ti1 <= 5;
		wait for 100 ns;
		
		ti1 <= 6;
		wait for 100 ns;
		
		ti1 <= 7;
		wait for 100 ns;
		
		ti1 <= 8;
		wait for 100 ns;
		
		ti1 <= 9;
		wait for 100 ns;
		
		ti1 <= 10;
		wait for 100 ns;
		
		ti1 <= 11;
		wait for 100 ns;
		
		ti1 <= 12;
		wait for 100 ns;
		
		ti1 <= 13;
		wait for 100 ns;
		
		ti1 <= 14;
		wait for 100 ns;
		
		ti1 <= 15;
		wait for 100 ns;
	end process;
end testbench;