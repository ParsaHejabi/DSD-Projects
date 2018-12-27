-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY testbench IS
  END testbench;

  ARCHITECTURE behavior OF testbench IS 

  -- Component Declaration
          COMPONENT top_module
          PORT(
                CLK : in  STD_LOGIC;
                RST : in  STD_LOGIC
                  );
          END COMPONENT;

          SIGNAL CLK :  std_logic := '1';
          SIGNAL RST :  std_logic := '0';

          -- Clock period definitions
   constant clk_period : time := 10 ns;
          

  BEGIN

  -- Component Instantiation
          uut: top_module PORT MAP(
                  CLK => CLK,
                  RST => RST
          );

     clk_p : PROCESS
     BEGIN
        CLK <= not CLK;
        wait for clk_period/2;
     END PROCESS clk_p;

  --  Test Bench Statements
     tb : PROCESS
     BEGIN
        RST <= '1';
        wait for 100 ns; -- wait until global set/reset completes
        RST <= '0';
        wait for 100 ns;

        wait; -- will wait forever
     END PROCESS tb;
  --  End Test Bench 

  END;
