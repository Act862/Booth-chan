-- work package #2, full-adder part
-- now using the already existent half_adder component, I am going to create a new adder, the full adder
-- I will need to have an or gate, except for the half adder, which is going to be used two times!!

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port
	(
		a, b, cin: in std_logic;
		sum, carry: out std_logic
	);
end full_adder;

architecture structural of full_adder is
-- component section
component or2
	port
	(
		i1, i2: in std_logic;
		o1: out std_logic
	);
end component;

component half_adder
	port
	(
		a, b: in std_logic;
		s, c: out std_logic
	);
end component;

-- signal section
signal sig_s0, sig_c0, sig_c1: std_logic;

-- start the structural design
begin

	phase1: half_adder port map(a, b, sig_s0, sig_c0);
	phase2: half_adder port map(sig_s0, cin, sum, sig_c1);	-- in the second phase, the sum is already produced!, only the carry remaining
	phase3: or2 port map(sig_c0, sig_c1, carry);

end structural;