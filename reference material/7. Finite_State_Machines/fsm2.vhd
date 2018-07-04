-- fsm 2
library ieee;
use ieee.std_logic_1164.all;

entity fsm2 is
	port
	(
		clk, reset: in std_logic;
		input: in std_logic;
--		output: out std_logic;, this is not a mealy machine, with an output
		fstate: out std_logic_vector(1 downto 0)
	);
end fsm2;

architecture moore of fsm2 is

type state_type is (s1, s2);
signal state: state_type;

begin

-- process 1, for state traversal
	process(clk, reset)
	begin
		if reset = '1' then
			state <= s1;
			fstate <= "01";
		elsif (clk'event and clk = '1') then
			case state is
				when s1 =>
					if input = '0' then
						state <= s2;
						fstate <= "10";
					end if;
				when s2 =>
					if input = '0' then
						state <= s1;
						fstate <= "01";
					end if;
			end case;
	end process;

end moore;