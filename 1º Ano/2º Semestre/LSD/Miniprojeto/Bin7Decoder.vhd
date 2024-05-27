library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Bin7Decoder is
	port
	(
		enable   : in std_logic;
		binInput : in std_logic_vector(2 downto 0);
		decOut_n : out std_logic_vector(6 downto 0)
	);
end Bin7Decoder;

architecture Behavioral of Bin7Decoder is
begin
	decOut_n <= "1111111" when (enable = '1')    else --disabled
					"1111001" when (binInput = "000") else --1
					"0100100" when (binInput = "001") else --2
					"0110000" when (binInput = "010") else --3
					"0011001";                            --4
end Behavioral;