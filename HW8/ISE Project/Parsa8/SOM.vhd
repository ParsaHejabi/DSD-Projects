library IEEE;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SOM is
  port (
    clk, rst: in std_logic;
    inp: in unsigned(7 downto 0);
    neuron: out unsigned(2 downto 0);
	outp: out unsigned(15 downto 0);
	en: in std_logic
  ) ;
end SOM;
architecture Behavioral of SOM is
    
    signal index: integer range 0 to 10 := 0;
	 signal delay: std_logic := '0';
    signal neuron1, neuron2, neuron3, neuron4: unsigned(15 downto 0);
    signal final_neuron: unsigned(15 downto 0);
	 signal final_index: unsigned(2 downto 0);
    component MAC1 is
		port 
			(
				inp			: in unsigned(7 downto 0);
				inputID : in integer range 0 to 9;
				clk			: in std_logic;
				rst			: in std_logic;
				result1	: out unsigned (15 downto 0)
			);
    end component;
	 component MAC2 is
		port 
			(
				inp			: in unsigned(7 downto 0);
				inputID : in integer range 0 to 9;
				clk			: in std_logic;
				rst			: in std_logic;
				result2	: out unsigned (15 downto 0)
			);
    end component;
	 component MAC3 is
		port 
			(
				inp			: in unsigned(7 downto 0);
				inputID : in integer range 0 to 9;
				clk			: in std_logic;
				rst			: in std_logic;
				result3	: out unsigned (15 downto 0)
			);
    end component;
	 component MAC4 is
		port 
			(
				inp			: in unsigned(7 downto 0);
				inputID : in integer range 0 to 9;
				clk			: in std_logic;
				rst			: in std_logic;
				result4	: out unsigned (15 downto 0)
			);
    end component;
    component COMP
        port (
			 inp1, inp2, inp3, inp4:in unsigned(15 downto 0);
			 max: out unsigned(15 downto 0);
			 maxIndex: out unsigned(2 downto 0)
		  );
    end component;
begin
    n1: mac1 port map (inp, index, clk, rst, neuron1);
    n2: mac2 port map (inp, index, clk, rst, neuron2);
    n3: mac3 port map (inp, index, clk, rst, neuron3);
    n4: mac4 port map (inp, index, clk, rst, neuron4);
    cmp: comp port map (neuron1, neuron2, neuron3, neuron4, final_neuron, final_index);
    process(clk,rst)
    begin
			
        if(rst = '0' and rising_edge(clk) and en = '1') then
            if(index = 10) then
                outp <= final_neuron; 
					 neuron <= final_index;
            else
					if(delay = '0') then
						index <= 0;
						delay <= '1';
					else
                index <= index + 1;
					 end if;
					 outp <= "0000000000000000";
					 neuron <= "000";
            end if;
        end if;
    end process;

end Behavioral ; -- calc