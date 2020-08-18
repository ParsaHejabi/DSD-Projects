library ieee;
use ieee.std_logic_1164.all;

entity Image_Filtering is
	port (
		Clk     :   in  std_logic;
		Rst     :   in  std_logic;
		Ready   :   out std_logic
	);
end Image_Filtering;

architecture structural of Image_Filtering is

	component mux2to1
		port (
			w0, w1, s   :   in  std_logic;
			f   :   out std_logic
		);
	end component;

	component mux2to1_8
		port (
        	w0, w1  :   in std_logic_vector(7 downto 0);
        	s   :   in  std_logic;
			f   :   out std_logic_vector(7 downto 0)
			);
	end component;

	component mux2to1_11
		port (
			w0, w1  :   in std_logic_vector(10 downto 0);
			s   :   in  std_logic;
			f   :   out std_logic_vector(10 downto 0)
		);
	end component;

	component RAM
		port (
			RE, WR  :   in  std_logic;
			Data_in :   in  std_logic_vector(7 downto 0);
			Address :   in  std_logic_vector(10 downto 0);
			clk     :   in  std_logic;
			Data_out    :   out     std_logic_vector(7 downto 0)
		);
	end component;

	component Filter
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
	end component;

	component filEx
		port (
			clk			:in	std_logic;
			nrst		:in	std_logic;
			WR			:out	std_logic;
			en			:out	std_logic;
			pixel_val	:out	std_logic_vector(7 DOWNTO 0);
			Address		:out	std_logic_vector(10 downto 0)
		);
	end component;

	signal ready_temp	:	std_logic	:=	'0';
	signal Read_Enable	:	std_logic	:=	'0';
	signal Write_Enable	:	std_logic	:=	'0';
	signal Apply_Wr		:	std_logic	:=	'0';
	signal en			:	std_logic	:=	'0';
	signal Apply_Data	:	std_logic_vector(7 downto 0);
	signal Apply_Add	:	std_logic_vector(10 downto 0);
	signal RAM_Data		:	std_logic_vector(7 downto 0);
	signal Filter_Data	:	std_logic_vector(7 downto 0);
	signal Filter_Add	:	std_logic_vector(10 downto 0);
	signal Filter_Wr	:	std_logic;
	signal mux_data		:	std_logic_vector(7 downto 0);
	signal mux_add		:	std_logic_vector(10 downto 0);

begin

	fil:		Filter port map (Clk, Rst, RAM_Data, Ready, Read_Enable, Filter_Data, Filter_Add, Filter_Wr);
	app:		filEx port map (Clk, Rst, Apply_Wr, en, Apply_Data, Apply_Add);
	mux1:	mux2to1 port map (Apply_Wr, Filter_Wr, en, Write_Enable); --when en = '1' Filter_Wr
	mux2:	mux2to1_8 port map (Apply_Data, Filter_Data, en, mux_data);
	mux3:	mux2to1_11 port map (Apply_Add, Filter_Add, en, mux_add);
	ra:		RAM port map (Read_Enable, Write_Enable, mux_data, mux_add, Clk, RAM_Data);

	Ready <= ready_temp;
end structural;