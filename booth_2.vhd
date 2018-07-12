library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity mult2 is
	port
	(
		q, m : in std_logic_vector(1 downto 0);
		clk : inout std_logic;
		output : out std_logic_vector(3 downto 0)
	);
end mult2;

architecture behavioral of mult2 is

-- component declarations
component clock
	port
	(
		clk: out std_logic
	);
end component;

-- architecture definition
begin
	
	clk_out : clock port map(clk);
	
	process(clk)
		
		variable mn, cm : std_logic_vector(1 downto 0);
		variable aq : std_logic_vector(3 downto 0);
		variable qm : std_logic;
	begin
		if(clk'event and clk = '1') then
			aq(3 downto 0) := (others => '0');
			aq(1 downto 0) := q;
			mn := m;
			cm := not(m) + '1';
			qm := '0';
		else
			for i in 1 downto 0 loop
				if(aq(0) = '0' and qm = '1') then
					aq(3 downto 2) := aq(3 downto 2) + mn;
				elsif(aq(0) = '1' and qm = '0') then
					aq(3 downto 2) := aq(3 downto 2) + cm;
				end if;
				qm := aq(0);
				aq(2 downto 0) := aq(3 downto 1);
			end loop;
			output <= aq;
		end if;
	end process;
end behavioral;
	
	