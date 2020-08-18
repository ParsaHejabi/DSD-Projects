library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RAM is
    port (
        RE, WR  :   in  std_logic;
        Data_in :   in  std_logic_vector(7 downto 0);
        Address :   in  std_logic_vector(10 downto 0);
        clk     :   in  std_logic;
        Data_out    :   out     std_logic_vector(7 downto 0)
    );
end RAM;

architecture arch of RAM is

	type mem is array (0 to 2047) of std_logic_vector(7 downto 0);
	signal memory : mem;

begin
	process(clk)
	begin
		if rising_edge(clk) then
			if (WR = '1') and (RE = '1') then
				memory(to_integer(unsigned(Address))) <= Data_in;
			elsif WR = '1' then
				memory(to_integer(unsigned(Address))) <= Data_in;
			else
				Data_out <= memory(to_integer(unsigned(Address)));	-- ITS POSSIBLE TO MAKE BUG BECAUSE ADDRESS IS BINARY
			end if;
		end if;
	end process;
end arch;