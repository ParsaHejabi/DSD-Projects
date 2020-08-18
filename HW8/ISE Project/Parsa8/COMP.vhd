----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:36:03 12/12/2018 
-- Design Name: 
-- Module Name:    COMP - Behavioral 
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

entity COMP is
port (
    inp1, inp2, inp3, inp4:in unsigned(15 downto 0);
    max: out unsigned(15 downto 0);
	 maxIndex: out unsigned(2 downto 0)
  );
end COMP;

architecture Behavioral of COMP is

begin
	max <= inp1 when inp1>inp2 and inp1>inp3 and inp1>inp4 else
       inp2 when inp2>inp1 and inp2>inp3 and inp2>inp4 else
       inp3 when inp3>inp1 and inp3>inp2 and inp3>inp4 else
       inp4 when inp4>inp1 and inp4>inp2 and inp4>inp3 else
        "0000000000000000";
	maxIndex <= "001" when inp1>inp2 and inp1>inp3 and inp1>inp4 else
       "010" when inp2>inp1 and inp2>inp3 and inp2>inp4 else
       "011" when inp3>inp1 and inp3>inp2 and inp3>inp4 else
       "100" when inp4>inp1 and inp4>inp2 and inp4>inp3 else
        "000";

end Behavioral;

