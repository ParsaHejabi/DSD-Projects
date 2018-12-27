----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:38:11 12/20/2018 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
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
use IEEE.STD_LOGIC_SIGNED.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( DRdin : in  STD_LOGIC_VECTOR (15 downto 0);
           ACdin : in  STD_LOGIC_VECTOR (15 downto 0);
           func : in  STD_LOGIC_VECTOR (2 downto 0);
           E : out  STD_LOGIC;
           ACdout : out  STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture Behavioral of ALU is
    
    signal  douttemp    :   STD_LOGIC_VECTOR(15 downto 0);
    signal  sum         :   STD_LOGIC_VECTOR(16 downto 0);

begin

    sum <= ("0" & DRdin) + ("0" & ACdin) when func = "110";

    with (func) select
        douttemp    <=  DRdin nand ACdin    when    "000", --NAND
                        DRdin nor ACdin     when    "001", -- NOR
                        DRdin xnor ACdin    when    "010", --XNOR
                        not ACdin           when    "011", -- NOT
                        ACdin(15) & ACdin(15 downto 1)  when    "100", -- SHR
                        ACdin(14 downto 0) & ACdin(15)  when    "101", -- CIL
                        sum(15 downto 0)    when    "110", -- ADD
                        DRdin               when    others;-- LDA
    
    E <= sum(16) when func = "110";
    
    ACdout <= douttemp;

end Behavioral;

