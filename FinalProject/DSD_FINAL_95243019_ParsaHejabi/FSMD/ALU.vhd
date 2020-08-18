----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:17:24 01/17/2019 
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
    Port ( DRMuxdin : in  STD_LOGIC_VECTOR (15 downto 0);
           ACMuxdin : in  STD_LOGIC_VECTOR (15 downto 0);
           INPRdin : in STD_LOGIC_VECTOR (7 downto 0);
           func : in  STD_LOGIC_VECTOR (3 downto 0);
           Edin : in STD_LOGIC;
           Edout : out  STD_LOGIC;
           ACdout : out  STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture Behavioral of ALU is

    signal  douttemp    :   STD_LOGIC_VECTOR(15 downto 0);
    signal  edouttemp   :   STD_LOGIC;
    signal  sum         :   STD_LOGIC_VECTOR(16 downto 0);

begin

    sum <= ("0" & DRMuxdin) + ("0" & ACMuxdin) when func = "0000"; -- ADD

    with (func) select
        douttemp    <=  sum(15 downto 0)        when    "0000",  -- ADD
                        DRMuxdin nand ACMuxdin  when    "0001",  -- NAND
                        not ACMuxdin            when    "0010",  -- NOT ACMuxdin
                        DRMuxdin                when    "0011",  -- LDA
                        ACMuxdin(15) & ACMuxdin(15 downto 1)    when    "0100",  -- SHR
                        ACMuxdin(14 downto 0) & "0"             when    "0101",  -- SHL
                        Edin & ACMuxdin(15 downto 1)            when    "0110",  -- CIR
                        ACMuxdin(14 downto 0) & Edin            when    "0111",  -- CIL
                        "00000000" & INPRdin    when    "1000",  -- INP
                        not DRMuxdin            when    "1001",  -- NOT DRMuxdin
                        DRMuxdin                when    others;

    with (func) select
        edouttemp   <=  sum(16)         when    "0000", -- ADD
                        ACMuxdin(1)     when    "0110", -- CIR
                        ACMuxdin(14)    when    "0111", -- CIL
                        Edin            when    others;
    
    ACdout <= douttemp;
    Edout <= edouttemp;

end Behavioral;

