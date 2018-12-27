----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:32 12/22/2018 
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
    port ( CLK : in STD_LOGIC;
           SCCLR : in STD_LOGIC;
           CLreset : in STD_LOGIC;
           ArbiterSEL : out STD_LOGIC_VECTOR (2 downto 0);
           ARnRST, PCnRST, DRnRST, ACnRST, IRnRST, TRnRST : out STD_LOGIC;
           ARLD, PCLD, DRLD, ACLD, IRLD, TRLD : out STD_LOGIC;
           ALUfunc : out STD_LOGIC_VECTOR (2 downto 0);
           MemWR, MemRE : out STD_LOGIC;
           PCInc : out STD_LOGIC;
           IReg : in STD_LOGIC_VECTOR (15 downto 0);
           Eflag : in STD_LOGIC);
end CP;

architecture Behavioral of CP is

    component Decoder3x8 is
        Port ( din : in  STD_LOGIC_VECTOR (2 downto 0);
               dout : out  STD_LOGIC_VECTOR (7 downto 0));
    end component;

    component SC is
        Port ( CLK : in  STD_LOGIC;
               CLR : in  STD_LOGIC;
               dout : out  STD_LOGIC_VECTOR (2 downto 0));
    end component;

    component ControlLogic is
        Port ( CLK : in STD_LOGIC;
               reset : in STD_LOGIC;
               D0toD7 : in  STD_LOGIC_VECTOR (7 downto 0);
               Iflag : in  STD_LOGIC;
               T0toT7 : in  STD_LOGIC_VECTOR (7 downto 0);
               ArbiterSEL : out  STD_LOGIC_VECTOR (2 downto 0);
               ARnRST : out  STD_LOGIC;
               PCnRST : out  STD_LOGIC;
               DRnRST : out  STD_LOGIC;
               ACnRST : out  STD_LOGIC;
               IRnRST : out  STD_LOGIC;
               TRnRST : out  STD_LOGIC;
               ARLD : out  STD_LOGIC;
               PCLD : out  STD_LOGIC;
               DRLD : out  STD_LOGIC;
               ACLD : out  STD_LOGIC;
               IRLD : out  STD_LOGIC;
               TRLD : out  STD_LOGIC;
               ALUfunc : out  STD_LOGIC_VECTOR (2 downto 0);
               MemWR : out  STD_LOGIC;
               MemRE : out  STD_LOGIC;
               PCInc : out  STD_LOGIC);
    end component;

    signal IRDCDdout, SCDCDdout : STD_LOGIC_VECTOR (7 downto 0);
    signal SCdout : STD_LOGIC_VECTOR (2 downto 0);

begin

    IRDCD : Decoder3x8 port map (IReg(14 downto 12), IRDCDdout);
    SCDCD : Decoder3x8 port map (SCdout, SCDCDdout);
    seqCounter : SC port map (CLK, SCCLR, SCdout);
    CL : ControlLogic port map (CLK, CLreset, IRDCDdout, IReg(15), SCDCDdout, ArbiterSEL, ARnRST, PCnRST, DRnRST, ACnRST, IRnRST, TRnRST, ARLD, PCLD, DRLD, ACLD, IRLD, TRLD, ALUfunc, MemWR, MemRE, PCInc);
    
end Behavioral;

