----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/16/2019 11:28:36 AM
-- Design Name: 
-- Module Name: xor_data_flow - Behavioral
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

entity xor_data_flow is
    Port ( input_a : in STD_LOGIC;
           input_b : in STD_LOGIC;
           output : out STD_LOGIC);
end xor_data_flow;

architecture arch1 of xor_data_flow is

begin

    output <= '0' when input_a = input_b else '1';
   
end arch1;

architecture arch2 of xor_data_flow is

begin

    process(input_a, input_b)
    begin
        if input_a = input_b then output <= '0';
        else output <= '1';
        end if;
    end process;
   
end arch2;