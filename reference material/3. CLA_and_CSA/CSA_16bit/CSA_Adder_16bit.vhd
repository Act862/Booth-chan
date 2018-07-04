-- the final top level
-- 16 bit CSA Adder
library ieee;
use ieee.std_logic_1164.all;

entity CSA_16bit is
	port
	(
		a, b: in std_logic_vector(15 downto 0);
		cin: in std_logic;
		output: inout std_logic_vector(15 downto 0);
		cout: out std_logic
	);
end CSA_16bit;

architecture structural of CSA_16bit is

component CSA_4bit
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		cin: in std_logic;
		output: inout std_logic_vector(3 downto 0);
		cout: out std_logic
	);
end component;

signal c1, c2, c3, c4, c5: std_logic;
signal out1, out2, out3, out4: std_logic_vector(3 downto 0);
signal c: std_logic;
begin
	c <= cin;
	block1: CSA_4bit port map(a(3 downto 0), b(3 downto 0), cin, out1, c1);

--	block2: CSA_4bit port map(a(7 downto 4), b(7 downto 4), cin, out2, c2);
--	block3: CSA_4bit port map(a(11 downto 8), b(11 downto 8), cin, out3, c3);
--	block4: CSA_4bit port map(a(15 downto 12), b(15 downto 12), cin, out4, c4);

-- the basic idea is to create an extra propagate bits calculator, and carry out calculator, in order to produce the outputs.
-- the code above is unable to give the desired result, since the carry in the second level and forward can't be calculated in time
-- the port maps run simultaneously, so the production of the c2, c3, c4 is unable to be done during the same pulse.
-- we could correct this problem by having a separate propagation bits logic which would produce the propagation bits and the cout, so each level is independant.
-- we could use a 4bit CLA for the first level, a 8bit CLA for the second, 12bit for the third and the 16bit for the final, but only keeping the carry output logic
-- the sum output logic is to be remained in simple 4bit CLA adders, or even a different adder.

	output <= out4 & out3 & out2 & out1;
	cout <= c4;
end structural;
	
	