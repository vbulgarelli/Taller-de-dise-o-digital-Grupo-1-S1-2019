----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.03.2019 22:49:05
-- Design Name: 
-- Module Name: TBSum - Behavioral
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

entity TBSum is
    Port ( Co : out STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0)
        );
        signal A : STD_LOGIC_VECTOR (3 downto 0);
        signal B : STD_LOGIC_VECTOR (3 downto 0);
        signal Ci : STD_LOGIC;        
        end TBSum;  


architecture Behavioral of TBSum is

begin

UUT: entity work.Adder port map (A=>A, B=>B, Ci=>Ci, S=>S, Co=>Co);
Ci<= '0', '1' after 60 ns;
A <= "0000", "1000" after 10 ns, "1001" after 20 ns;
B <= "0000", "0001" after 20 ns, "1000" after 40 ns;

end Behavioral;
