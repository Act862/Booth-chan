library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--	behavioral implementation
entity booth is
port(
	q, m: in std_logic_vector(3 downto 0);
	c: out std_logic_vector(7 downto 0)
);

architecture behavioral of booth is

signal acc: std_logic_vector(3 downto 0) := "0000";
--	signal qm: std_logic := '0';
signal aqqm: std_logic_vector(10 downto 0);

begin
	process(a, b)
		variable N : integer range 0 to 4
	begin
		--	sequential statements
		while (N > 0) loop
			--	here the loop is being executed
			aqqm = acc & q & qm;	--	concatenation
			if(aqqm(1 downto 0) = "01") then
				--	A = A - M
				acc <= acc - M;
			elsif(aqqm(1 downto 0) = "10") then
				--	A = A + M
				acc <= acc + M;
			end if;
			--	after the checks and accumulator changes
			--	the shifting must be executed
			--	memory elements should be added
			aqqm <= acc & q & qm;
			
			
		
		
	end process;
end behavioral;