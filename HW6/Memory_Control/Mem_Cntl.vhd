library ieee;
use ieee.std_logic_1164.all;

entity Mem_Cntl is
    port (
        Clk     :   in  std_logic;
        Rst     :   in  std_logic;
        mem     :   in  std_logic;
        Burst   :   in  std_logic;
        rw      :   in  std_logic;
        re      :   out std_logic;
        we      :   out std_logic
    );
end Mem_Cntl;

architecture arch of Mem_Cntl is

    type state is (s0, sread, swrite, sburst1, sburst2, sburst3);
    signal  pr_state    :   state;
    signal  nx_state    :   state;
    signal  retemp      :   std_logic   :=  '0';
    signal  wetemp      :   std_logic   :=  '0';
begin

    process (Rst, Clk)
    begin
        if (Rst = '1') then
            pr_state <= s0;
        elsif (Clk'event and Clk = '1') then
            pr_state <= nx_state;
        end if;
    end process;

    process (pr_state, mem, Burst, rw)
    begin
        case( pr_state ) is
        
            when s0 =>
                if (mem = '0') then
                    nx_state <= s0;
                    retemp <= '0';
                    wetemp <= '0';
                elsif (mem = '1' and rw = '0') then
                    nx_state <= swrite;
                    retemp <= '0';
                    wetemp <= '1';
                elsif (mem = '1' and rw = '1') then
                    nx_state <= sread;
                    retemp <= '1';
                    wetemp <= '0';
                end if;
            when sread =>
                if (mem = '0') then
                    nx_state <= s0;
                    retemp <= '0';
                    wetemp <= '0';
                elsif (mem = '1' and rw = '0') then
                    nx_state <= swrite;
                    retemp <= '0';
                    wetemp <= '1';
                elsif (mem = '1' and rw = '1' and Burst = '0') then
                    nx_state <= sread;
                    retemp <= '1';
                    wetemp <= '0';
                elsif (mem = '1' and rw = '1' and Burst = '1') then
                    nx_state <= sburst1;
                    retemp <= '1';
                    wetemp <= '0';
                end if ;
            when swrite =>
                if (mem = '0') then
                    nx_state <= s0;
                    retemp <= '0';
                    wetemp <= '0';
                elsif (mem = '1' and rw = '0') then
                    nx_state <= swrite;
                    retemp <= '0';
                    wetemp <= '1';
                elsif (mem = '1' and rw = '1') then
                    nx_state <= sread;
                    retemp <= '1';
                    wetemp <= '0';                    
                end if;
            when sburst1 =>
                nx_state <= sburst2;
                retemp <= '1';
                wetemp <= '0';
            when sburst2 =>
                nx_state <= sburst3;
                retemp <= '1';
                wetemp <= '0';
            when sburst3 =>
                if (mem = '0') then
                    nx_state <= s0;
                    retemp <= '0';
                    wetemp <= '0';
                elsif (mem = '1' and rw = '0') then
                    nx_state <= swrite;
                    retemp <= '0';
                    wetemp <= '1';
                elsif (mem = '1' and rw = '1') then
                    nx_state <= sread;
                    retemp <= '1';
                    wetemp <= '0';
                end if;
            when others =>
        end case ;
    end process;

    process (Rst, Clk)
    begin
        if (Rst = '1') then
            re <= '0';
            we <= '0';
        elsif (Clk'event and Clk = '1') then
            re <= retemp;
            we <= wetemp;
        end if;
    end process;
end arch;