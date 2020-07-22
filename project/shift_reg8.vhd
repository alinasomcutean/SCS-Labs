----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2019 10:50:34 AM
-- Design Name: 
-- Module Name: shift_reg8 - Behavioral
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

entity shift_reg8 is
    Port ( clk : in STD_LOGIC;
           enable : in STD_LOGIC;
           input : in STD_LOGIC;
           output : out STD_LOGIC);
end shift_reg8;

architecture Behavioral of shift_reg8 is

signal temp : std_logic_vector(7 downto 0);

begin

    process(clk, enable)
    begin
        if(clk'event and clk = '1') then
            if(enable = '1') then
                for i in 0 to 6 loop
                    temp(i+1) <= temp(i);
                end loop;
                temp(0) <= input;
            end if;
        end if;
    end process;
    
    output <= temp(7);
end Behavioral;
