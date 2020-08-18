----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:17:58 01/20/2019 
-- Design Name: 
-- Module Name:    top_module - Behavioral 
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

entity top_module is
    Port ( CLK : in  STD_LOGIC;
           FGI, FGO : in STD_LOGIC;
           ALUfunc : out STD_LOGIC_VECTOR (3 downto 0);
           ACval : out STD_LOGIC_VECTOR (15 downto 0);
           nRST : in  STD_LOGIC);
end top_module;

architecture Behavioral of top_module is

    component CP is
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
    end component;

    component DP is
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
    end component;

    signal IReg : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    --signal ACval, DRval : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal ACvalt : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal DRval : STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
    signal Eval : STD_LOGIC := '0';

    signal ArbiterSEL : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal ARnRST, PCnRST, DRnRST, EnRST, ACnRST, INPRnRST, IRnRST, RegBanknRST, OUTRnRST : STD_LOGIC := '0';
    signal ARLD, PCLD, DRLD, ACLD, INPRLD, IRLD, OUTRLD : STD_LOGIC := '0';
    signal ARInc, PCInc, DRInc, ACInc, INPRInc, IRInc, OUTRInc : STD_LOGIC := '0';
    signal Ecmpl, ACcmpl : STD_LOGIC := '0';
    --signal ALUfunc : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal ALUfunct : STD_LOGIC_VECTOR (3 downto 0) := "0000";
    signal DRMUXSel, ACMUXSel : STD_LOGIC := '0';
    signal MemWR, MemRE : STD_LOGIC := '0';
    signal RegBankaddr : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal RegBankRW : STD_LOGIC := '0';
    signal RegBankImmVal : STD_LOGIC_VECTOR (7 downto 0) := "00000000";
    signal RegBankImmEn : STD_LOGIC := '0';

begin

    CPComp : CP port map (
        CLK,
        nRST,
        IReg,
        ACvalt, DRval,
        Eval,
        FGI, FGO,
        ArbiterSEL,
        ARnRST, PCnRST, DRnRST, EnRST, ACnRST, INPRnRST, IRnRST, RegBanknRST, OUTRnRST,
        ARLD, PCLD, DRLD, ACLD, INPRLD, IRLD, OUTRLD,
        ARInc, PCInc, DRInc, ACInc, INPRInc, IRInc, OUTRInc,
        Ecmpl, ACcmpl,
        ALUfunct,
        DRMUXSel, ACMUXSel,
        MemWR, MemRE,
        RegBankaddr,
        RegBankRW,
        RegBankImmVal,
        RegBankImmEn
    );

    DPComp : DP port map (
        CLK,
        ArbiterSEL,
        ARnRST, PCnRST, DRnRST, EnRST, ACnRST, INPRnRST, IRnRST, RegBanknRST, OUTRnRST,
        ARLD, PCLD, DRLD, ACLD, INPRLD, IRLD, OUTRLD,
        ARInc, PCInc, DRInc, ACInc, INPRInc, IRInc, OUTRInc,
        Ecmpl, ACcmpl,
        ALUfunct,
        DRMUXSel, ACMUXSel,
        MemWR, MemRE,
        RegBankaddr,
        RegBankRW,
        RegBankImmVal,
        RegBankImmEn,
        Eval,
        ACvalt, DRval,
        IReg
    );

    ALUfunc <= ALUfunct;
    ACval <= ACvalt;

end Behavioral;

