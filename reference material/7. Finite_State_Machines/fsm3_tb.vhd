-- fsm3 test_bench
library ieee;
use ieee.std_logic_1164.all;

entity fsm3_tb is
end fsm3_tb;

architecture testbench of fsm3_tb is

component fsm3
	port
	(
		clk, reset: in std_logic;
		input: in std_logic;		
		fstate: out std_logic_vector(1 downto 0);
		output: out std_logic_vector(1 downto 0)
	);
end component;

-- now, let us declare the temporary signals
signal tclk, treset, tin: std_logic;
signal tout, tfs: std_logic_vector(1 downto 0);

begin

	connect: fsm3 port map(clk => tclk, reset => treset, input => tin, fstate => tfs, output => tout);
	
	-- and here is the main testing process
	process
	begin
	
		-- start the state machine, the reset state
		tclk <= '0';
		treset <= '1';
		tin <= '-';
		wait for 50 ns;
		
		-- the transition from s0 --> s1
		tclk <= '1';
		treset <= '0';
		tin <= '1';
		wait for 50 ns;
		
		-- the null state, where nothing happens, the negative_edge of the clock
		tclk <= '0';
		treset <= '0';
		tin <= '-';
		wait for 50 ns;
		
		-- the next transition from s1 --> s1, the idle state
		tclk <= '1';
		treset <= '0';
		tin <= '0';
		wait for 50 ns;
		
		-- null state, negative_edge
		tclk <= '0';
		treset <= '0';
		tin <= '-';
		wait for 50 ns;
		
		-- the s1 --> s2 transition
		tclk <= '1';
		treset <= '0';
		tin <= '1';
		wait for 50 ns;
		
		-- the null state
		tclk <= '0';
		treset <= '0';
		tin <= '-';
		wait for 50 ns;
		
		-- the s2 --> s0 transition
		tclk <= '1';
		treset <= '0';
		tin <= '1';
		wait for 50 ns;
		
		-- null
		tclk <= '0';
		treset <= '0';
		tin <= '-';
		wait for 50 ns;
		
		-- the s0 --> s2 transition
		tclk <= '1';
		treset <= '0';
		tin <= '0';
		wait for 50 ns;
		
		-- null
		tclk <= '0';
		treset <= '0';
		tin <= '-';
		wait for 50 ns;
		
		-- final transition s2 --> s1
		tclk <= '1';
		treset <= '0';
		tin <= '0';
		wait for 50 ns;
		
		-- and the final reset state
		tclk <= '0';
		treset <= '1';
		tin <= '-';
		wait for 50 ns;
		
	end process;
end testbench;