-- work package #6, FSM 1

library ieee;
use ieee.std_logic_1164.all;

entity fsm1 is
	port
	(
		inp, clk, arst: in std_logic;
		outp: out std_logic;
		out_state: out std_logic_vector(1 downto 0)
	);
end fsm1;

architecture behavioral of fsm1 is

type state is (s0, s1, s2);
signal st: state;

begin
-- this is a mealy machine
-- 1st process is about the state changing, so we need the asynchronous rst and clk
	process(clk, arst)
	begin
		if(arst = '1') then
			st <= s0;
			out_state <= "00";
		elsif (clk'event and clk = '1') then
			-- a case for the various states
			case st is
				when s0 =>
					if inp = '0' then
						st <= s2;
						out_state <= "10";
					end if;
					if inp = '1' then
						st <= s1;
						out_state <= "01";
					end if;
				when s1 =>
					if inp = '0' then
						st <= s2;
						out_state <= "10";
					end if;
				when s2 =>
					if inp = '1' then
						st <= s1;
						out_state <= "01";
					end if;
			end case;
		end if;
	end process;
	
	-- now the process for the outputs, the process contains states and inps!
	process(st, inp)
	begin
		case st is
			when s0 =>
				outp <= '0';
			when s1 =>	
				outp <= '1';
			when s2 =>
				outp <= '0';
		end case;
	end process;
end behavioral;	