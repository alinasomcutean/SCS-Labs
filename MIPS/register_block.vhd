----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2019 11:45:50 AM
-- Design Name: 
-- Module Name: register_block - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

use work.procmem_definitions.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register_block is
    Port ( clk : in STD_ULOGIC;
           rst_n : in STD_ULOGIC;
           wen : in STD_uLOGIC; -- write control
           writeport : in STD_ULOGIC_VECTOR (width - 1 downto 0); -- register input
           adrwport : in STD_ULOGIC_VECTOR (regfile_adrsize - 1 downto 0); -- address write
           adrport0 : in STD_ULOGIC_VECTOR (regfile_adrsize - 1 downto 0); -- address port 0
           adrport1 : in STD_ULOGIC_VECTOR (regfile_adrsize - 1 downto 0); -- address port 1
           readport0 : out STD_ULOGIC_VECTOR (width - 1 downto 0); -- output port 0
           readport1 : out STD_ULOGIC_VECTOR (width - 1 downto 0)); -- output port 1
end register_block;

architecture Behavioral of register_block is

SUBTYPE WordT IS std_ulogic_vector(width - 1 DOWNTO 0); -- reg word TYPE
TYPE StorageT IS ARRAY(0 TO regfile_depth - 1) OF WordT; -- reg array TYPE
SIGNAL registerfile : StorageT; -- reg file contents

begin

    -- perform write operation
    process(rst_n, clk)
    begin
        if rst_n = '0' then 
            for i in 0 to regfile_depth - 1 loop
                registerfile(i) <= (others => '0');
            end loop;
        elsif rising_edge(clk) then
            if wen = '1' then
                registerfile(to_integer(unsigned(adrwport))) <= writeport;
            end if;
        end if;
    end process;
    
    -- perform reading ports
    readport0 <= registerfile(to_integer(unsigned(adrport0)));
    readport1 <= registerfile(to_integer(unsigned(adrport1)));

end Behavioral;
