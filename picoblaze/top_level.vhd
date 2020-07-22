----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/06/2019 10:50:53 AM
-- Design Name: 
-- Module Name: top_level - Behavioral
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

entity top_level is
    Port ( clk : in STD_LOGIC;
           switches : in STD_LOGIC_VECTOR (7 downto 0);
           leds : out STD_LOGIC_VECTOR (7 downto 0));
end top_level;

architecture Behavioral of top_level is

--signals for picoblaze component
signal address : std_logic_vector(11 downto 0);
signal instruction : std_logic_vector(17 downto 0);
signal bram_enable : std_logic;
signal in_port : std_logic_vector(7 downto 0);
signal out_port : std_logic_vector(7 downto 0);
signal port_id : std_logic_vector(7 downto 0);
signal write_strobe : std_logic;
signal k_write_strobe : std_logic;
signal read_strobe : std_logic;
signal interrupt : std_logic;
signal interrupt_ack : std_logic;
signal sleep : std_logic;
signal reset : std_logic;

--signal for program memory component
signal enable : std_logic;
signal rdl : std_logic;

--The PicoBlaze core
component kcpsm6
    port (address : out std_logic_vector(11 downto 0);
        instruction : in std_logic_vector(17 downto 0);
        bram_enable : out std_logic;
        in_port : in std_logic_vector(7 downto 0);
        out_port : out std_logic_vector(7 downto 0);
        port_id : out std_logic_vector(7 downto 0);
        write_strobe : out std_logic;
        k_write_strobe : out std_logic;
        read_strobe : out std_logic;
        interrupt : in std_logic;
        interrupt_ack : out std_logic;
        sleep : in std_logic;
        reset : in std_logic;
        clk : in std_logic);
end component;

--The program memory
component simple
    port (address : in std_logic_vector(11 downto 0);
        instruction : out std_logic_vector(17 downto 0);
        enable : in std_logic;
        rdl : out std_logic;
        clk : in std_logic);
end component;

begin

    sleep <= '0';
    interrupt <= '0';
    
    picoblaze : kcpsm6 port map(address, instruction, bram_enable, in_port, out_port, port_id, write_strobe, k_write_strobe, read_strobe, interrupt, interrupt_ack, sleep, reset, clk);
    program_memory : simple port map(address, instruction, enable, rdl, clk);
    -- The inputs connect via a pipelined multiplexer
    input_ports: process(clk)
    begin
        if clk'event and clk='1' then
            case port_id(1 downto 0) is
            -- read simple toggle switches and buttons at address 00 hex
                when "00" => in_port <= switches;
                -- Don't care used for all other addresses to ensure minimum
                -- logic implementation
                when others => in_port <= "XXXXXXXX";
            end case;
        end if;
    end process input_ports;

    -- adding the output registers to the processor at address 80 hex
    output_ports: process(clk)
    begin
        if clk'event and clk='1' then
            if port_id(7)='1' then
                leds <= out_port;
            end if;
        end if;
    end process output_ports;
    
end Behavioral;
