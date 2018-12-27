----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:27:39 12/23/2018 
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
           RST : in  STD_LOGIC);
end top_module;

architecture Behavioral of top_module is

    component CP is
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
    end component;

    component DP is
        Port ( CLK : in STD_LOGIC;
               ArbiterSEL : in STD_LOGIC_VECTOR (2 downto 0);
               ARnRST, PCnRST, DRnRST, ACnRST, IRnRST, TRnRST : in STD_LOGIC;
               ARLD, PCLD, DRLD, ACLD, IRLD, TRLD : in STD_LOGIC;
               ALUfunc : in STD_LOGIC_VECTOR (2 downto 0);
               MemWR, MemRE : in STD_LOGIC;
               PCInc : in STD_LOGIC;
               IReg : out STD_LOGIC_VECTOR (15 downto 0);
               Eflag : out STD_LOGIC);
    end component;

    signal ArbiterSEL : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal ARnRST, PCnRST, DRnRST, ACnRST, IRnRST, TRnRST : STD_LOGIC := '1';
    signal ARLD, PCLD, DRLD, ACLD, IRLD, TRLD : STD_LOGIC := '0';
    signal ALUfunc : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal MemWR, MemRE : STD_LOGIC := '0';
    signal PCInc : STD_LOGIC := '0';
    signal IReg : STD_LOGIC_VECTOR (15 downto 0);
    signal Eflag : STD_LOGIC;


begin

    CPComp : CP port map (CLK, RST, RST, ArbiterSEL,
    ARnRST, PCnRST, DRnRST, ACnRST, IRnRST, TRnRST,
    ARLD, PCLD, DRLD, ACLD, IRLD, TRLD,
    ALUfunc,
    MemWR, MemRE,
    PCInc,
    IReg,
    Eflag);

    DPComp : DP port map (CLK, ArbiterSEL,
    ARnRST, PCnRST, DRnRST, ACnRST, IRnRST, TRnRST,
    ARLD, PCLD, DRLD, ACLD, IRLD, TRLD,
    ALUfunc,
    MemWR, MemRE,
    PCInc,
    IReg,
    Eflag);
    
end Behavioral;

