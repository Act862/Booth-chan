-- top level, carry skip
library ieee;
use ieee.std_logic_1164.all;

entity CSA_4bit is
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		cin: in std_logic;
		output: inout std_logic_vector(3 downto 0);
		cout: out std_logic
	);
end CSA_4bit;

architecture structural of CSA_4bit is

component and4
	port
	(
		i1, i2, i3, i4: in std_logic;
		o1: out std_logic
	);
end component;

component mux2_to_1
	port
	(
		a, b: in std_logic;
		slc: in std_logic;
		output: out std_logic
	);
end component;

component cla_adder_4bit
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		cin: std_logic;
		sum: inout std_logic_vector(3 downto 0);
		cout: inout std_logic;
		propagate_out: inout std_logic_vector(3 downto 0)
	);
end component;

signal pout: std_logic_vector(3 downto 0);
signal temp_carry, slc: std_logic;
begin

	basic: cla_adder_4bit port map(a, b, cin, output, temp_carry, pout);
	-- now we have the propagation bits in the pout, and the basic carry
	slc_gen: and4 port map(pout(0), pout(1), pout(2), pout(3), slc);
	-- and we also have the selection signal for the mux
	mux: mux2_to_1 port map(cin, temp_carry, slc, cout);
end structural;