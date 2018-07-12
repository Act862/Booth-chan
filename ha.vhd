----------------------------------------------------------------------------------
-- Company: University of Thessaly
-- Engineer: Aristos Karampelas-Timotievits
-- 
-- Create Date: 12.07.2018 09:41:07
-- Design Name: 
-- Module Name: half_adder - Behavioral
-- Project Name: full_adder
-- Target Devices: FPGAs
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

entity half_adder is
    Port ( a : in STD_LOGIC;
           b : in STD_LOGIC;
           sum : out STD_LOGIC;
           cout : out STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is

begin
    sum <= a xor b;
    cout <= a and b;
end Behavioral;
