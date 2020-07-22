----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 08:23:37 PM
-- Design Name: 
-- Module Name: BCD_decoder_for_7segment_display - Behavioral
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

entity BCD_decoder_for_7segment_display is
    Port(bcd : in STD_LOGIC_VECTOR(3 DOWNTO 0);
        display : out STD_LOGIC_VECTOR(6 DOWNTO 0));
end BCD_decoder_for_7segment_display;

architecture Behavioral of BCD_decoder_for_7segment_display is

begin

    process(bcd)
    begin
        case bcd is when "0000" => display <= "0000001"; -- 0
                    when "0001" => display <= "1001111"; -- 1
                    when "0010" => display <= "0010010"; -- 2
                    when "0011" => display <= "0000110"; -- 3
                    when "0100" => display <= "1001100"; -- 4
                    when "0101" => display <= "0100100"; -- 5
                    when "0110" => display <= "0100000"; -- 6
                    when "0111" => display <= "0001111"; -- 7
                    when "1000" => display <= "0000000"; -- 8
                    when "1001" => display <= "0000100"; -- 9
                    when "1010" => display <= "0000010"; -- A
                    when "1011" => display <= "1100000"; -- B
                    when "1100" => display <= "0110001"; -- C
                    when "1101" => display <= "1000010"; -- D
                    when "1110" => display <= "0110000"; -- E
                    when "1111" => display <= "0111000"; -- F
        end case;
    end process;

end Behavioral;
