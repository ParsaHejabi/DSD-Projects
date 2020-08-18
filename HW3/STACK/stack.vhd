LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_arith.all;
USE ieee.std_logic_unsigned.all;

ENTITY STACK IS
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
END STACK;

ARCHITECTURE stack OF STACK IS
    TYPE S IS ARRAY (7 DOWNTO 0) OF std_logic_vector(15 DOWNTO 0);
    SIGNAL S1 : S;
    SIGNAL SPTEMP : std_logic_vector(2 DOWNTO 0) := "000";
    SIGNAL FULTEMP : std_logic;
    SIGNAL EMPTEMP : std_logic;
BEGIN
    main:   PROCESS(RST, CLK)
            BEGIN
                IF RST = '1' THEN
                    rst_loop:   FOR i IN 0 TO 7 LOOP
                                    S1(i) <= "0000000000000000";
                                END LOOP rst_loop;
                ELSIF (rising_edge(CLK) AND EN = '1') THEN
                    IF (PUSH = '1' AND POP = '1') THEN
                        IF (NOT (EMPTEMP = '1')) THEN
                            DOut <= S1(conv_integer(unsigned(SPTEMP)));
                            IF (SPTEMP = "000") THEN
                                SPTEMP <= SPTEMP;
                            ELSE
                                SPTEMP <= SPTEMP - "001";
                            END IF;
                            IF (SPTemp = "000") THEN
                                EMPTEMP <= '1';
                            ELSE
                                EMPTEMP <= '0';
                            END IF;
                        END IF;
                        IF (NOT (FULTEMP = '1')) THEN
                            S1(conv_integer(unsigned(SPTEMP))) <= Din;
                            IF (SPTEMP = "111") THEN
                                SPTEMP <= SPTEMP;
                            ELSE
                                SPTEMP <= SPTEMP + "001";
                            END IF;
                            IF (SPTEMP = "111") THEN
                                FULTEMP <= '1';
                            ELSE
                                FULTEMP <= '0';
                            END IF;
                        END IF;
                    ELSIF (PUSH = '1' AND (NOT (FULTEMP = '1'))) THEN
                        S1(conv_integer(unsigned(SPTEMP))) <= Din;
                        IF (SPTEMP = "111") THEN
                            FULTEMP <= '1';
                        ELSE
                            FULTEMP <= '0';
                            SPTEMP <= SPTEMP + "001";
                        END IF;
                    ELSIF (POP = '1' AND (NOT (EMPTEMP = '1'))) THEN
                        DOut <= S1(conv_integer(unsigned(SPTEMP)));
                        IF (SPTemp = "000") THEN
                            EMPTEMP <= '1';
                        ELSE
                            SPTEMP <= SPTEMP - "001";
                            EMPTEMP <= '0';
                        END IF;
                    END IF;
                END IF;
                FUL <= FULTEMP;
                EMP <= EMPTEMP;
                SP <= SPTEMP;
            END PROCESS main;
END stack;