-- testbench for the cla_adder both implementations

library ieee;
use ieee.std_logic_1164.all;

entity cla_adder_16bit_tb is
end cla_adder_16bit_tb;

architecture testbench of cla_adder_16bit_tb is

-- component declarations
component cla_adder_16bit
	port
	(
		a, b: in std_logic_vector(15 downto 0);
		cin: in std_logic;
		sum: inout std_logic_vector(15 downto 0);
		cout: inout std_logic
	);
end component;

-- signal section
signal ta, tb, tsum: std_logic_vector(15 downto 0);
signal tcin, tcout: std_logic;

-- testbench begins here!
begin

-- first to connect the component
	connect: cla_adder_16bit port map(a=>ta, b=>tb, cin=>tcin, sum=>tsum, cout=>tcout);
	
	process
	begin
		ta <= "0000000000000010";
		tb <= "0000000000000011";
		tcin <= '0';
		wait for 100 ns;
		
		ta <= "0000000000000110";
		tb <= "0000000000100000";
		tcin <= '0';
		wait for 100 ns;
		
		ta <= "0000000011111111";
		tb <= "0000000000000001";
		tcin <= '0';
		wait for 100 ns;
		
		ta <= "0000000000111111";
		tb <= "0000000001111111";
		tcin <= '0';
		wait for 100 ns;
		
		ta <= "1111111111111111";
		tb <= "0000000000000001";
		tcin <= '0';
		wait for 100 ns;
		
	end process;
end testbench;