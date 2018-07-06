library ieee;
use ieee.std_logic_1164.all;

entity conc is
port(
	a, b: in std_logic;
	c: out std_logic_vector(1 downto 0)
);
end conc;

architecture dataflow of conc is
begin
	c <= a & b;
end dataflow;