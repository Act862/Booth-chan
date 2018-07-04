library ieee;
use ieee.std_logic_1164.all;

entity cla_adder is
	port
	(
		a, b: in std_logic_vector(7 downto 0);
		cin: std_logic;
		sum: inout std_logic_vector(7 downto 0);
		cout: inout std_logic
--		special_output: out std_logic_vector(8 downto 0)
	);
end cla_adder;

-- and now the behavioral architecture
architecture behavioral of cla_adder is

-- first I am going to declare the necessary signals
signal csum: std_logic_vector(7 downto 0);	-- this is the sum which is calculated
signal generate_bits: std_logic_vector(7 downto 0);	-- the g-bits for each bit
signal propagate_bits: std_logic_vector(7 downto 0);	-- the same with g-bits
signal carry_internal: std_logic_vector(7 downto 1);	-- the collection of carries

begin
	csum <= a xor b;	-- of course, since the logical operations are bit-by-bit
	generate_bits <= a and b;	-- the same as above
	propagate_bits <= a xor b;	-- we could also use or, it's the same
	
	-- comment section for brief explanation
	-- we have a bit sequence for g, for p and for csum, which is the sum calculated during each level
	-- at first, we prepare the adder. Even in the circuit design, the first level is somehow independent from the others
	-- this is because the first level does not receive a carry the way the next levels do ( we don't care if the cin comes from another unit at this point)
	-- for the remaining bits, the next carry must be calculated. The carry of level-0 is cin and the carry of level-1 is the one calculated with the help of cin
	-- up until the 6th bit we continue with the same logic in the for-loop. 
	-- when we reach the 7th, the carry is already calculate during the 6th iteration of for
	-- if the four continued until 7, we would receive a ninth bit, which is out of bounds for this adder
	-- so the overflow or the cout is the bit which results from the final carry, and its the ninth bit.
	process(generate_bits, propagate_bits, carry_internal)
	begin
		-- we must calculate the first bit of the carry_internal
		carry_internal(1) <= generate_bits(0) or (propagate_bits(0) and cin);
		for i in 1 to 6 loop
			carry_internal(i+1) <= generate_bits(i) or (propagate_bits(i) and carry_internal(i));
		end loop;
		cout <= generate_bits(7) or (propagate_bits(7) and carry_internal(7));
	end process;
	
	sum(0) <= csum(0) xor cin;
	sum(7 downto 1) <= csum(7 downto 1) xor carry_internal(7 downto 1);
	
	-- for a more specified result
--	special_output <= cout & sum(7 downto 0);
end behavioral;