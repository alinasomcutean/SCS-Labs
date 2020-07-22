----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 07:57:10 PM
-- Design Name: 
-- Module Name: decoder_1_to_8 - Behavioral
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

entity decoder_1_to_8 is
    Port ( input : in STD_LOGIC_VECTOR (2 downto 0);
           output : out STD_LOGIC_VECTOR (7 downto 0));
end decoder_1_to_8;

architecture Behavioral of decoder_1_to_8 is

begin

    output <= "00000001" when input = "000" else
                "00000010" when input = "001" else
                "00000100" when input = "010" else
                "00001000" when input = "011" else
                "00010000" when input = "100" else
                "00100000" when input = "101" else
                "01000000" when input = "110" else
                "10000000";

end Behavioral;
