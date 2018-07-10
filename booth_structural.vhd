--	this is the structural implementation of the booth algorithm
--	an 8bit multiplier
library ieee;
use ieee.std_logic_1164.all;

entity str_booth is
	port
	(
		nobits: inout std_logic_vector(7 downto 0);
		q, m: in std_logic_vector(7 downto 0);
		set_rc: in std_logic;
		result: out std_logic_vector(15 downto 0)
	);
end str_booth;

architecture structural of str_booth is

-- components
component clock
	port
	(
		clk: out std_logic
	);
end component;

component pipo
	port
	(
		clk, reset: in std_logic;
		data_in: in std_logic_vector(3 downto 0);
		data_out: out std_logic_vector(3 downto 0)
	);
end component;

component right_shifter
	port
	(
		input: in std_logic_vector(8 downto 0);
		output: out std_logic_vector(8 downto 0)
	);
end component;

component mux2to1
	port
	(
		a, b: in std_logic;
		slc: in std_logic;
		output: out std_logic
	);
end component;

component full_adder_4bit
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		result: out std_logic_vector(3 downto 0)
	);
end component;

component subtractor_4bit
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		result: out std_logic_vector(3 downto 0)
	);
end component;

component mux4to1
	port
	(
		a, b, c, d: in std_logic_vector(3 downto 0);
		slc: in std_logic_vector(1 downto 0);
		output: out std_logic_vector(3 downto 0)
	);
end component;

component reverse_counter
	port
	(
		number: in std_logic_vector(7 downto 0);
		clk, reset: in std_logic;
		output: out std_logic_vector(7 downto 0);
		zero: inout std_logic
	);
end component;

-- signals
signal clk, zero: std_logic;
signal count: std_logic_vector(7 downto 0);

-- implementation
begin
	clk_out: clock port map(clk);
	rs: reverse_counter port map(nobits, clk, set_rc, count, zero);
	
end structural;