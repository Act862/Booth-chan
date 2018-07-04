-- two port nand gate
library ieee;
use ieee.std_logic_1164.all;

entity nand2 is
	port(
		a, b: in std_logic;
		c: out std_logic);
end nand2;

architecture dataflow of nand2 is
begin
	c <= not(a and b);
end dataflow;
	