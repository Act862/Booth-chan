library ieee;
use ieee.std_logic_1164.all;

entity cla_adder_16bit is
	port
	(
		a, b: in std_logic_vector(15 downto 0);
		cin: std_logic;
		sum: inout std_logic_vector(15 downto 0);
		cout: inout std_logic
--		special_output: out std_logic_vector(8 downto 0)
	);
end cla_adder_16bit;

-- and now the behavioral architecture
architecture behavioral of cla_adder_16bit is

-- first I am going to declare the necessary signals
signal csum: std_logic_vector(15 downto 0);	-- this is the sum which is calculated
signal generate_bits: std_logic_vector(15 downto 0);	-- the g-bits for each bit
signal propagate_bits: std_logic_vector(15 downto 0);	-- the same with g-bits
signal carry_internal: std_logic_vector(15 downto 1);	-- the collection of carries

begin
	csum <= a xor b;	-- of course, since the logical operations are bit-by-bit
	generate_bits <= a and b;	-- the same as above
	propagate_bits <= a xor b;	-- we could also use or, it's the same
	
	process(generate_bits, propagate_bits, carry_internal)
	begin
		-- we must calculate the first bit of the carry_internal
		carry_internal(1) <= generate_bits(0) or (propagate_bits(0) and cin);
		for i in 1 to 14 loop
			carry_internal(i+1) <= generate_bits(i) or (propagate_bits(i) and carry_internal(i));
		end loop;
		cout <= generate_bits(15) or (propagate_bits(15) and carry_internal(15));
	end process;
	
	sum(0) <= csum(0) xor cin;
	sum(15 downto 1) <= csum(15 downto 1) xor carry_internal(15 downto 1);
	
	-- for a more specified result
--	special_output <= cout & sum(7 downto 0);
end behavioral;