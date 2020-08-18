library ieee;
use ieee.std_logic_1164.all;

entity reg is
    port (
        clk     :   in  std_logic;
        din     :   in  std_logic;
        clr     :   in  std_logic;
        dout    :   out std_logic
    );
end reg;

architecture arch of reg is
begin
    process (clk)
    variable    doutTemp :   std_logic  :=  '0';
    begin
        if (clk'event and clk = '1') then
            if (clr = '1') then
                doutTemp := '0';
            elsif (din = '1') then
                doutTemp := '1';
            end if ;
        end if ;
        dout <= doutTemp;
    end process;
end arch;