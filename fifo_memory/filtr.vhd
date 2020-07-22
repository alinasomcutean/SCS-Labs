----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/31/2019 11:33:01 PM
-- Design Name: 
-- Module Name: filtr - Behavioral
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

entity filtr is
    Port ( btn_rd : in STD_LOGIC;
           btn_wr : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           rd : out STD_LOGIC;
           wr : out STD_LOGIC);
end filtr;

architecture Behavioral of filtr is

signal Q1, Q2, Q3 : std_logic;
signal Q4, Q5, Q6 : std_logic;

begin
--**Insert the following after the 'begin' keyword**
    read : process(clk)
    begin
        if (clk'event and clk = '1') then
            if (reset = '1') then
                Q1 <= '0';
                Q2 <= '0';
                Q3 <= '0';
            else
                Q1 <= btn_rd;
                Q2 <= Q1;
                Q3 <= Q2;
            end if;
        end if;
    end process;

    rd <= Q1 and Q2 and (not Q3);
    
    process(clk)
    begin
        if (clk'event and clk = '1') then
            if (reset = '1') then
                Q4 <= '0';
                Q5 <= '0';
                Q6 <= '0';
            else
                Q4 <= btn_wr;
                Q5 <= Q4;
                Q6 <= Q5;
            end if;
        end if;
    end process;

    wr <= Q4 and Q5 and (not Q6);

end Behavioral;
