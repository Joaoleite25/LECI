library IEEE;
use IEEE.STD_LOGIC_1164.all; 

entity Mux4_1 is 
	port(sel    : in std_logic_vector(1 downto 0);
		  input0 : in std_logic;
		  input1 : in std_logic;
		  input2 : in std_logic;
		  input3 : in std_logic;
		  muxout : out std_logic
	);
end Mux4_1;

architecture Behavioral of Mux4_1 is
begin
	muxout <= input0 when sel = "00" else 
				 input1 when sel = "01" else
				 input2 when sel = "10" else
				 input3;
end Behavioral;