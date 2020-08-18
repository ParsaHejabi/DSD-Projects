----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:26:32 01/18/2019 
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
           ARnRST, PCnRST, DRnRST, EnRST, ACnRST, INPRnRST, IRnRST, RegBanknRST, OUTRnRST : in STD_LOGIC;
           ARLD, PCLD, DRLD, ACLD, INPRLD, IRLD, OUTRLD : in STD_LOGIC;
           ARInc, PCInc, DRInc, ACInc, INPRInc, IRInc, OUTRInc : in STD_LOGIC;
           Ecmpl, ACcmpl : in STD_LOGIC;
           ALUfunc : in STD_LOGIC_VECTOR (3 downto 0);
           DRMUXSel, ACMUXSel : in STD_LOGIC;
           MemWR, MemRE : in STD_LOGIC;
           RegBankaddr : in STD_LOGIC_VECTOR (2 downto 0);
           RegBankRW : in STD_LOGIC;
           RegBankImmVal : in STD_LOGIC_VECTOR (7 downto 0);
           RegBankImmEn : in STD_LOGIC;
           Eval : out STD_LOGIC;
           ACval, DRval : out STD_LOGIC_VECTOR (15 downto 0);
           IReg : out STD_LOGIC_VECTOR (15 downto 0));
end DP;

architecture Behavioral of DP is

    component Arbiter is
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
    end component;

    component ALU is
        Port ( DRMuxdin : in  STD_LOGIC_VECTOR (15 downto 0);
               ACMuxdin : in  STD_LOGIC_VECTOR (15 downto 0);
               INPRdin : in STD_LOGIC_VECTOR (7 downto 0);
               func : in  STD_LOGIC_VECTOR (3 downto 0);
               Edin : in STD_LOGIC;
               Edout : out  STD_LOGIC;
               ACdout : out  STD_LOGIC_VECTOR (15 downto 0));
    end component;

    component MUX2to1 is
        Port ( din1 : in  STD_LOGIC_VECTOR (15 downto 0);
               din2 : in  STD_LOGIC_VECTOR (15 downto 0);
               SEL : in  STD_LOGIC;
               dout : out  STD_LOGIC_VECTOR (15 downto 0));
    end component;

    component EReg is
        Port ( din : in  STD_LOGIC;
               nRST : in  STD_LOGIC;
               cmpl : in STD_LOGIC;
               dout : out  STD_LOGIC);
    end component;

    component Mem is
        Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
               dout : out  STD_LOGIC_VECTOR (15 downto 0);
               addr : in  STD_LOGIC_VECTOR (11 downto 0);
               WR : in  STD_LOGIC;
               RE : in  STD_LOGIC;
               CLK : in STD_LOGIC);
    end component;

    component RegBank is
        Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
               addr : in  STD_LOGIC_VECTOR (2 downto 0);
               RW : in  STD_LOGIC;
               CLK : in  STD_LOGIC;
               nRST : in  STD_LOGIC;
               immediateVal : in STD_LOGIC_VECTOR (7 downto 0);
               immediateEn : in STD_LOGIC;
               dout : out  STD_LOGIC_VECTOR (15 downto 0));
        
    end component;

    component Reg is
        Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
               dout : out  STD_LOGIC_VECTOR (15 downto 0);
               CLK : in  STD_LOGIC;
               load : in  STD_LOGIC;
               nRST : in  STD_LOGIC;
               INC : in  STD_LOGIC);
    end component;

    component Reg12 is
        Port ( din : in  STD_LOGIC_VECTOR (11 downto 0);
               dout : out  STD_LOGIC_VECTOR (11 downto 0);
               CLK : in  STD_LOGIC;
               load : in  STD_LOGIC;
               nRST : in  STD_LOGIC;
               INC : in  STD_LOGIC);
    end component;

    component ACReg is
        Port ( din : in  STD_LOGIC_VECTOR (15 downto 0);
               dout : out  STD_LOGIC_VECTOR (15 downto 0);
               CLK : in  STD_LOGIC;
               load : in  STD_LOGIC;
               nRST : in  STD_LOGIC;
               cmpl : in STD_LOGIC;
               INC : in  STD_LOGIC);
    end component;

    component INPReg is
        Port ( dout : out  STD_LOGIC_VECTOR (7 downto 0);
               CLK : in  STD_LOGIC;
               load : in  STD_LOGIC;
               nRST : in  STD_LOGIC;
               INC : in  STD_LOGIC);
    end component;

    component OUTReg is
        Port ( din : in  STD_LOGIC_VECTOR (7 downto 0);
               CLK : in  STD_LOGIC;
               load : in  STD_LOGIC;
               nRST : in  STD_LOGIC;
               INC : in  STD_LOGIC);
    end component;

    signal DRtoBUS, BUStoDR, ACtoBUS, IRtoBUS, BUStoIR, RegBanktoBUS, BUStoRegBank, MemtoBUS, BUStoMem : STD_LOGIC_VECTOR (15 downto 0);
    signal ARtoBUS, BUStoAR, PCtoBUS, BUStoPC : STD_LOGIC_VECTOR (11 downto 0);
    signal BUStoOUTR : STD_LOGIC_VECTOR (7 downto 0);
    signal DRMUXtoAC, ACMUXtoAC : STD_LOGIC_VECTOR (15 downto 0);
    signal ALUtoE, EtoALU : STD_LOGIC;
    signal ALUtoAC : STD_LOGIC_VECTOR (15 downto 0);
    signal INPRtoALU : STD_LOGIC_VECTOR (7 downto 0);

begin

    BusArbiter : Arbiter port map (DRtoBUS, BUStoDR, ACtoBUS, IRtoBUS, BUStoIR, RegBanktoBUS, BUStoRegBank, BUStoOUTR, PCtoBUS, BUStoPC, ARtoBUS, BUStoAR, MemtoBUS, BUStoMem, ArbiterSEL);
    ALUu : ALU port map (DRMUXtoAC, ACMUXtoAC, INPRtoALU, ALUfunc, EtoALU, ALUtoE, ALUtoAC);
    DRMUX : MUX2to1 port map (DRtoBUS, RegBanktoBUS, DRMUXSel, DRMUXtoAC);
    ACMUX : MUX2to1 port map (RegBanktoBUS, ACtoBUS, ACMUXSel, ACMUXtoAC);
    Eflag : EReg port map (ALUtoE, EnRSt, Ecmpl, EtoALU);
    RAM : Mem port map (BUStoMem, MemtoBUS, ARtoBUS, MemWR, MemRE, CLK);
    RegisterBank : RegBank port map (BUStoRegBank, RegBankaddr, RegBankRW, CLK, RegBanknRST, RegBankImmVal, RegBankImmEn, RegBanktoBUS);
    DR : Reg port map (BUStoDR, DRtoBUS, CLK, DRLD, DRnRST, DRInc);
    IR : Reg port map (BUStoIR, IRtoBUS, CLK, IRLD, IRnRST, IRInc);
    AR : Reg12 port map (BUStoAR, ARtoBUS, CLK, ARLD, ARnRST, ARInc);
    PC : Reg12 port map (BUStoPC, PCtoBUS, CLK, PCLD, PCnRST, PCInc);
    AC : ACReg port map (ALUtoAC, ACtoBUS, CLK, ACLD, ACnRST, ACcmpl, ACInc);
    INPR : INPReg port map (INPRtoALU, CLK, INPRLD, INPRnRST, INPRInc);
    OUTR : OUTReg port map (BUStoOUTR, CLK, OUTRLD, OUTRnRST, OUTRInc);

    IReg <= IRtoBUS; -- DEBUG
    ACval <= ACtoBUS;
    DRval <= DRtoBUS;
    Eval <= EtoALU;
end Behavioral;

