-- multiplier for the alu
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity multiplier is
	port
	(
		a, b: in std_logic_vector(7 downto 0);
--		overflow: out std_logic(7 downto 0);
		o1: out std_logic_vector(7 downto 0)
	);
end multiplier;

architecture dataflow of multiplier is

signal temp: std_logic_vector(15 downto 0);
signal overflow: std_logic_vector(7 downto 0);
begin
	temp <= std_logic_vector(unsigned(a) * unsigned(b));
	o1 <= temp(7 downto 0);
	overflow <= temp(15 downto 8);
end dataflow;