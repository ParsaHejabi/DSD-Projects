library ieee;
use ieee.std_logic_1164.all;

entity Mem_Cntl_tb is
end Mem_Cntl_tb;

architecture Mem_tb of Mem_Cntl_tb is
    component Mem_Cntl is
        port (
            Clk     :   in  std_logic;
            Rst     :   in  std_logic;
            mem     :   in  std_logic;
            Burst   :   in  std_logic;
            rw      :   in  std_logic;
            re      :   out std_logic;
            we      :   out std_logic
        );
    end component;

    signal  Clk     :   std_logic   :=  '0';
    signal  Rst     :   std_logic;
    signal  mem     :   std_logic   :=  '0';
    signal  Burst   :   std_logic   :=  '0';
    signal  rw      :   std_logic   :=  '0';
    signal  re      :   std_logic;
    signal  we      :   std_logic;
begin
    uut: Mem_Cntl port map (Clk, Rst, mem, Burst, rw, re, we);

    process (Clk)
    begin
        Clk <= not Clk after 5 ns;
    end process;

    process
    begin
        Rst <= '1';
        wait for 10 ns;
        Rst <= '0';
        mem <= '1';
        rw <= '1';
        wait for 10 ns;
        burst <= '1';
        wait for 10 ns;
        burst <= '0';
        rw <= '0';
        wait for 10 ns;
        mem <= '0';
        wait;
    end process;
end Mem_tb;
