library ieee;
use ieee.std_logic_1164.all;

ENTITY Freq_Div IS
PORT (
    Div_Fact : IN integer;
    Rst : IN std_logic;
    Clk_Ref : IN std_logic;
    Clk_in : IN std_logic;
    Clk_out : OUT std_logic;
    Ready : OUT std_logic
);
END Freq_Div;

architecture freq_div of Freq_Div is
    signal firstFreq : integer := 0;
    signal flag : boolean := false;
    signal clk_was : std_logic := '0';
    signal clk_is : std_logic := '1';
    signal counter : integer := 1;
    signal newFreq : integer;
    signal newFreqHalf : integer;
    signal clk_out_temp: std_logic := '0';
begin
    main:   process(Rst, Clk_Ref)
            begin
                if rising_edge(Clk_Ref) then
                    clk_was <= clk_is;
                    clk_is <= Clk_in;
                end if ;
                
                if Rst = '1' then
                    Ready <= '0';
                    Clk_out <= '0';
                else
                    if (rising_edge(Clk_Ref) and clk_was = '0' and clk_is = '1' and (not(flag)) and Clk_in = '1') then
                        if firstFreq = 0 then
                            firstFreq <= 1;
                        elsif ((not(firstFreq = 1))) then
                            newFreq <= Div_Fact * firstFreq;
                            newFreqHalf <= newFreq / 2;
                            Ready <= '1';
                            flag <= true;
                        end if ;
                    elsif (rising_edge(Clk_Ref) and (not(flag))) then
                        if (not(firstFreq = 0)) then
                            firstFreq <= firstFreq + 1;
                        end if;
                    elsif (rising_edge(Clk_Ref) and flag) then
                        Ready <= '0';
                        if (counter = newFreq) then
                            counter <= 1;
                            clk_out_temp <= (not (clk_out_temp));
                        elsif counter = newFreqHalf then
                            counter <= counter + 1;
                            clk_out_temp <= (not (clk_out_temp));
                        end if ;
                    end if;
                end if;
                Clk_out <= clk_out_temp; 
            end process main;
end freq_div;