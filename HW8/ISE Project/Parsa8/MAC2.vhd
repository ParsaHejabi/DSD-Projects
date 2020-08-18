----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:34:54 12/12/2018 
-- Design Name: 
-- Module Name:    MAC1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MAC2 is
port 
	(
		inp			: in unsigned(7 downto 0);
		inputID : in integer range 0 to 10;
		clk			: in std_logic;
		rst			: in std_logic;
		result2	: out unsigned (15 downto 0)
	);
end MAC2;

architecture Behavioral of MAC2 is
	signal inp_in : unsigned (7 downto 0);
	signal mult : unsigned (15 downto 0);
	signal aout : unsigned (15 downto 0);
	signal old : unsigned (15 downto 0);
begin

	mult <= inp_in * x"12" when inputID = 0 else
					inp_in * x"61" when inputID = 1 else
					inp_in * x"32" when inputID = 2 else
					inp_in * x"11" when inputID = 3 else
					inp_in * x"A1" when inputID = 4 else
					inp_in * x"F3" when inputID = 5 else
					inp_in * x"E2" when inputID = 6 else
					inp_in * x"FF" when inputID = 7 else
					inp_in * x"91" when inputID = 8 else
					inp_in * x"47" when inputID = 9 else
					inp_in * x"00";
	process (aout, rst)
	begin
		if (rst = '1') then
			old <= (others => '0');
		else
			old <= aout;
		end if;
	end process;
	
	process (clk)
	begin
		if (rising_edge(clk)) then
			inp_in <= inp;
			
			aout <= old + mult;
		end if;
	end process;
	
	result2 <= aout;
					

end Behavioral;

