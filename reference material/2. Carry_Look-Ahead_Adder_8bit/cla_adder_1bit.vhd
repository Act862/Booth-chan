-- and this is a basic cla-1bit adder for the cla_adder structural implementation

library ieee;
use ieee.std_logic_1164.all;

entity cla_adder_1bit is
	port
	(
		a,b,cin: in std_logic;
		sum: out std_logic;
		p,g: inout std_logic
	);
end cla_adder_1bit;

architecture dataflow of cla_adder_1bit is
begin

	sum <= (a xor b) xor cin;
	
	-- the generate and propagate bits
	p <= a xor b;
	g <= a and b;
end dataflow;