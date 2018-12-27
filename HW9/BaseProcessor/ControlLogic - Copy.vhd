----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:51:24 12/22/2018 
-- Design Name: 
-- Module Name:    ControlLogic - Behavioral 
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

entity ControlLogic is
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
end ControlLogic;

architecture Behavioral of ControlLogic is
    type state is (T0, T1, T2, T3, T4);
    signal pr_state, nx_state : state;

    signal ArbiterSELt : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal ARnRSTt, PCnRSTt, DRnRSTt, ACnRSTt, IRnRSTt, TRnRSTt : STD_LOGIC := '0';
    signal ARLDt, PCLDt, DRLDt, ACLDt, IRLDt, TRLDt : STD_LOGIC := '0';
    signal ALUfunct : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal MemWRt, MemREt : STD_LOGIC := '0';
    signal PCInct : STD_LOGIC := '0';
begin
    process (CLK, reset)
    begin
        if (reset = '1') then
            --ArbiterSEL <= "000";
            --ARnRST <= '0';
            --PCnRST <= '0';
            --DRnRST <= '0';
            --ACnRST <= '0';
            --IRnRST <= '0';
            --TRnRST <= '0';
            --ARLD <= '0';
            --PCLD <= '0';
            --DRLD <= '0';
            --ACLD <= '0';
            --IRLD <= '0';
            --TRLD <= '0';
            --ALUfunc <= "000";
            --MemWR <= '0';
            --MemRE <= '0';
            --PCInc <= '0';
            pr_state <= T0;
        elsif (rising_edge(CLK)) then
            pr_state <= nx_state;
        end if;
    end process;

    process (pr_state, D0toD7, Iflag, T0toT7) -- DEBUG : in sensitivity list doroste?
    begin
        case (pr_state) is

            when T0 =>
                ArbiterSEL <= "100";
                ARnRST <= '1';
                PCnRST <= '1';
                DRnRST <= '1';
                ACnRST <= '1';
                IRnRST <= '1';
                TRnRST <= '1';
                ARLD <= '1';
                PCLD <= '0';
                DRLD <= '0';
                ACLD <= '0';
                IRLD <= '0';
                TRLD <= '0';
                ALUfunc <= "000";
                MemWR <= '0';
                MemRE <= '0';
                PCInc <= '0';
                nx_state <= T1;
            when T1 =>
                MemRE <= '1';
                ArbiterSEL <= "110";
                ARnRST <= '1';
                PCnRST <= '1';
                DRnRST <= '1';
                ACnRST <= '1';
                IRnRST <= '1';
                TRnRST <= '1';
                ARLD <= '0';
                PCLD <= '0';
                DRLD <= '0';
                ACLD <= '0';
                IRLD <= '1';
                TRLD <= '0';
                ALUfunc <= "000";
                MemWR <= '0';
                PCInc <= '1';
                nx_state <= T2;
            when T2 =>
                ArbiterSEL <= "010";
                ARnRST <= '1';
                PCnRST <= '1';
                DRnRST <= '1';
                ACnRST <= '1';
                IRnRST <= '1';
                TRnRST <= '1';
                PCLD <= '0';
                DRLD <= '0';
                ACLD <= '0';
                IRLD <= '0';
                TRLD <= '0';
                ARLD <= '1';
                ALUfunc <= "000";
                MemWR <= '0';
                MemRE <= '0';
                PCInc <= '0';
                nx_state <= T3;
            when T3 =>
                MemRE <= '1';
                ArbiterSEL <= "110";
                DRLD <= '1';
                ARnRST <= '1';
                PCnRST <= '1';
                DRnRST <= '1';
                ACnRST <= '1';
                IRnRST <= '1';
                TRnRST <= '1';
                ARLD <= '0';
                PCLD <= '0';
                ACLD <= '0';
                IRLD <= '0';
                TRLD <= '0';
                ALUfunc <= "000";
                MemWR <= '0';
                PCInc <= '0';
                nx_state <= T4;
            when T4 =>
                case (D0toD7) is
                    when "00000001" =>
                        ALUfunc <= "000";
                    when "00000010" =>
                        ALUfunc <= "001";
                    when "00000100" =>
                        ALUfunc <= "010";
                    when "00001000" =>
                        ALUfunc <= "011";
                    when "00010000" =>
                        ALUfunc <= "100";
                    when "00100000" =>
                        ALUfunc <= "101";
                    when "01000000" =>
                        ALUfunc <= "110";
                    when "10000000" =>
                        ALUfunc <= "111";
                    when others =>
                end case;
                ArbiterSEL <= "100";
                ARnRST <= '1';
                PCnRST <= '1';
                DRnRST <= '1';
                ACnRST <= '1';
                IRnRST <= '1';
                TRnRST <= '1';
                ARLD <= '0';
                PCLD <= '0';
                DRLD <= '0';
                ACLD <= '0';
                IRLD <= '0';
                TRLD <= '0';
                MemWR <= '0';
                MemRE <= '0';
                PCInc <= '0';
                nx_state <= T0;
            when others =>
        end case;
    end process;

end Behavioral;

