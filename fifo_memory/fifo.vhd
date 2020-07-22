----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/30/2019 10:40:22 AM
-- Design Name: 
-- Module Name: fifo - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fifo is
    Port ( rd : in STD_LOGIC;
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           wr : in STD_LOGIC;
           wrinc : in STD_LOGIC;
           rdinc : in STD_LOGIC;
           reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0));
end fifo;

architecture Behavioral of fifo is

signal rdptr : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal wrptr : STD_LOGIC_VECTOR(2 downto 0) := "000";
signal decode : STD_LOGIC_VECTOR(7 downto 0);
signal fifo : STD_LOGIC_VECTOR(63 downto 0);
signal multiplexer : STD_LOGIC_VECTOR(7 downto 0);

begin

    read_pointer : process(reset, clk, rdinc)
    begin
        if (reset = '1') then rdptr <= "000";
            if(clk'event and clk = '1') then
                if(rdinc = '1') then rdptr <= rdptr + 1;
                end if;
            end if;
        end if;
    end process;

    write_pointer : process(reset, clk, wrinc)
    begin
        if (reset = '1') then wrptr <= "000";
            if(clk'event and clk = '1') then
                if(wrinc = '1') then wrptr <= wrptr + 1;
                end if;
            end if;
        end if;
    end process;
    
    decoder : process(wrptr)
    begin
        case (wrptr) is 
            when "000" => decode <= "00000001";
            when "001" => decode <= "00000010";
            when "010" => decode <= "00000100";
            when "011" => decode <= "00001000";
            when "100" => decode <= "00010000";
            when "101" => decode <= "00100000";
            when "110" => decode <= "01000000";
            when others => decode <= "10000000";
        end case;
    end process;

    register_set : process(reset, clk, decode)
    begin
        if(reset = '1') then fifo <= "00000000";
            if(clk'event and clk = '1') then 
                if(wr = '1') then
                    case(decode) is
                        when "00000001" => fifo(56 to 63) <= data_in;
                        when "00000010" => fifo(48 to 55) <= data_in;
                        when "00000100" => fifo(40 to 47) <= data_in;
                        when "00001000" => fifo(32 to 39) <= data_in;
                        when "00010000" => fifo(24 to 31) <= data_in;
                        when "00100000" => fifo(16 to 23) <= data_in;
                        when "01000000" => fifo(8 to 15) <= data_in;
                        when "10000000" => fifo(0 to 7) <= data_in;
                        when others => fifo <= "0";
                    end case;
                end if;
            end if;
        end if;
    end process;
    
    mux : process(rdptr, fifo)
    begin
        case rdptr is
            when "000" => multiplexer <= fifo(56 to 63);
            when "001" => multiplexer <= fifo(48 to 55);
            when "010" => multiplexer <= fifo(40 to 47);
            when "011" => multiplexer <= fifo(32 to 39);
            when "100" => multiplexer <= fifo(24 to 31);
            when "101" => multiplexer <= fifo(16 to 23);
            when "110" => multiplexer <= fifo(8 to 15);
            when "111" => multiplexer <= fifo(0 to 7);
            when others => multiplexer <= "0";
        end case;
    end process;
    
    tri_state_buffer : process(rd, multiplexer)
    begin
        if (rd = '0') then data_out <= multiplexer;
        end if;
    end process;
end Behavioral;
