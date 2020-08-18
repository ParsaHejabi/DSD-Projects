library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
	port(
		w0, w1, s   :   in  std_logic;
		f   :   out std_logic
	);
end mux2to1;

architecture dataflow of mux2to1 is
begin
	f <= w0 when s = '0' else w1;
end dataflow;