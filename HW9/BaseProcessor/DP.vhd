----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:17:41 12/21/2018 
-- Design Name: 
-- Module Name:    DP - Behavioral 
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

entity DP is
    Port ( CLK : in STD_LOGIC;
           ArbiterSEL : in STD_LOGIC_VECTOR (2 downto 0);
           ARnRST, PCnRST, DRnRST, ACnRST, IRnRST, TRnRST : in STD_LOGIC;
           ARLD, PCLD, DRLD, ACLD, IRLD, TRLD : in STD_LOGIC;
           ALUfunc : in STD_LOGIC_VECTOR (2 downto 0);
           MemWR, MemRE : in STD_LOGIC;
           PCInc : in STD_LOGIC;
           IReg : out STD_LOGIC_VECTOR (15 downto 0);
           Eflag : out STD_LOGIC);
end DP;

architecture Behavioral of DP is

    component Arbiter is
        Port ( DRin : in  STD_LOGIC_VECTOR (15 downto 0);
               DRout : out  STD_LOGIC_VECTOR (15 downto 0);
               ACin : in  STD_LOGIC_VECTOR (15 downto 0);
               IRin : in  STD_LOGIC_VECTOR (15 downto 0);
               IRout : out  STD_LOGIC_VECTOR (15 downto 0);
               TRin : in  STD_LOGIC_VECTOR (15 downto 0);
               TRout : out  STD_LOGIC_VECTOR (15 downto 0);
               PCin : in  STD_LOGIC_VECTOR (11 downto 0);
               PCout : out  STD_LOGIC_VECTOR (11 downto 0);
               ARin : in  STD_LOGIC_VECTOR (11 downto 0);
               ARout : out  STD_LOGIC_VECTOR (11 downto 0);
               Memin : in  STD_LOGIC_VECTOR (15 downto 0);
               Memout : out  STD_LOGIC_VECTOR (15 downto 0);
               SEL : in  STD_LOGIC_VECTOR (2 downto 0));
    end component;

    component ALU is
        Port ( DRdin : in  STD_LOGIC_VECTOR (15 downto 0);
               ACdin : in  STD_LOGIC_VECTOR (15 downto 0);
               func : in  STD_LOGIC_VECTOR (2 downto 0);
               E : out  STD_LOGIC;
               ACdout : out  STD_LOGIC_VECTOR (15 downto 0));
    end component;

    component Mem is
        Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
               dout : out  STD_LOGIC_VECTOR (15 downto 0);
               addr : in  STD_LOGIC_VECTOR (11 downto 0);
               WR : in  STD_LOGIC;
               RE : in  STD_LOGIC;
               CLK : in STD_LOGIC);
    end component;

    component Reg is
        Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
               dout : out  STD_LOGIC_VECTOR (15 downto 0);
               CLK : in  STD_LOGIC;
               load : in  STD_LOGIC;
               nRST : in  STD_LOGIC);
    end component;

    component PCReg is
        Port ( din : in  STD_LOGIC_VECTOR (11 downto 0);
               dout : out  STD_LOGIC_VECTOR (11 downto 0);
               CLK : in  STD_LOGIC;
               load : in  STD_LOGIC;
               nRST : in  STD_LOGIC;
               INC : in  STD_LOGIC);
    end component;

    component AddressReg is
        Port ( din : in  STD_LOGIC_VECTOR (11 downto 0);
               dout : out  STD_LOGIC_VECTOR (11 downto 0);
               CLK : in  STD_LOGIC;
               load : in  STD_LOGIC;
               nRST : in  STD_LOGIC);
    end component;

    signal DRtoBUS, BUStoDR, ACtoBUS, IRtoBUS, BUStoIR, TRtoBUS, BUStoTR, MemtoBUS, BUStoMem : STD_LOGIC_VECTOR (15 downto 0);
    signal PCtoBUS, BUStoPC, ARtoBUS, BUStoAR : STD_LOGIC_VECTOR (11 downto 0);
    signal ALUtoAC : STD_LOGIC_VECTOR (15 downto 0);
begin

    BusArbiter : Arbiter port map (DRtoBUS, BUStoDR, ACtoBUS, IRtoBUS, BUStoIR, TRtoBUS, BUStoTR, PCtoBUS, BUStoPC, ARtoBUS, BUStoAR, MemtoBUS, BUStoMem, ArbiterSEL);
    ALUu : ALU port map (DRtoBUS, ACtoBUS, ALUfunc, Eflag, ALUtoAC);
    RAM : Mem port map (BUStoMem, MemtoBUS, ARtoBUS, MemWR, MemRE, CLK);
    DR : Reg port map (BUStoDR, DRtoBUS, CLK, DRLD, DRnRST);
    AC : Reg port map (ALUtoAC, ACtoBUS, CLK, ACLD, ACnRST);
    IR : Reg port map (BUStoIR, IRtoBUS, CLk, IRLD, IRnRST);
    TR : Reg port map (BUStoTR, TRtoBUS, CLK, TRLD, TRnRST);
    PC : PCReg port map (BUStoPC, PCtoBUS, CLK, PCLD, PCnRST, PCInc);
    AR : AddressReg port map (BUStoAR, ARtoBUS, CLK, ARLD, ARnRST);

    IReg <= IRtoBUS; -- DEBUG
end Behavioral;

