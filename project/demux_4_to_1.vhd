----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2019 08:18:10 PM
-- Design Name: 
-- Module Name: demux_1_to_4 - Behavioral
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

entity demux_1_to_4 is
    Port ( input : in STD_LOGIC_VECTOR (3 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           a : out STD_LOGIC_VECTOR (3 downto 0);
           b : out STD_LOGIC_VECTOR (3 downto 0);
           c : out STD_LOGIC_VECTOR (3 downto 0);
           d : out STD_LOGIC_VECTOR (3 downto 0));
end demux_1_to_4;

architecture Behavioral of demux_1_to_4 is

begin

    process(sel, input)
    begin
        case sel is when "00" => a <= input;
                    when "01" => b <= input;
                    when "10" => c <= input;
                    when others => d <= input;
        end case;
    end process;

end Behavioral;
