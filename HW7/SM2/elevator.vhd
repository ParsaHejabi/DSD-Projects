library ieee;
use ieee.std_logic_1164.all;

entity elev is
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
end elev;

architecture arch of elev is

    component reg is
        port (
        clk     :   in  std_logic;
        din     :   in  std_logic;
        clr     :   in  std_logic;
        dout    :   out std_logic
    );
    end component;

    type state is (static0, static1, static2, static3, dyna0, dyna1, dyna2, dyna3);
    signal  pr_state    :   state;
    signal  nx_state    :   state;
    signal  HBtemp      :   std_logic_vector(1 downto 0);
    signal  optemp      :   std_logic;

    signal  C0p     :   std_logic   :=  '0';
    signal  C1p     :   std_logic   :=  '0';
    signal  C2p     :   std_logic   :=  '0';
    signal  C3p     :   std_logic   :=  '0';
    signal  PB0p    :   std_logic   :=  '0';
    signal  PB1p    :   std_logic   :=  '0';
    signal  PB2p    :   std_logic   :=  '0';
    signal  PB3p    :   std_logic   :=  '0';

    signal  C0clr   :   std_logic;
    signal  C1clr   :   std_logic;
    signal  C2clr   :   std_logic;
    signal  C3clr   :   std_logic;
    signal  PB0clr  :   std_logic;
    signal  PB1clr  :   std_logic;
    signal  PB2clr  :   std_logic;
    signal  PB3clr  :   std_logic;

begin

    C0reg:  reg port map (clk, C0, C0clr, C0p);
    C1reg:  reg port map (clk, C1, C1clr, C1p);
    C2reg:  reg port map (clk, C2, C2clr, C2p);
    C3reg:  reg port map (clk, C3, C3clr, C3p);
    PB0reg: reg port map (clk, PB0, PB0clr, PB0p);
    PB1reg: reg port map (clk, PB1, PB1clr, PB1p);
    PB2reg: reg port map (clk, PB2, PB2clr, PB2p);
    PB3reg: reg port map (clk, PB3, PB3clr, PB3p);

    process (res, clk)
    begin
        if (res = '1') then
            pr_state <= static0;
        elsif (clk'event and clk = '1') then
            pr_state <= nx_state;
        end if;
    end process;

    process (pr_state, C0p, C1p, C2p, C3p, PB0p, PB1p, PB2p, PB3p, S0, S1, S2, S3)
        variable status : std_logic_vector(7 downto 0);
        variable arrived: boolean := true;
    begin
        if (arrived = true) then
            status := C0p & C1p & C2p & C3p & PB3p & PB2p & PB1p & PB0p;
        end if ;

        case( pr_state ) is
        
            when static0 =>

                if (status(0) = '1' or status = "00000001" or status = "00000000") then
                    HBtemp <= "00";
                    optemp <= '1';
                    arrived := true;
                    nx_state <= static0;
                else
                    HBtemp <= "01";
                    optemp <= '0';
                    arrived := false;
                    nx_state <= dyna0;
                end if ;

            when static1 =>

                if (status(7 downto 6) = "01" or status(7 downto 1) = "0000001" or status = "00000000") then
                    HBtemp <= "00";
                    optemp <= '1';
                    arrived := true;
                    nx_state <= static1;
                elsif (status(7 downto 5) = "001" or status(7 downto 2) = "000001" or status(7 downto 4) = "0001" or status(7 downto 3) = "00001") then
                    HBtemp <= "01";
                    optemp <= '0';
                    arrived := false;
                    nx_state <= dyna1;
                elsif (status(0) = '1' or status = "00000001") then
                    HBtemp <= "10";
                    optemp <= '0';
                    arrived := false;
                    nx_state <= dyna1;
                end if ;

            when static2 =>

                if (status(7 downto 5) = "001" or status(7 downto 2) = "000001" or status = "00000000") then
                    HBtemp <= "00";
                    optemp <= '1';
                    arrived := true;
                    nx_state <= static2;
                elsif (status(7 downto 6) = "01" or status(7 downto 1) = "0000001" or status(0) = '1' or status = "00000001") then
                    HBtemp <= "10";
                    optemp <= '0';
                    arrived := false;
                    nx_state <= dyna2;
                elsif (status(7 downto 4) = "0001" or status(7 downto 3) = "00001") then
                    HBtemp <= "01";
                    optemp <= '0';
                    arrived := false;
                    nx_state <= dyna2;
                end if ;

            when static3 =>

                if (status(7 downto 4) = "0001" or status(7 downto 3) = "00001" or status = "00000000") then
                    HBtemp <= "00";
                    optemp <= '1';
                    arrived := true;
                    nx_state <= static3;
                else
                    HBtemp <= "10";
                    optemp <= '0';
                    arrived := false;
                    nx_state <= dyna3;
                end if ;

            when dyna0 =>

                if (status(0) = '1' or status = "00000001") then
                    if (S0 = '1') then
                        nx_state <= static0;
                    else
                        nx_state <= dyna0;
                    end if ;
                else
                    if (S0 = '0') then
                        nx_state <= dyna1;
                    else
                        nx_state <= dyna0;
                    end if ;
                end if ;

            when dyna1 =>

                if (status(7 downto 6) = "01" or status(7 downto 1) = "0000001") then
                    if (S1 = '1') then
                        nx_state <= static1;
                    else
                        nx_state <= dyna1;
                    end if ;
                elsif (status(7 downto 5) = "001" or status(7 downto 2) = "000001" or status(7 downto 4) = "0001" or status(7 downto 3) = "00001") then
                    if (S1 = '0') then
                        nx_state <= dyna2;
                    else
                        nx_state <= dyna1;
                    end if ;
                elsif (status(0) = '1' or status = "00000001") then
                    if (S1 = '0') then
                        nx_state <= dyna0;
                    else
                        nx_state <= dyna1;
                    end if ;
                end if ;

            when dyna2 =>

                if (status(7 downto 5) = "001" or status(7 downto 2) = "000001") then
                    if (S2 = '1') then
                        nx_state <= static2;
                    else
                        nx_state <= dyna2;
                    end if ;
                elsif (status(7 downto 6) = "01" or status(7 downto 1) = "0000001" or status(0) = '1' or status = "00000001") then
                    if (S2 = '0') then
                        nx_state <= dyna1;
                    else
                        nx_state <= dyna2;
                    end if ;
                elsif (status(7 downto 4) = "0001" or status(7 downto 3) = "00001") then
                    if (S2 = '0') then
                        nx_state <= dyna3;
                    else
                        nx_state <= dyna2;
                    end if ;
                end if ;

            when dyna3 =>

                if (status(7 downto 4) = "0001" or status(7 downto 3) = "00001") then
                    if (S3 = '1') then
                        nx_state <= static3;
                    else
                        nx_state <= dyna3;
                    end if ;
                else
                    if (S3 = '0') then
                        nx_state <= dyna2;
                    else
                        nx_state <= dyna3;
                    end if ;
                end if ;

            when others =>
        end case ;
    end process;

    process (res, clk)
    begin
        if (res = '1') then
            HB <= "00";
            op <= '0';
            C0clr <= '1';
            C1clr <= '1';
            C2clr <= '1';
            C3clr <= '1';
            PB0clr <= '1';
            PB1clr <= '1';
            PB2clr <= '1';
            PB3clr <= '1';
        elsif (clk'event and clk = '1') then
            HB <= HBtemp;
            op <= optemp;
            C0clr <= '0';
            C1clr <= '0';
            C2clr <= '0';
            C3clr <= '0';
            PB0clr <= '0';
            PB1clr <= '0';
            PB2clr <= '0';
            PB3clr <= '0';
        end if;
    end process;

end arch;