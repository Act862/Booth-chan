----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.07.2018 09:41:07
-- Design Name: 
-- Module Name: full_adder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
-- Component declarations
component half_adder
    Port (
        a : in STD_LOGIC;
        b : in STD_LOGIC;
        sum : out STD_LOGIC;
        cout : out STD_LOGIC
    );
end component;

-- Signal declarations
signal sig1, sig2, sig3, sig4 : STD_LOGIC;

begin
    p1: half_adder port map(a, b, sig1, sig2);
    p2: half_adder port map(cin, sig1, sum, sig4);
    p3: cout <= sig4 or sig2;

end Behavioral;
