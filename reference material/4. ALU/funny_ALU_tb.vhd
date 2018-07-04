-- testbench code for funny_ALU implementation
library ieee;
use ieee.std_logic_1164.all;

entity funny_ALU_tb is
end funny_ALU_tb;

architecture testbench of funny_ALU_tb is

-- component declarations
component funny_ALU
	port
	(
		ALUop: in std_logic_vector(1 downto 0);
		a, b: in std_logic_vector(7 downto 0);
		cin: in std_logic;
		zero: out std_logic_vector(1 downto 0);
		result: out std_logic_vector(7 downto 0)
	);
end component;

-- end of component declarations

signal tALUop, tzero: std_logic_vector(1 downto 0);
signal ta, tb, tresult: std_logic_vector(7 downto 0);
signal tcin: std_logic;

-- and now from here, the testbench begins!
begin
	connect: funny_ALU port map(ALUop=>tALUop, a=>ta, b=>tb, cin=>tcin, zero=>tzero, result=>tresult);
	-- let's make a deal
	-- 00: addition
	-- 01: subtraction 
	-- 10: multiplication
	-- 11: comparison
	process
	begin
		-- first example: addition between 18 [10100] and 30 [11110] which must result to binary for of 48, 110000
		tALUop <= "00";
		ta <= "00010010";
		tb <= "00011110";
		tcin <= '0';
		wait for 100 ns;
		
		-- second example: subtraction between 100000 (32) and 10 (2) which must result to 30, 11110
		tALUop <= "01";
		ta <= "00100000";
		tb <= "00000010";
		tcin <= '0';
		wait for 100 ns;
		
		-- third example: comparison between a number and zero
		tALUop <= "11";
		ta <= "00000001";
		tb <= "00000000";
		tcin <= '0';
		wait for 100 ns;
		
		-- final example, multiply two numbers, 12 * 13 = 156
		tALUop <= "10";
		ta <= "00001100";
		tb <= "00001101";
		tcin <= '1';	-- just wanting to show that the carry during the multiplication state won't affect the desired result
		wait for 100 ns;
	end process;
end testbench;