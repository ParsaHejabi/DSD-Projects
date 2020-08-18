library ieee;
use ieee.std_logic_1164.all;

entity elev_tb is
end elev_tb;

architecture tb of elev_tb is

    component elev is
        port (
            C0      :   in      std_logic;
            C1      :   in      std_logic;
            C2      :   in      std_logic;
            c3      :   in      std_logic;
            PB0     :   in      std_logic;
            PB1     :   in      std_logic;
            PB2     :   in      std_logic;
            PB3     :   in      std_logic;
            S0      :   in      std_logic;
            S1      :   in      std_logic;
            S2      :   in      std_logic;
            S3      :   in      std_logic;
            res     :   in      std_logic;
            clk     :   in      std_logic;
            HB      :   out     std_logic_vector(1 downto 0);
            op      :   out     std_logic
        );
    end component;

    signal  C0      :std_logic  :=  '0';
    signal  C1      :std_logic  :=  '0';
    signal  C2      :std_logic  :=  '0';
    signal  c3      :std_logic  :=  '0';
    signal  PB0     :std_logic  :=  '0';
    signal  PB1     :std_logic  :=  '0';
    signal  PB2     :std_logic  :=  '0';
    signal  PB3     :std_logic  :=  '0';
    signal  S0      :std_logic  :=  '0';
    signal  S1      :std_logic  :=  '0';
    signal  S2      :std_logic  :=  '0';
    signal  S3      :std_logic  :=  '0';
    signal  res     :std_logic  :=  '0';
    signal  clk     :std_logic  := '0';
    signal  HB      :std_logic_vector(1 downto 0)   :=  "00";
    signal  op      :std_logic  :=  '0';

begin
    uut: elev port map (C0, C1, C2, C3, PB0, PB1, PB2, PB3, S0, S1, S2, S3, res, clk, HB, op);

    process (clk)
    begin
        clk <= not clk after 5 ns;
    end process;

    process
    begin
        res <= '1';
        S0 <= '1';
        wait for 10 ns;
        res <= '0';
        wait for 10 ns;
        C1 <= '1';
        wait for 20 ns;
        C1 <= '0';
        S0 <= '0';
        wait for 10 ns;
        S1 <= '1';
        wait;
    end process;

end tb;