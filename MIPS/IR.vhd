----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2019 11:37:24 AM
-- Design Name: 
-- Module Name: IR - Behavioral
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

entity IR is
    Port ( clk : in STD_ULOGIC;
           rst_n : in STD_ULOGIC;
           memdata : in STD_ULOGIC_VECTOR (width-1 downto 0);
           IRWrite : in STD_ULOGIC;
           instr_31_26 : out STD_ULOGIC_VECTOR (5 downto 0);
           instr_25_21 : out STD_ULOGIC_VECTOR (4 downto 0);
           instr_20_16 : out STD_ULOGIC_VECTOR (4 downto 0);
           instr_15_0 : out STD_ULOGIC_VECTOR (15 downto 0));
end IR;

architecture Behavioral of IR is

begin

    proc_instreg : process(clk, rst_n)
    begin
        if rst_n = '0' then
            instr_31_26 <= (others => '0');
            instr_25_21 <= (others => '0');
            instr_20_16 <= (others => '0');
            instr_15_0 <= (others => '0');
        elsif RISING_EDGE(clk) then
            -- write the output of the memory into the instruction register
            if(IRWrite = '1') then
                instr_31_26 <= memdata(31 downto 26);
                instr_25_21 <= memdata(25 downto 21);
                instr_20_16 <= memdata(20 downto 16);
                instr_15_0 <= memdata(15 downto 0);
            end if;
        end if;
    end process;

end Behavioral;
