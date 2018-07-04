-- and now a structural using only the half adder components
-- i will need 20 signals!! This is a little going overboard!!

library ieee;
use ieee.std_logic_1164.all;

entity full_adder_4bit_ha is
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		cin: in std_logic;
		sum: inout std_logic_vector(4 downto 0);
		carry: inout std_logic
	);
end full_adder_4bit_ha;

architecture structural of full_adder_4bit_ha is

-- component declarations
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
-- signal declarations
signal sig0, sig1, sig2, sig3, sig4, sig5, sig6, sig7, sig8, sig9, sig10, sig11, sig12, sig13, sig14: std_logic;

-- start the connection of components, the structural design
begin
	-- part 1, the first full adder
	phase1: half_adder port map(a(0), b(0), sig0, sig1);
	phase2: half_adder port map(sig0, cin, sum(0), sig2);
	phase3: or2 port map(sig1, sig2, sig3);
	-- part 2, the second full adder
	phase4: half_adder port map(a(1), b(1), sig4, sig5);
	phase5: half_adder port map(sig4, sig3, sum(1), sig6);
	phase6: or2 port map(sig5, sig6, sig7);
	-- part 3, the third full adder
	phase7: half_adder port map(a(2), b(2), sig8, sig9);
	phase8: half_adder port map(sig8, sig7, sum(2), sig10);
	phase9: or2 port map(sig9, sig10, sig11);
	-- part 4, the final full adder
	phase10: half_adder port map(a(3), b(3), sig12, sig13);
	phase11: half_adder port map(sig12, sig11, sum(3), sig14);
	phase12: or2 port map(sig13, sig14, carry);
	
	-- the final bit, the most significant bit
	sum(4) <= carry;
end structural;