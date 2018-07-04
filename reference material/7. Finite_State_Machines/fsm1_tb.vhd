-- testbench for fsm
library ieee;
use ieee.std_logic_1164.all;

entity fsm1_tb is
end fsm1_tb;

architecture testbench of fsm1_tb is

component fsm1 
	port
	(
		inp, clk, arst: in std_logic;
		outp: out std_logic;
		out_state: out std_logic_vector(1 downto 0)
	);
end component;

signal tinp, tclk, tarst, toutp: std_logic;
signal tstate: std_logic_vector(1 downto 0);
begin

	connect: fsm1 port map(inp=>tinp, clk=>tclk, arst=>tarst, outp=>toutp, out_state => tstate);
	
	-- we have to pass by every possible state
	process
	begin
	-- reset state, the only negative pulse phase were a state write is allowed
--		1		
		tclk <= '0';
		tarst <= '1';
		tinp <= '-';
		wait for 100 ns;
--		2
		tclk <= '1';
		tarst <= '0';
		tinp <= '1';
		wait for 100 ns;
-- 		3
		tclk <= '0';
		tarst <= '0';
		tinp <= '-';
		wait for 100 ns;
--		4	
		tclk <= '1';
		tarst <= '0';
		tinp <= '1';
		wait for 100 ns;
--		5
		tclk <= '0';
		tarst <= '0';
		tinp <= '-';
		wait for 100 ns;
--		6
		tclk <= '1';
		tarst <= '0';
		tinp <= '0';
		wait for 100 ns;
--		7
		tclk <= '0';
		tarst <= '0';
		tinp <= '-';
		wait for 100 ns;
--		8
		tclk <= '1';
		tarst <= '0';
		tinp <= '0';
		wait for 100 ns;
--		9
		tclk <= '0';
		tarst <= '0';
		tinp <= '-';
		wait for 100 ns;
--		10
		tclk <= '1';
		tarst <= '0';
		tinp <= '1';
		wait for 100 ns;
--		11
		tclk <= '0';
		tarst <= '1';
		tinp <= '-';
		wait for 100 ns;
--		12
		tclk <= '1';
		tarst <= '0';
		tinp <= '0';
		wait for 100 ns;
-- 		end of simulation for finite state machine 1
	end process;
end testbench;