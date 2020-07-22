----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2019 11:30:39 AM
-- Design Name: 
-- Module Name: PC - Behavioral
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
use IEEE.numeric_std.ALL;

USE work.procmem_definitions.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( clk : in STD_ULOGIC;
           rst_n : in STD_ULOGIC;
           pc_in : in STD_ULOGIC_VECTOR(width-1 downto 0);
           pc_en : in STD_ULOGIC;
           pc_out : out STD_ULOGIC_VECTOR(width-1 downto 0));
end PC;

architecture Behavioral of PC is

begin

    proc_pc : process(clk, rst_n)
    variable pc_temp : STD_ULOGIC_VECTOR(width-1 downto 0);
    begin
        if (rst_n = '0') then pc_temp := (others => '0');
        elsif (RISING_EDGE(clk)) then
            if pc_en = '1' then pc_temp := pc_in;
            end if;
        end if;
        
        pc_out <= pc_temp;
        
    end process;

end Behavioral;
