----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2019 10:20:57 AM
-- Design Name: 
-- Module Name: phase_generator - Behavioral
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

entity phase_generator is
    Port ( clk : in STD_LOGIC;
           phase : out STD_LOGIC_VECTOR (2 downto 0));
end phase_generator;

architecture Behavioral of phase_generator is
signal sig_phase : STD_LOGIC_VECTOR(2 downto 0) := "000";

-- 000 => fetch
-- 001 => decode
-- 010 => execute
-- 011 => memory access
-- 100 => write back

begin

    process(clk)
    begin
        if (clk = '1' and clk'event) then
            if (sig_phase = "100") then
                sig_phase <= "000";
            else
                sig_phase <= sig_phase + 1;
            end if;
        end if;
    end process;
    
    phase <= sig_phase;

end Behavioral;
