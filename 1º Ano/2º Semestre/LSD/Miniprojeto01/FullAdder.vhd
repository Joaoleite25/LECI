library IEEE;
use IEEE.std_logic_1164.ALL;
 
entity FullAdder is
	Port ( a : in std_logic;
			 b : in std_logic;
			 Ci : in std_logic;
			 S : out std_logic;
			 Co : out std_logic);
end FullAdder;
 
architecture gate_level of FullAdder is
begin
 
	S <= a XOR b XOR Ci ;
	Co <= (a AND b) OR (Ci AND a) OR (Ci AND b) ;
 
end gate_level;