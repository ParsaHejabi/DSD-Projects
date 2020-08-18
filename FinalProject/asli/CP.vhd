----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:31:40 01/20/2019 
-- Design Name: 
-- Module Name:    CP - Behavioral 
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

entity CP is
    Port ( CLK : in STD_LOGIC;
           nRST : in STD_LOGIC;
           IReg : in STD_LOGIC_VECTOR (15 downto 0);
           ACval, DRval : in STD_LOGIC_VECTOR (15 downto 0);
           Eval : in STD_LOGIC;
           CPtoFGI, CPtoFGO : in STD_LOGIC;
           ArbiterSEL : out STD_LOGIC_VECTOR (2 downto 0);
           ARnRST, PCnRST, DRnRST, EnRST, ACnRST, INPRnRST, IRnRST, RegBanknRST, OUTRnRST : out STD_LOGIC;
           ARLD, PCLD, DRLD, ACLD, INPRLD, IRLD, OUTRLD : out STD_LOGIC;
           ARInc, PCInc, DRInc, ACInc, INPRInc, IRInc, OUTRInc : out STD_LOGIC;
           Ecmpl, ACcmpl : out STD_LOGIC;
           ALUfunc : out STD_LOGIC_VECTOR (3 downto 0);
           DRMUXSel, ACMUXSel : out STD_LOGIC;
           MemWR, MemRE : out STD_LOGIC;
           RegBankaddr : out STD_LOGIC_VECTOR (2 downto 0);
           RegBankRW : out STD_LOGIC;
           RegBankImmVal : out STD_LOGIC_VECTOR (7 downto 0);
           RegBankImmEn : out STD_LOGIC);
end CP;

architecture Behavioral of CP is

    component FLAGReg is
        Port ( din : in  STD_LOGIC;
               nRST : in  STD_LOGIC;
               dout : out  STD_LOGIC);
    end component;

    component ControlLogic is
        Port ( CLK : in STD_LOGIC;
               nRST : in STD_LOGIC;
               IReg : in STD_LOGIC_VECTOR (15 downto 0);
               ACval, DRval : in STD_LOGIC_VECTOR (15 downto 0);
               Eval : in STD_LOGIC;
               FGItoCL, FGOtoCL : in STD_LOGIC;
               FGInRST, FGOnRST : out STD_LOGIC;
               ArbiterSEL : out STD_LOGIC_VECTOR (2 downto 0);
               ARnRST, PCnRST, DRnRST, EnRST, ACnRST, INPRnRST, IRnRST, RegBanknRST, OUTRnRST : out STD_LOGIC;
               ARLD, PCLD, DRLD, ACLD, INPRLD, IRLD, OUTRLD : out STD_LOGIC;
               ARInc, PCInc, DRInc, ACInc, INPRInc, IRInc, OUTRInc : out STD_LOGIC;
               Ecmpl, ACcmpl : out STD_LOGIC;
               ALUfunc : out STD_LOGIC_VECTOR (3 downto 0);
               DRMUXSel, ACMUXSel : out STD_LOGIC;
               MemWR, MemRE : out STD_LOGIC;
               RegBankaddr : out STD_LOGIC_VECTOR (2 downto 0);
               RegBankRW : out STD_LOGIC;
               RegBankImmVal : out STD_LOGIC_VECTOR (7 downto 0);
               RegBankImmEn : out STD_LOGIC);
    end component;

    signal FGItoCLt, FGOtoCLt : STD_LOGIC := '0';
    signal FGInRSTt, FGOnRSTt : STD_LOGIC := '0';

begin

    CL : ControlLogic port map (
        CLK,
        nRST,
        IReg,
        ACval, DRval,
        Eval,
        FGItoCLt, FGOtoCLt,
        FGInRSTt, FGOnRSTt,
        ArbiterSEL,
        ARnRST, PCnRST, DRnRST, EnRST, ACnRST, INPRnRST, IRnRST, RegBanknRST, OUTRnRST,
        ARLD, PCLD, DRLD, ACLD, INPRLD, IRLD, OUTRLD,
        ARInc, PCInc, DRInc, ACInc, INPRInc, IRInc, OUTRInc,
        Ecmpl, ACcmpl,
        ALUfunc,
        DRMUXSel, ACMUXSel,
        MemWR, MemRE,
        RegBankaddr,
        RegBankRW,
        RegBankImmVal,
        RegBankImmEn);
    FGI : FLAGReg port map (CPtoFGI, FGInRSTt, FGItoCLt);
    FGO : FLAGReg port map (CPtoFGO, FGOnRSTt, FGOtoCLt);

end Behavioral;

