library ieee;
use ieee.std_logic_1164.all;

-- Structural implementation

entity dff is
	port(
		data: in std_logic;
		q, rq: inout std_logic
	);
end dff;

architecture structural of dff is

component clock
	port
	(
		clk: out std_logic
	);
end component;

component nand2
	port
	(
		a, b: in std_logic;
		c: out std_logic
	);
end component;

signal clk, sig1, sig2, sig3: std_logic;

begin
	p1: nand2 port map(data, data, sig1);
	p2:	clock port map(clk);
	p3: nand2 port map(data, clk, sig2);
	p4: nand2 port map(sig1, clk, sig3);
	p5: nand2 port map(sig2, rq, q);
	p6: nand2 port map(sig3, q, rq);

end structural;