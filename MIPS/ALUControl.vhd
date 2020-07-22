----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/27/2019 08:32:05 AM
-- Design Name: 
-- Module Name: ALUControl..................................... - Behavioral
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

entity ALUControl is
    PORT(instr : in STD_ULOGIC_VECTOR(15 downto 0);
        ALUop : in STD_ULOGIC_VECTOR(1 downto 0);
        ALUopcode : out STD_ULOGIC_VECTOR(2 downto 0));
end ALUControl;

architecture Behavioral of ALUControl is

constant cADD : STD_ULOGIC_VECTOR(5 downto 0) := "100000";
constant cSUB : STD_ULOGIC_VECTOR(5 downto 0) := "100010";
constant cAND : STD_ULOGIC_VECTOR(5 downto 0) := "100100";
constant cOR : STD_ULOGIC_VECTOR(5 downto 0) := "100101";
constant cSLT : STD_ULOGIC_VECTOR(5 downto 0) := "101010";

begin

    process(ALUop)
    begin
        case ALUop is
            when "00" => ALUopcode <= "010";
            when "01" => ALUopcode <= "110";
            when "10" =>
                case instr(5 downto 0) is
                    when cADD => ALUopcode <= "010";
                    when cSUB => ALUopcode <= "110";
                    when cAND => ALUopcode <= "000";
                    when cOR => ALUopcode <= "001";
                    when cSLT => ALUopcode <= "111";
                    when others => ALUopcode <= "000";
                end case;
            when others => ALUopcode <= "000";
        end case;
     end process;

end Behavioral;
