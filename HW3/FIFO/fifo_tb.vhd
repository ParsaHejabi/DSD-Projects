LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY tb IS
END tb;

ARCHITECTURE fifo_testbench OF tb IS
    COMPONENT FIFO
            PORT(
                Din     :IN     std_logic_vector(7 DOWNTO 0);
                RST,EN  :IN     std_logic;
                CLK     :IN     std_logic;
                DOut    :OUT    std_logic_vector(7 DOWNTO 0)
            );
END COMPONENT;

SIGNAL Din : std_logic_vector(7 DOWNTO 0);
SIGNAL RST : std_logic;
SIGNAL EN : std_logic;
SIGNAL CLK : std_logic := '1';
SIGNAL DOut : std_logic_vector(7 DOWNTO 0);

BEGIN
    UUT : FIFO PORT MAP (
        Din => Din,
        RST => RST,
        EN => EN,
        CLK => CLK,
        DOut => DOut
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
        testloop : for i in 0 to 15 loop
            Din <= std_logic_vector(to_unsigned(i, 8));
            WAIT FOR 10 ns;
        end loop ; -- testloop
        testloop2 : for i in 15 downto 0 loop
            Din <= std_logic_vector(to_unsigned(i, 8));
            WAIT FOR 10 ns;
        end loop ; -- testloop2
        WAIT;
    END PROCESS;
END fifo_testbench;