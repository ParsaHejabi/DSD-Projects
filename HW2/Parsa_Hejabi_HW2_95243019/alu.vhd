LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all;
USE ieee.numeric_std.all;
USE ieee.numeric_bit.all;

ENTITY alu IS
    PORT (
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
END alu;

ARCHITECTURE alu_dataflow OF alu IS

SIGNAL Z_temp : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL xor_out : STD_LOGIC_VECTOR(15 downto 0);
SIGNAL Sum : STD_LOGIC_VECTOR(16 downto 0);

BEGIN

    Sum <= ("0" & A) + ("0" & B) WHEN OP = "110" ELSE
           ("0" & A) - ("0" & B) WHEN OP = "111";
    
    WITH (OP) SELECT
        Z_temp <=   A NAND B    WHEN "000",
                    A NOR B     WHEN "001",
                    A XNOR B    WHEN "010",
                    NOT A       WHEN "011",
                    A(15) & A(15 downto 1)  WHEN "100",
                    A(14 downto 0) & A(15)  WHEN "101",
                    Sum(15 downto 0)    WHEN "110",
                    Sum(15 downto 0)    WHEN OTHERS;
    
    OV <= Sum(16) XOR A(15) XOR B(15) XOR Sum(15) WHEN OP = "110" ELSE
        (NOT(Sum(15) XOR B(15))) AND (A(15) XOR B(15)) WHEN OP = "111";

    Cout <= Sum(16) WHEN OP = "110" ELSE
            Sum(16) WHEN OP = "111";

    GT <= '1' WHEN A > B ELSE '0';
    EQ <= '1' WHEN A = B ELSE '0';
    LT <= '1' WHEN A < B ELSE '0';
    
    xor_out(0) <= Z_temp(0);
    PARITY_FOR: FOR i IN 1 TO 15 GENERATE
        xor_out(i) <= xor_out(i-1) XOR Z_temp(i);
    end generate PARITY_FOR;
    Par <= NOT xor_out(15);
    
    Z <= Z_temp;

END alu_dataflow;