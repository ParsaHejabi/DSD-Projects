----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:14:28 12/20/2018 
-- Design Name: 
-- Module Name:    AddressReg - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity AddressReg is
    Port ( din : in  STD_LOGIC_VECTOR (11 downto 0);
           dout : out  STD_LOGIC_VECTOR (11 downto 0);
           CLK : in  STD_LOGIC;
           load : in  STD_LOGIC;
           nRST : in  STD_LOGIC);
end AddressReg;

architecture Behavioral of AddressReg is
    signal douttemp : STD_LOGIC_VECTOR(11 downto 0);
begin
    process(CLK, nRST)
    begin
        if nRST = '0' then
            douttemp <= "000000000000";
        elsif rising_edge(CLK) then
            if load = '1' then
                douttemp <= din;
            end if;
        end if;
    end process;

    dout <= douttemp;

end Behavioral;

