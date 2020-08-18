LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all;

ENTITY tb IS
END tb;

ARCHITECTURE alu_testbench OF tb IS
    COMPONENT ALU
        PORT(
            A : IN STD_LOGIC_VECTOR(15 downto 0);
            B : IN STD_LOGIC_VECTOR(15 downto 0);
            OP : IN STD_LOGIC_VECTOR(2 downto 0);
            Z : OUT STD_LOGIC_VECTOR(15 downto 0);
            OV : OUT STD_LOGIC;
            Cout : OUT STD_LOGIC;
            Par : OUT STD_LOGIC;
            GT : OUT STD_LOGIC;
            LT : OUT STD_LOGIC;
            EQ : OUT STD_LOGIC
        );
    END COMPONENT;

    SIGNAL A : STD_LOGIC_VECTOR(15 downto 0);
    SIGNAL B : STD_LOGIC_VECTOR(15 downto 0);
    SIGNAL OP : STD_LOGIC_VECTOR(2 downto 0);
    SIGNAL Z : STD_LOGIC_VECTOR(15 downto 0);
    SIGNAL OV : STD_LOGIC;
    SIGNAL Cout : STD_LOGIC;
    SIGNAL Par : STD_LOGIC;
    SIGNAL GT : STD_LOGIC;
    SIGNAL LT : STD_LOGIC;
    SIGNAL EQ : STD_LOGIC;

BEGIN
    UUT : ALU PORT MAP (
        A => A,
        B => B,
        OP => OP,
        Z => Z,
        OV => OV,
        Cout => Cout,
        Par => Par,
        GT => GT,
        LT => LT,
        EQ => EQ
    );
    
    Testing: PROCESS
    BEGIN
        a <= "0000000000111010";
        b <= "0000000000111111";
        op <= "110";
        
        wait for 20 ns;
        a <= "1111111111111010";
        b <= "0000000000000101";
        
        wait for 20 ns;
        a <= "0111111111111111";
        b <= "0000000000000101";

        wait for 20 ns;
        a <= "1111111111111111";
        b <= "0000000000000101";

        wait for 20 ns;
        a <= "0000000010001010";
        b <= "0000000001111111";
        op <= "111";

        wait for 20 ns;
        a <= "1000101111111111";
        b <= "0111111100110000";

        wait for 20 ns;
        a <= "0000000000110011";
        b <= "0000000000001111";
        op <= "000";

        wait for 20 ns;
        op <= "001";

        wait for 20 ns;
        op <= "010";

        wait for 20 ns;
        op <= "011";

        wait for 20 ns;
        op <= "100";

        wait for 20 ns;
        op <= "101";

        wait for 20 ns;
        a <= "0000000000010101";

        wait for 20 ns;
        a <= "0000000000000011";
        b <= "0000000000000011";

        WAIT;
    END PROCESS;

END alu_testbench;