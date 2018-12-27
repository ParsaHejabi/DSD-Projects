----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:32:44 12/20/2018 
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
    signal memory : memtype := ( 0 => "0111100000000000", 1 => "0100000000000000", 2 => "0000100000000001", 3 => "0100000000000000", 4 => "0001100000000001", 2048 => X"0009", 2049 => X"0005", 2050 => X"0001",
    others => (others => '0'));

begin

    process(CLK, addr) is
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