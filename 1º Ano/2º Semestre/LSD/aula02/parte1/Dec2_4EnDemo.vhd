library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Dec2_4EnDemo is
	port(SW   : in std_logic_vector(2 downto 0);
		  LEDG : out std_logic_vector(3 downto 0));
end Dec2_4EnDemo;

architecture Shell of Dec2_4EnDemo is
begin
	system_core : entity work.Dec2_4En(BehavAssign)
	port map(enable  => SW(2),
				inputs  => SW(1 downto 0),
				outputs => LEDG(3 downto 0));
end Shell;

architecture BehavAssign of Dec2_4En is
begin
	outputs <= "0000" when (enable = '0') else
	"0001" when (inputs = "00") else
	"0010" when (inputs = "01") else
	"0100" when (inputs = "10") else
	"1000";
end BehavAssign; 