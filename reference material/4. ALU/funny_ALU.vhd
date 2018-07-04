-- the alu for unsigned 8bit binary numbers
library ieee;
use ieee.std_logic_1164.all;

entity funny_ALU is
	port
	(
		ALUop: in std_logic_vector(1 downto 0);
		a, b: in std_logic_vector(7 downto 0);
		cin: in std_logic;
		zero: out std_logic_vector(1 downto 0);
--		overflow: std_logic_vector(7 downto 0);
		result: out std_logic_vector(7 downto 0)
	);
end funny_ALU;

architecture structural of funny_ALU is
-- component declarations
component cla_adder
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		cin: in std_logic;
		sum: inout std_logic_vector(7 downto 0);
		cout: inout std_logic
	);
end component;

component subtractor
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		cin: in std_logic;
		sum: inout std_logic_vector(7 downto 0)
	);
end component;

component multiplier
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		o1: out std_logic_vector(7 downto 0)
	);
end component;

component comparator
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		res: out std_logic_vector(7 downto 0);
		c: out std_logic_vector(1 downto 0)
	);
end component;
-- end of component declarations

-- signal declarations
signal add_r, sub_r, mul_r, cmp_num: std_logic_vector(7 downto 0);
signal cmp_r: std_logic_vector(1 downto 0);
signal of0, of1: std_logic;

-- and here we are starting the implementation
begin
	-- we have a MUX 4-to-1!
	addition: cla_adder port map(a, b, cin, add_r, of1);
	subtraction: subtractor port map(a, b, cin, sub_r);
	multiplication: multiplier port map(a, b, mul_r);
	comparison: comparator port map(a, b, cmp_num, cmp_r);
	
	result <= add_r when ALUop = "00" else
			sub_r when ALUop = "01" else
			mul_r when ALUop = "10" else
			cmp_num when ALUop = "11";
	zero <= cmp_r;
end structural;
			