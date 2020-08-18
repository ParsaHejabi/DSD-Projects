----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:39:38 01/18/2019 
-- Design Name: 
-- Module Name:    RegBank - Behavioral 
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

entity RegBank is
    Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
           addr : in  STD_LOGIC_VECTOR (2 downto 0);
           RW : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           nRST : in  STD_LOGIC;
           immediateVal : in STD_LOGIC_VECTOR (7 downto 0);
           immediateEn : in STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (15 downto 0));
end RegBank;

architecture Behavioral of RegBank is
    
    type bank is array(0 to 7) of STD_LOGIC_VECTOR(15 downto 0);
    signal bankSignal : bank;

begin
    process(CLK, addr, nRST, RW) is
        begin
            if nRST = '0' then
                for i in 0 to 7 loop
                    bankSignal(i) <= "0000000000000000";
                end loop;
            elsif rising_edge(CLK) then
                if (immediateEn = '1') then
                    if (RW = '0') then

                    else
                        dout <= bankSignal(to_integer(unsigned(addr)));
                        bankSignal(to_integer(unsigned(addr))) <= "00000000" & immediateVal;
                    end if;
                else
                    if (RW = '0') then
                        dout <= bankSignal(to_integer(unsigned(addr)));
                    else
                        dout <= bankSignal(to_integer(unsigned(addr)));
                        bankSignal(to_integer(unsigned(addr))) <= din;
                    end if;
                end if;
            end if;
    end process;

end Behavioral;

