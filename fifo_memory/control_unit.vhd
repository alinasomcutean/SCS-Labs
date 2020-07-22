----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2019 10:58:30 PM
-- Design Name: 
-- Module Name: control_unit - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity control_unit is
    Port ( rd : in STD_LOGIC;
           wr : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           empty : out STD_LOGIC;
           full : out STD_LOGIC);
end control_unit;

architecture Behavioral of control_unit is

signal count_write : std_logic_vector(2 downto 0) := "111";
signal count_read : std_logic_vector(2 downto 0) := "000";

begin
    
    process(wr, rd)
    begin
        if (wr = '1') then
            count_write <= count_write - 1;
        end if;
        if(rd = '1') then
            count_read <= count_read + 1;
        end if;
        if (count_write = "111" or count_read = "111") then
            empty <= '1';
        end if;
        if (count_read = "111") then
            full <= '1';
        end if;
    end process;
    

end Behavioral;
