----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2020 10:34:38 AM
-- Design Name: 
-- Module Name: cache_memory - Behavioral
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

entity cache_memory is
    Port ( address : in STD_LOGIC_VECTOR (15 downto 0);
           data_in : in STD_LOGIC;
           write_enable : in STD_LOGIC;
           clk : in STD_LOGIC;
           data_out : out STD_LOGIC;
           hit_miss : out STD_LOGIC);
end cache_memory;

architecture Behavioral of cache_memory is

signal output : STD_LOGIC;

component comparator is
    Port ( a : in STD_LOGIC_VECTOR (7 downto 0);
           b : in STD_LOGIC_VECTOR (7 downto 0);
           result : out STD_LOGIC);
end component comparator;

begin

    comp : comparator port map(address(15 downto 8), address(7 downto 0), hit_miss);
    
    process(clk)
    begin
        if ( clk'event and clk = '1' ) then
            if ( write_enable = '1') then
                output <= data_in;
            end if;
        end if;
    end process;
    
    data_out <= output;

end Behavioral;
