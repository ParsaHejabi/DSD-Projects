--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:05:20 12/12/2018
-- Design Name:   
-- Module Name:   D:/Proj/Parsa8/test_bench.vhd
-- Project Name:  Parsa8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: SOM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY test_bench IS
END test_bench;
 
ARCHITECTURE behavior OF test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT SOM
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         inp : IN  unsigned(7 downto 0);
         neuron : OUT  unsigned(2 downto 0);
         outp : OUT  unsigned(15 downto 0);
         en : in std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal inp : unsigned(7 downto 0) := (others => '0');
   signal en : std_logic := '0';
	type INPARRAY is ARRAY(0 to 9) of unsigned(7 downto 0);
	constant inputs: INPARRAY := (x"12", x"22", x"63", x"78", x"91", x"A2", x"E1", x"D8", x"F5", x"23");

 	--Outputs
   signal neuron : unsigned(2 downto 0);
   signal outp : unsigned(15 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: SOM PORT MAP (
          clk => clk,
          rst => rst,
          inp => inp,
          neuron => neuron,
          outp => outp,
          en => en
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
		 	 variable counter: integer range 0 to 9 := 0;

   begin		
      -- hold reset state for 100 ns.
       -- hold reset state for 100 ns.
		rst <= '1';
      wait for 100 ns;
      rst <= '0';
      en <= '1';
		inp<=inputs(counter);
      wait for clk_period;
		counter := counter + 1;
		inp<= inputs(counter);
		wait for clk_period;
		counter := counter + 1;
		inp<= inputs(counter);
		wait for clk_period;
		counter := counter + 1;
		inp<= inputs(counter);
		wait for clk_period;
		counter := counter + 1;
		inp<= inputs(counter);
		wait for clk_period;
		counter := counter + 1;
		inp<= inputs(counter);
		wait for clk_period;
		counter := counter + 1;
		inp<= inputs(counter);
		wait for clk_period;
		counter := counter + 1;
		inp<= inputs(counter);
		wait for clk_period;
		counter := counter + 1;
		inp<= inputs(counter);
		wait for clk_period;
		counter := counter + 1;
		inp<= inputs(counter);

      -- insert stimulus here 

      wait;
   end process;

END;
