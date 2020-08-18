----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:21:42 01/20/2019 
-- Design Name: 
-- Module Name:    FLAGReg - Behavioral 
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

entity FLAGReg is
    Port ( din : in  STD_LOGIC;
           nRST : in  STD_LOGIC;
           dout : out  STD_LOGIC);
end FLAGReg;

architecture Behavioral of FLAGReg is
    signal douttemp : STD_LOGIC;
begin
    process (din, nRST)
    begin
        if nRST = '0' then
            douttemp <= '0';
        else
            douttemp <= din;
        end if;
    end process;
    dout <= douttemp;

end Behavioral;

