----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:31:55 01/18/2019 
-- Design Name: 
-- Module Name:    MUX2to1 - Behavioral 
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

entity MUX2to1 is
    Port ( din1 : in  STD_LOGIC_VECTOR (15 downto 0);
           din2 : in  STD_LOGIC_VECTOR (15 downto 0);
           SEL : in  STD_LOGIC;
           dout : out  STD_LOGIC_VECTOR (15 downto 0));
end MUX2to1;

architecture Behavioral of MUX2to1 is

begin
    dout <= din1 when (SEL = '0') else din2;
end Behavioral;

