library ieee;
use ieee.std_logic_1164.all;

entity mult is
	port
	(
		-- the inputs are
		q, m: in std_logic_vector(3 downto 0);
		
		-- the output is
		r: out std_logic_vector(7 downto 0)
	);
end mult;

architecture behavioral of mult is

-- signal declarations
