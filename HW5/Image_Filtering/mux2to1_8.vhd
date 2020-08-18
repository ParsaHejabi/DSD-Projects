library ieee;
use ieee.std_logic_1164.all;

entity mux2to1_8 is
	port(
        w0, w1  :   in std_logic_vector(7 downto 0);
        s   :   in  std_logic;
		f   :   out std_logic_vector(7 downto 0)
	);
end mux2to1_8;

architecture dataflow of mux2to1_8 is
begin
	f <= w0 when s = '0' else w1;
end dataflow;