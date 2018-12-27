----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:29:25 12/22/2018 
-- Design Name: 
-- Module Name:    SC - Behavioral 
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

entity SC is
    Port ( CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (2 downto 0));
end SC;

architecture Behavioral of SC is
    signal dout_reg : STD_LOGIC_VECTOR (2 downto 0);
    signal dout_next : STD_LOGIC_VECTOR (2 downto 0);
begin
    process (CLK, CLR)
    begin
        if (CLR = '1') then
            dout_reg <= "000";
        elsif (rising_edge(CLK)) then
            dout_reg <= dout_next;
        end if;
    end process;

    dout_next <= "001" when dout_reg = "000" else
                 "010" when dout_reg = "001" else
                 "011" when dout_reg = "010" else
                 "100" when dout_reg = "011" else
                 "000" when dout_reg = "100";
    dout <= dout_reg;

end Behavioral;

