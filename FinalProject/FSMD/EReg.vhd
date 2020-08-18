----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:33:03 01/17/2019 
-- Design Name: 
-- Module Name:    EReg - Behavioral 
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

entity EReg is
    Port ( din : in  STD_LOGIC;
           nRST : in  STD_LOGIC;
           cmpl : in STD_LOGIC;
           dout : out  STD_LOGIC);
end EReg;

architecture Behavioral of EReg is
    signal douttemp : STD_LOGIC;
begin
    process (din, nRST, cmpl, douttemp)
    begin
        if nRST = '0' then
            douttemp <= '0';
        else
            if cmpl = '1' then
                douttemp <= not douttemp;
            else
                douttemp <= din;
            end if;
        end if;
    end process;
    dout <= douttemp;
end Behavioral;

