library ieee;
use ieee.std_logic_1164.all;

entity tb is
end tb;

architecture freqdiv_testbench of tb is
    component Freq_Div 
            port (
                Div_Fact : IN integer;
                Rst : IN std_logic;
                Clk_Ref : IN std_logic;
                Clk_in : IN std_logic;
                Clk_out : OUT std_logic;
                Ready : OUT std_logic
            );
end component;

signal Div_Fact : integer;
signal Rst : std_logic;
signal Clk_Ref : std_logic := '0';
signal Clk_in : std_logic := '0';
signal Clk_out : std_logic;
signal Ready : std_logic := '0';

begin
    uut: entity work.Freq_Div port map (
        Div_Fact => Div_Fact,
        Rst => Rst,
        Clk_Ref => Clk_Ref,
        Clk_in => Clk_in,
        Clk_out => Clk_out,
        Ready => Ready
    );

    clkref_process: process(Clk_Ref)
    begin
        Clk_Ref <= not Clk_Ref after 5 ns;
    end process;

    clkin_process: process(Clk_in)
    begin
        Clk_in <= not Clk_in after 13 ns;
    end process;

    testing: process
    begin
        Rst <= '0';
        Div_Fact <= 2;
        wait;
    end process;
end freqdiv_testbench;