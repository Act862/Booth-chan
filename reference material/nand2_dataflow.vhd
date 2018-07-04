-- Ex.1 a)

-- declaring our libraries

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- declaring our entity
-- a nand gate with two inputs
entity nand2 is
	port
	(
		i1, i2: in std_logic;
		o1: out std_logic
	);
end nand2;

-- and now the architecture

architecture dataflow of nand2 is
	begin
		o1 <= not(i1 and i2);
end dataflow;