-- library in use.
library ieee;
-- packages used from the said library.
use ieee.std_logic_1164.all;

--	entity declaration, top level of the current file.
entity mult is
	port
	(
		-- the inputs are...
		q, m: in std_logic_vector(3 downto 0);
		
		-- the output is...
		r: out std_logic_vector(7 downto 0)
	);
end mult;

architecture behavioral of mult is
-- component declarations.
component clock
	port
	(
		clk: out std_logic
	);
end component;

component pipo
	port
	(
		clk, reset: in std_logic;
		data_in: in std_logic_vector(3 downto 0);
		data_out: out std_logic_vector(3 downto 0)
	);
end component;

-- signal declarations.
signal clk: std_logic;


begin
	-- processes, procedures, port mapping, etc.
	clock_output: clock port map(clk);
	
	-- note that the process as a whole, runs concurrently with the rest of the code.
	process(q, m)
		-- variable declaration block
		variable N: integer range 0 to 3;
	begin
		while(N < 4) loop
			if((q(0) & qm) = "01") then
				-- A = A + M
			elsif((q(0) & qm) = "10") then
				-- A = A - M
			end if;
			--	shift the concatenation of AQQm to the right by 1.
			--	decrease the N.
			N := N - 1;
			--	continue to the next statement.
		end loop;
	end process;
	--	concurrent signals and components.
end behavioral;
