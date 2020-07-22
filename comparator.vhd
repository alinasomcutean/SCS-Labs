----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2020 10:36:46 AM
-- Design Name: 
-- Module Name: comparator - Behavioral
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

entity comparator is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           result : out STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

signal r : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
signal comp_result : STD_LOGIC := '1';

begin

    process(a,b)
    begin
        for i in 0 to 7 loop
            if(a(i) = b(i)) then
                r(i) <= '1';
            else
                r(i) <= '0';
            end if;
        end loop;
        
        for i in 0 to 7 loop
            comp_result <= comp_result and r(i);
        end loop;
    end process;
    
    result <= comp_result;
    
end Behavioral;
