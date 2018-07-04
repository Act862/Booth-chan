-- fsm 3

library ieee;
use ieee.std_logic_1164.all;

entity fsm3 is
	port
	(
		clk, reset: in std_logic;	-- sequential logic elements
		input: in std_logic;		-- the basic input for changing states
		fstate: out std_logic_vector(1 downto 0);	-- an output signal in order to observe the state changes
		output: out std_logic_vector(1 downto 0)			-- the standard output of the finite state machine
	);
end fsm3;

architecture moore of fsm3 is

-- always declare a state type in every architecture
subtype state_type is std_logic_vector(1 downto 0);
signal state: state_type;
constant s0: state_type := "00";
constant s1: state_type := "01";
constant s2: state_type := "10";

begin
	-- sequential logic process
	-- ff
	process(clk, reset)
	begin
		if (reset = '1') then
			state <= s0;
			fstate <= "00";
		elsif (clk'event and clk = '1') then
			case state is
				when s0 =>
					if input = '1' then
						state <= s1;
						fstate <= "01";
					else
						state <= s2;
						fstate <= "10";
					end if;
				when s1 =>
					if input = '1' then
						state <= s2;
						fstate <= "10";
					end if;
				when others =>
					if input = '1' then
						state <= s0;
						fstate <= "00";
					else
						state <= s1;
						fstate <= "01";
					end if;
			end case;
		end if;
	end process;
	
	-- and now, the output process
	-- since the machine is of moore type, the outputs are going to be based only on the current state
	process(state)
	begin
		if state = s0 then
			output <= "01";
		else
			output <= "11";
		end if;
	end process;
	-- and this is the end of our code for fsm3
end moore;