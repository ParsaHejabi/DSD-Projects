LIBRARY ieee;
use ieee.std_logic_1164.ALL;      -- can be different dependent on tool used.
--use ieee.std_logic_unsigned.ALL;  -- can be different dependent on tool used.

ENTITY filEx_test IS 

END filEx_test;
ARCHITECTURE test OF filEx_test IS
	COMPONENT filEx IS
		PORT(clk		:IN std_logic;
			nrst		:IN std_logic;
			en			:OUT std_logic;
			pixel_val	:OUT std_logic_vector(7 DOWNTO 0)
			);
	END COMPONENT;
	
	SIGNAL clk_t:std_logic:='0';
	SIGNAL nrst_t:std_logic;
	SIGNAL en_t:std_logic;
	SIGNAL pixel_val_t:std_logic_vector(7 DOWNTO 0);
begin
	clk_t<=NOT clk_t AFTER 10 ns;
	nrst_t<='0','1' AFTER 33 ns;
	
	tb:filEx PORT MAP(clk_t,nrst_t,en_t,pixel_val_t);
end test;
