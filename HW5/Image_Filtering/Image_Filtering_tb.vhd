library ieee;
use ieee.std_logic_1164.all;

entity Image_Filtering_tb is
end Image_Filtering_tb;

architecture if_tb of Image_Filtering_tb is
    component Image_Filtering is
        port (
            Clk     :   in  std_logic;
            Rst     :   in  std_logic;
            Ready   :   out std_logic
        );
    end component;

    signal Clk      :   std_logic := '0';
    signal Rst      :   std_logic := '0';
    signal Ready    :   std_logic;

begin
    uut: Image_Filtering port map (Clk, Rst, Ready);

    process (Clk)
    begin
        Clk <= not Clk after 5 ns;
    end process;

    process
    begin
        rst <= '1';
        wait for 10 ns;
        rst <= '0';
        wait;
    end process;

end if_tb;