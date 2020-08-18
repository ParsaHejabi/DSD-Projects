LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb IS
END tb;

ARCHITECTURE stack_testbench OF tb IS
    COMPONENT STACK
        PORT (
            Din     :IN std_logic_vector(15 DOWNTO 0);
            PUSH    :IN std_logic;
            POP     :IN std_logic;
            EN, RST :IN std_logic;
            CLK     :IN std_logic;
            DOut    :OUT std_logic_vector(15 DOWNTO 0);
            SP      :OUT std_logic_vector(2 DOWNTO 0); --StackPointer
            EMP     :OUT std_logic;--StackeEmpty
            FUL     :OUT std_logic--StackFull
        );
END COMPONENT;

SIGNAL Din : std_logic_vector(15 DOWNTO 0);
SIGNAL PUSH : std_logic;
SIGNAL POP : std_logic;
SIGNAL EN : std_logic;
SIGNAL RST : std_logic;
SIGNAL CLK : std_logic := '1';
SIGNAL DOut : std_logic_vector(15 DOWNTO 0);
SIGNAL SP : std_logic_vector (2 DOWNTO 0);
SIGNAL EMP : std_logic;
SIGNAL FUL : std_logic;

BEGIN
    UUT : STACK PORT MAP (
        Din => Din,
        PUSH => PUSH,
        POP => POP,
        EN => EN,
        RST => RST,
        CLK => CLK,
        DOut => DOut,
        SP => SP,
        EMP => EMP,
        FUL => FUL
    );

    clk_process: PROCESS(CLK)
    BEGIN
        CLK <= NOT CLK AFTER 5 ns;
    END PROCESS;

    Testing: PROCESS
    BEGIN
        RST <= '1';
        WAIT FOR 5 ns;
        RST <= '0';
        EN <= '1';
        PUSH <= '1';
        testloop : for i in 0 to 7 loop
            Din <= std_logic_vector(to_unsigned(i, 16));
            WAIT FOR 10 ns;
        end loop ; --testloop
        PUSH <= '0';
        POP <= '1';
        WAIT;
    END PROCESS;
END stack_testbench;