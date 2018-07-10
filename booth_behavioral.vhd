library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mult is
	port
	(
		q, m: in std_logic_vector(7 downto 0);
		output: out std_logic_vector(15 downto 0);
		obs: out std_logic_vector(15 downto 0)
	);
end mult;

architecture behavioral of mult is

--	componentns
component clock
	port
	(
		clk: out std_logic
	);
end component;

--	signals
signal clk: std_logic;

--	implementation
begin

	clk_out: clock port map(clk);
	
	--	our process is clock sensitive. It runs everytime the clock signal changes.
	process(clk)
		--	variable declaration
		variable mn, cm: std_logic_vector(7 downto 0);
		variable aq: std_logic_vector(15 downto 0);
		variable qm: std_logic;
	
	begin
		if(clk'event and clk = '1') then
			aq(15 downto 0) := (others=>'0');
			aq(7 downto 0) := q;
			mn := m;
			cm := not(m) + '1';
			qm := '0';
			obs <= aq;
		else
			for i in 7 downto 0 loop
				--	now we check the four states
				if(aq(0) = '0' and qm = '1') then
					--	A = A + M
					aq(15 downto 8) := aq(15 downto 8) + mn;
				elsif(aq(0) = '1' and qm = '0') then
					--	A = A - M
					aq(15 downto 8) := aq(15 downto 8) + cm;
				end if;
				--	then shift aqqm to the right by 1 and decrease the counter
				qm := aq(0);
				aq(14 downto 0) := aq(15 downto 1);
			end loop;
			output <= aq;
		end if;
	end process;
end behavioral;