--	this is the structural implementation of the booth algorithm
library ieee;
use ieee.std_logic_1164.all;

entity str_booth is
	port
	(
		size: inout std_logic_vector(3 downto 0);
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
		number: in std_logic_vector(3 downto 0);
		reset: in std_logic;
		output: out std_logic_vector(3 downto 0);
		zero: inout std_logic
	);
end component;

-- signal declarations
signal clk, carry_out: std_logic;
signal qm: std_logic := '0';
signal select1, continue: std_logic;
signal phase_result: std_logic_vector(3 downto 0) := "0000";
signal pipo_out, sub_res, sum_res, A_new: std_logic_vector(3 downto 0);
signal conc: std_logic_vector(8 downto 0);
--	begin the architecture
begin
	clk_sig: clock port map(clk);	--	we have taken the code
	count: reverse_counter port map(size, set_rc, size, continue);
	s1: mux2to1 port map(clk, '0', continue, select1);
	acc: pipo port map(select1, set_rc, phase_result, pipo_out);
	sum: full_adder_4bit port map(pipo_out, m, sum_res); 
	sub: subtractor_4bit port map(pipo_out, m, sub_res);
	c: conc <= pipo_out & q & qm;
	s2: mux4to1 port map(pipo_out, sum_res, sub_res, pipo_out, conc(1 downto 0), A_new);
	c2: conc <= A_new & conc(4 downto 0);
	shift: right_shifter port map(conc, conc);
	phase_result <= conc(8 downto 5);
end structural;