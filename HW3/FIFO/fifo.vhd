LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY FIFO IS
PORT(
    Din     :IN     std_logic_vector(7 DOWNTO 0);
    RST,EN  :IN     std_logic;
    CLK     :IN     std_logic;
    DOut    :OUT    std_logic_vector(7 DOWNTO 0)
);
END FIFO;

ARCHITECTURE fifo OF FIFO IS
    TYPE Q IS ARRAY (15 DOWNTO 0) OF std_logic_vector(7 DOWNTO 0);
    SIGNAL Q1 : Q;
BEGIN
    main:   PROCESS(RST, CLK)
            BEGIN
                IF RST = '1' THEN
                    rst_loop:   FOR i IN 0 TO 15 LOOP
                                    Q1(i) <= "00000000";
                                END LOOP rst_loop;
                ELSIF (rising_edge(CLK) AND EN = '1') THEN
                    DOut <= Q1(15);
                    fifo_loop:  FOR i IN 0 TO 14 LOOP
                                    Q1(i+1) <= Q1(i);
                                END LOOP fifo_loop;
                    Q1(0) <= Din;
                END IF;
                
            END PROCESS main;
END fifo;