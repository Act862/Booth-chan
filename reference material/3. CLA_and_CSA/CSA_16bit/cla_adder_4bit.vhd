library ieee;
use ieee.std_logic_1164.all;

entity cla_adder_4bit is
	port
	(
		a, b: in std_logic_vector(3 downto 0);
		cin: std_logic;
		sum: inout std_logic_vector(3 downto 0);
		cout: inout std_logic;
		propagate_out: inout std_logic_vector(3 downto 0)
	);
end cla_adder_4bit;

architecture behavioral of cla_adder_4bit is

signal csum: std_logic_vector(3 downto 0);
signal generate_bits: std_logic_vector(3 downto 0);
signal propagate_bits: std_logic_vector(3 downto 0);
signal carry_internal: std_logic_vector(3 downto 1);

begin
	csum <= a xor b;
	generate_bits <= a and b;
	propagate_bits <= a xor b;
	
	process(generate_bits, propagate_bits, carry_internal)
	begin
		carry_internal(1) <= generate_bits(0) or (propagate_bits(0) and cin);
		for i in 1 to 2 loop
			carry_internal(i+1) <= generate_bits(i) or (propagate_bits(i) and carry_internal(i));
		end loop;
		cout <= generate_bits(3) or (propagate_bits(3) and carry_internal(3));
	end process;
	
	sum(0) <= csum(0) xor cin;
	sum(3 downto 1) <= csum(3 downto 1) xor carry_internal(3 downto 1);
	propagate_out <= propagate_bits;
end behavioral;