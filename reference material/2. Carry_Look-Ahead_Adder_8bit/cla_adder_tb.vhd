-- testbench for the cla_adder both implementations

library ieee;
use ieee.std_logic_1164.all;

entity cla_adder_tb is
end cla_adder_tb;

architecture testbench of cla_adder_tb is

-- component declarations
component cla_adder
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		cin: in std_logic;
		sum: inout std_logic_vector(7 downto 0);
		cout: inout std_logic
	);
end component;

-- signal section
signal ta, tb, tsum: std_logic_vector(7 downto 0);
signal tcin, tcout: std_logic;

-- testbench begins here!
begin

-- first to connect the component
	connect: cla_adder port map(a=>ta, b=>tb, cin=>tcin, sum=>tsum, cout=>tcout);
	
	process
	begin
		ta <= "00000010";
		tb <= "00000011";
		tcin <= '0';
		wait for 100 ns;
		
		ta <= "00000110";
		tb <= "00100000";
		tcin <= '0';
		wait for 100 ns;
		
		ta <= "11111111";
		tb <= "00000001";
		tcin <= '0';
		wait for 100 ns;
		
		ta <= "00111111";
		tb <= "01111111";
		tcin <= '0';
		wait for 100 ns;
		
		ta <= "10000000";
		tb <= "00100010";
		tcin <= '0';
		wait for 100 ns;
		
	end process;
end testbench;