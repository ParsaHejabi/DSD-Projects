LIBRARY ieee;
use ieee.std_logic_1164.ALL;
use IEEE.std_logic_arith.ALL;
USE STD.TEXTIO.ALL;

ENTITY filEx IS 
	PORT(clk		:IN std_logic;
		 nrst		:IN std_logic;
		 WR			:out std_logic;
		 en			:OUT std_logic;
		 pixel_val	:OUT std_logic_vector(7 DOWNTO 0);
		 Address	:out std_logic_vector(10 downto 0)
		 );
END filEx;
ARCHITECTURE behavioral OF filEx IS
begin

	p_read : process(nrst,clk)
	
		file image_val              : text open read_mode is "image.txt";
		variable row                : line;
		variable data_read          : integer;
		variable data_row_counter   : integer := 0;
		variable line_count 		: integer := 0;
		variable en_var     		: std_logic := '0';
		variable val				: integer := 0;
		begin

		if(nrst='1') then
			en <= '0';
			data_row_counter := 0;			
			line_count := 0;
		elsif (clk'event) AND (clk='1') and (en_var='0') then
			
			WR <= '1';
			data_row_counter := data_row_counter + 1; -- count number of columns
			
			-- read a new line from input file in "row" variable
			if((not endfile(image_val))and(data_row_counter=1)) then
				readline(image_val,row);
				line_count := line_count + 1;
			elsif(endfile(image_val) and (data_row_counter=30)) then
				en_var := '1'; -- image processing start
				WR <= '0'; -- where to put 1 in this? BUG2
			end if;
			
			-- read a data from row in "data_read" variable
			read(row,data_read);
	
			-- convert data to std_logic_vector and write it to target signal
			pixel_val <= conv_std_logic_vector(data_read,8);

			val := (((line_count - 1) * 30) + data_row_counter) - 1;
			Address <= conv_std_logic_vector(val, 11);

			-- check end of line for reading a new line
			if(data_row_counter=30) then
				data_row_counter:=0;
				en <= en_var;
			end if;
		end if;
	end process p_read;
	
end behavioral;