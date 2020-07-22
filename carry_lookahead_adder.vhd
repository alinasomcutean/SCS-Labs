----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/23/2019 11:07:20 AM
-- Design Name: 
-- Module Name: adder - Behavioral
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

entity adder is
    Port ( a : in STD_LOGIC_VECTOR (3 downto 0);
           b : in STD_LOGIC_VECTOR (3 downto 0);
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC_VECTOR (3 downto 0);
           carry_out : out STD_LOGIC);
end adder;

architecture Behavioral of adder is

signal carry_generate : STD_LOGIC_VECTOR (3 downto 0);
signal carry_propagate : STD_LOGIC_VECTOR (3 downto 0);
signal carry_output : STD_LOGIC_VECTOR (4 downto 0);
signal internal_sum : STD_LOGIC_VECTOR (3 downto 0);

begin

    internal_sum <= a xor b;
    
    G1 : for i in 3 downto 0 generate
        carry_propagate(i) <= a(i) xor b(i);
        carry_generate(i) <= a(i) and b(i);
    end generate;

    carry_output(0) <= carry_in;
    G2 : for i in 3 downto 0 generate
        carry_output(i + 1) <= carry_generate(i) or (carry_propagate(i) and carry_output(i));
    end generate;

    sum(0) <= internal_sum(0) xor carry_in;
    sum(3 downto 1) <= internal_sum(3 downto 1) xor carry_output(3 downto 1);
    carry_out <= carry_output(4);

end Behavioral;
