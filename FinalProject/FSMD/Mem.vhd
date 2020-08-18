----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:12:34 01/18/2019 
-- Design Name: 
-- Module Name:    Mem - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Mem is
    Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
           dout : out  STD_LOGIC_VECTOR (15 downto 0);
           addr : in  STD_LOGIC_VECTOR (11 downto 0);
           WR : in  STD_LOGIC;
           RE : in  STD_LOGIC;
           CLK : in STD_LOGIC);
end Mem;

architecture Behavioral of Mem is

    type memtype is array (0 to 4095) of STD_LOGIC_VECTOR(15 downto 0);
    signal memory : memtype := (    
                                    --1
                                    0 => "0011100000000000", -- LDA 2048
                                    1 => "1000100000000000", -- SHL
                                    2 => "0100100000000000", -- STA 2048
                                    3 => "0011100000000001", -- LDA 2049
                                    4 => "1000010000000000", -- SHR
                                    5 => "0100100000000001", -- STA 2049
                                    --2
                                    6 => "0011100000000000", -- LDA 2048
                                    7 => "1000100000000000", -- SHL
                                    8 => "0100100000000000", -- STA 2048
                                    9 => "0011100000000001", -- LDA 2049
                                    10 => "1000010000000000", -- SHR
                                    11 => "0100100000000001", -- STA 2049
                                    --3
                                    12 => "0011100000000000", -- LDA 2048
                                    13 => "0000100000000010", -- ADD 2050
                                    14 => "0100100000000010", -- STA 2050
                                    15 => "0011100000000000", -- LDA 2048
                                    16 => "1000100000000000", -- SHL
                                    17 => "0100100000000000", -- STA 2048
                                    18 => "0011100000000001", -- LDA 2049
                                    19 => "1000010000000000", -- SHR
                                    20 => "0100100000000001", -- STA 2049
                                    --4
                                    21 => "0011100000000000", -- LDA 2048
                                    22 => "0000100000000010", -- ADD 2050
                                    23 => "0100100000000010", -- STA 2050
                                    24 => "0011100000000000", -- LDA 2048
                                    25 => "1000100000000000", -- SHL
                                    26 => "0100100000000000", -- STA 2048
                                    27 => "0011100000000001", -- LDA 2049
                                    28 => "1000010000000000", -- SHR
                                    29 => "0100100000000001", -- STA 2049

                                    2048 => "0000000000001001", -- 9
                                    2049 => "0000000000001100", -- 12
                                    2050 => "0000000000000000", -- product
                                    others => (others => '0')
                                );

begin
    process(CLK, addr, memory) is
        begin
            if rising_edge(CLK) then
                if (WR = '1') and (RE = '1') then
                    memory(to_integer(unsigned(addr))) <= din;
                elsif (WR = '1') then
                    memory(to_integer(unsigned(addr))) <= din;
                end if;
            end if;
            dout <= memory(to_integer(unsigned(addr)));
    end process;

end Behavioral;

