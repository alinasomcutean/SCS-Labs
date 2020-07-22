----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2019 11:21:03 AM
-- Design Name: 
-- Module Name: ALU - Behavioral
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

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

-- use package
USE work.procmem_definitions.ALL;

entity ALU is
    port ( a, b : in STD_ULOGIC_VECTOR(width-1 downto 0);
           opcode : in STD_ULOGIC_VECTOR(1 downto 0);
           result : out STD_ULOGIC_VECTOR(width-1 downto 0);
           zero : out STD_ULOGIC);
end ALU;

architecture behave of ALU is

begin

    process(a, b, opcode)
    -- declaration of variables
    variable a_uns : UNSIGNED(width-1 downto 0);
    variable b_uns : UNSIGNED(width-1 downto 0);
    variable r_uns : UNSIGNED(width-1 downto 0);
    variable z_uns : UNSIGNED(0 downto 0);
    
    begin
        -- initialize values
        a_uns := UNSIGNED(a);
        b_uns := UNSIGNED(b);
        r_uns := (others => '0');
        z_uns(0) := '0';
        
        -- select desired operation
        case opcode is
            -- add
            when "00" => r_uns := a_uns + b_uns;
            -- sub
            when "01" => r_uns := a_uns - b_uns;
            -- and
            when "10" => r_uns := a_uns and b_uns;
            -- or
            when "11" => r_uns := a_uns or b_uns;
            -- others
            when others => r_uns := (others => 'X');
        end case;
        
        -- set zero bit if result equals zero
        if (TO_INTEGER(r_uns) = 0) then z_uns(0) := '1';
        else
            z_uns(0) := '0';
        end if;
        
        -- assign variables to output signals
        result <= STD_ULOGIC_VECTOR(r_uns);
        zero <= z_uns(0);
    end process;
    
end behave;