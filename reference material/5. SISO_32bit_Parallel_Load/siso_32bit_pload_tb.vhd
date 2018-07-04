-- writing a testbench for the siso_32bit

library ieee;
use ieee.std_logic_1164.all;

entity siso_32bit_pload_tb is
end siso_32bit_pload_tb;

architecture testbench of siso_32bit_pload_tb is

-- component declarations
component siso_32bit_pload
	port
	(
		clk, load, si: in std_logic;
		pi: in std_logic_vector(31 downto 0);
		output: out std_logic_vector(31 downto 0);	-- added just to observe the register value
		so: out std_logic
	);
end component;

-- signal declarations
signal tclk, tload, tsi, tso: std_logic;
signal tpi, toutput: std_logic_vector(31 downto 0);

-- testbench code begins
begin
	connect: siso_32bit_pload port map(clk => tclk, load => tload, si => tsi, pi => tpi, output => toutput, so => tso);
	
	process
	begin
		tclk <= '0';
		tload <= '1';
		tsi <= '1';
		tpi <= "11111111111111111111111111111111";
		wait for 100 ns;
		
		tclk <= '1';
		tload <= '0';
		tsi <= '1';
		wait for 100 ns;
		
		tclk <= '0';
		tload <= '0';
		tsi <= '1';
		wait for 100 ns;
		
		tclk <= '1';
		tload <= '0';
		tsi <= '0';
		wait for 100 ns;
		
		tclk <= '0';
		tload <= '0';
		tsi <= '1';
		wait for 100 ns;
		
		tclk <= '1';
		tload <= '0';
		tsi <= '0';
		wait for 100 ns;
		
		tclk <= '0';
		tload <= '0';
		tsi <= '1';
		wait for 100 ns;
		
		tclk <= '1';
		tload <= '1';
		tsi <= '1';
		wait for 100 ns;
	end process;
end testbench;