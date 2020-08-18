library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Filter is
    port (
        clk     :   in  std_logic;
        rst     :   in  std_logic;
        Data_in :   in  std_logic_vector(7 downto 0);
        ready   :   out std_logic;
        read_enable :   out std_logic;
        Data_out    :   out std_logic_vector(7 downto 0);
        Address :   out std_logic_vector(10 downto 0);
        WR      :   out std_logic
    );
end Filter;

architecture arch of Filter is
    signal ready_temp   :   std_logic;
    signal re_en_temp   :   std_logic;
    signal Dout_temp    :   std_logic_vector(7 downto 0);
    signal add_temp     :   std_logic_vector(10 downto 0);
	signal wr_temp      :   std_logic;
	
	type nineAdd is array (8 downto 0) of std_logic_vector(10 downto 0);
	signal nAdd			:	nineAdd;
	
	type nineData is array (8 downto 0) of std_logic_vector(7 downto 0);
	signal nData		:	nineData;

	signal mode			:	integer := 0;
	signal ind			:	integer := 0;
	signal indTemp		:	integer := 0;
	signal remain		:	integer := 0;
	signal indX			:	integer := 0;
	signal indY			:	integer := 0;
	signal nineInd		:	integer := 0;
	signal leftCons		:	std_logic := '0';
	signal rightCons	:	std_logic := '0';
	signal upCons		:	std_logic := '0';
	signal downCons		:	std_logic := '0';
	signal newPix		:	std_logic_vector(7 downto 0);
begin
    process (clk, rst)
    begin
        if rst = '1' then
            ready <= '0';
            read_enable <= '0';
            Data_out <= "00000000";
            Address <= "00000000000";
            WR <= '0';
        elsif rising_edge(clk) then
			if ready_temp = '0' then
				-- check to see if we are in process mode or read mode
				if mode = 0 then
					WR <= '0';
					-- write now address in nAdd(4)
					nAdd(4) <= conv_std_logic_vector(ind, 11);
					indTemp <= ind;
					-- calculate x and y in matrix
					indX <= ind rem 30;
					while(indTemp >= 30) loop
						indY <= indY + 1;
						indTemp <= indTemp - 30;
					end loop;

					-- calculate all of addresses
					nAdd(0) <= conv_std_logic_vector(ind - 31, 11);
					nAdd(1) <= conv_std_logic_vector(ind - 30, 11);
					nAdd(2) <= conv_std_logic_vector(ind - 29, 11);
					nAdd(3) <= conv_std_logic_vector(ind - 1, 11);
					nAdd(5) <= conv_std_logic_vector(ind + 1, 11);
					nAdd(6) <= conv_std_logic_vector(ind + 29, 11);
					nAdd(7) <= conv_std_logic_vector(ind + 30, 11);
					nAdd(8) <= conv_std_logic_vector(ind + 31, 11);

					-- check the constraints
					if indX = 0 then
						leftCons <= '1';
						nAdd(0) <= conv_std_logic_vector(2047, 11);
						nAdd(3) <= conv_std_logic_vector(2047, 11);
						nAdd(6) <= conv_std_logic_vector(2047, 11);
					end if ;
					if indX = 29 then
						rightCons <= '1';
						nAdd(2) <= conv_std_logic_vector(2047, 11);
						nAdd(5) <= conv_std_logic_vector(2047, 11);
						nAdd(8) <= conv_std_logic_vector(2047, 11);
					end if ;
					if indY = 0 then
						upCons <= '1';
						nAdd(0) <= conv_std_logic_vector(2047, 11);
						nAdd(1) <= conv_std_logic_vector(2047, 11);
						nAdd(2) <= conv_std_logic_vector(2047, 11);
					end if ;
					if indY = 19 then
						downCons <= '1';
						nAdd(6) <= conv_std_logic_vector(2047, 11);
						nAdd(7) <= conv_std_logic_vector(2047, 11);
						nAdd(8) <= conv_std_logic_vector(2047, 11);
					end if ;

					nineInd <= 0;
					mode <= 1;
					Address <= nAdd(0);
					read_enable <= '1';
				else

					if nineInd = 9 then
						for i in 0 to 8 loop
							if (i = 0) or (i = 2) or (i = 6) or (i = 8) then
								newPix <= newPix + nData(i);
							end if;
							if (i = 1) or (i = 3) or (i = 5) or (i = 7) then
								newPix <= newPix + (nData(i)(6 downto 0) & '0');
							end if ;
							if (i = 4) then
								newPix <= newPix + (nData(i)(5 downto 0) & "00");
							end if ;
						end loop;
						newPix <= "0000" & newPix(7 downto 4);

						read_enable <= '0';
						WR <= '1';
						Address <= nAdd(4) + 600;
						Data_out <= newPix;

						nineInd <= 0;
						mode <= 0;
						ind <= ind + 1;
						remain <= 0;
						indX <= 0;
						indY <= 0;
						leftCons <= '0';
						upCons <= '0';
						rightCons <= '0';
						downCons <= '0';
						newPix <= "00000000";
					else

						nData(nineInd) <= Data_in;

						if leftCons = '1' then
							nData(0) <= "00000000";
							nData(3) <= "00000000";
							nData(6) <= "00000000";
						end if;

						if rightCons = '1' then
							nData(2) <= "00000000";
							nData(5) <= "00000000";
							nData(8) <= "00000000";
						end if;

						if upCons = '1' then
							nData(0) <= "00000000";
							nData(1) <= "00000000";
							nData(2) <= "00000000";
						end if;

						if downCons = '1' then
							nData(6) <= "00000000";
							nData(7) <= "00000000";
							nData(8) <= "00000000";
						end if;

						nineInd <= nineInd + 1;
						Address <= nAdd(nineInd);
						read_enable <= '1';
					end if;
				end if;

				ready_temp <= '1';
				ready <= '1';
				
            -- after 1 clock ready should be 0 again;
			else
				ready_temp <= '0';
                ready <= '0';
            end if;
        end if;
    end process;
end arch;