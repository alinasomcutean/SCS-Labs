----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2019 11:33:28 AM
-- Design Name: 
-- Module Name: xor_case_statement - Behavioral
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

entity xor_case_statement is
    Port ( input_a : in STD_LOGIC;
           input_b : in STD_LOGIC;
           output : out STD_LOGIC);
end xor_case_statement;

architecture Behavioral of xor_case_statement is

signal temp : std_logic_vector(1 downto 0);

begin

    temp <= input_a & input_b;
    with temp select
        output <= '0' when "00",
                    '1' when "01",
                    '1' when "10",
                    '0' when "11";

end Behavioral;
