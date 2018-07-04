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

component complement
	port(
		input: in std_logic_vector(3 downto 0);
		output: out std_logic_vector(3 downto 0)
	);
end component;

-- we could also add instead of a signal acc, a shift register
-- by adding a shift register we could instantly complete both 
-- tasks of saving to register and shifting, for the next check

signal complement_m: std_logic_vector(3 downto 0); --> signal to hold the 10 option of the algorithm
-- signal acc: std_logic_vector(3 downto 0); ---> we need a memory element for this part of the circuit
signal aqqm: std_logic_vector(8 downto 0);	--	produced by other elements, so holds non stable value, no need to be saved
signal qm: std_logic;

