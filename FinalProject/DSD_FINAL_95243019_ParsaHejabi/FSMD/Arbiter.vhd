----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:15:15 01/18/2019 
-- Design Name: 
-- Module Name:    Arbiter - Behavioral 
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

entity Arbiter is
    Port ( DRin : in  STD_LOGIC_VECTOR (15 downto 0);
           DRout : out  STD_LOGIC_VECTOR (15 downto 0);
           ACin : in  STD_LOGIC_VECTOR (15 downto 0);
           IRin : in  STD_LOGIC_VECTOR (15 downto 0);
           IRout : out  STD_LOGIC_VECTOR (15 downto 0);
           RegBankin : in  STD_LOGIC_VECTOR (15 downto 0);
           RegBankout : out  STD_LOGIC_VECTOR (15 downto 0);
           OUTRout : out STD_LOGIC_VECTOR (7 downto 0);
           PCin : in  STD_LOGIC_VECTOR (11 downto 0);
           PCout : out  STD_LOGIC_VECTOR (11 downto 0);
           ARin : in  STD_LOGIC_VECTOR (11 downto 0);
           ARout : out  STD_LOGIC_VECTOR (11 downto 0);
           Memin : in  STD_LOGIC_VECTOR (15 downto 0);
           Memout : out  STD_LOGIC_VECTOR (15 downto 0);
           SEL : in  STD_LOGIC_VECTOR (2 downto 0));
end Arbiter;

architecture Behavioral of Arbiter is

    signal douttemp :   STD_LOGIC_VECTOR(15 downto 0);

begin

    with (SEL) select
        douttemp <= DRin                when    "000",
                    ACin                when    "001",
                    IRin                when    "010",
                    RegBankin           when    "011",
                    ("0000") & PCin     when    "100",
                    ("0000") & ARin     when    "101",
                    Memin               when    "110",
                    DRin                when    others;
    DRout <= douttemp;
    IRout <= douttemp;
    RegBankout <= douttemp;
    OUTRout <= douttemp(7 downto 0);
    PCout <= douttemp(11 downto 0);
    ARout <= douttemp(11 downto 0);
    Memout <= douttemp;

end Behavioral;

