--	this is the structural implementation of the booth algorithm

library ieee;
use ieee.std_logic_1164.all;

entity strctl_booth is
	port
	(
		--	the inputs are
		q, m: in std_logic_vector(3 downto 0);
		
		--	the outputs are
		result: out std_logic_vector(7 downto 0)
	);
end strctl_booth;

architecture structural of strctl_booth is

--	the components of our circuit are...

--	a clock for synchronization
component clock
	port
	(
		clk: out std_logic
	);
end component;

--	the adder for adding the Accumulator
component full_adder_4bit
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		cin: in std_logic;
		sum: out std_logic_vector(4 downto 0);
		carry: inout std_logic
	);
end component;

signal complement_m: std_logic_vector(3 downto 0);
signal acc: std_logic_vector(3 downto 0);
signal aqqm: std_logic_vector(8 downto 0);
signal qm: std_logic;

