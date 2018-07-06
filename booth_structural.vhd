--	this is the structural implementation of the booth algorithm
library ieee;
use ieee.std_logic_1164.all;

entity str_booth is
	port
	(
		size: in std_logic_vector(3 downto 0);
		q, m: in std_logic_vector(3 downto 0);
		set_rc: in std_logic;
		result: out std_logic_vector(7 downto 0)
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
		a, b: std_logic_vector(3 downto 0);
		carry_in: std_logic;
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
		a, b: in std_logic_vector(3 downto 0);
		slc: in std_logic_vector(1 downto 0);
		output: out std_logic_vector(3 downto 0)
	);
end component;

component reverse_counter
	port
	(
		number: in std_logic_vector(3 downto 0);
		reset: in std_logic;
		output: out std_logic_vector(3 downto 0);
		zero: out std_logic
	);
end component;

-- signal declarations
signal clk: std_logic;
signal select1, 
--	begin the architecture
begin
	clk_sig: clock port map(clk);	--	we have taken the code
	count: reverse_counter port map(size, set_rc, 
	s1: mux2to1 port map(clk, '0', 