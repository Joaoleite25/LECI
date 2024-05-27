library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Prog3 is
	port (
		enable    : in std_logic;
		light     : out std_logic_vector(3 downto 0);
		no_light  : out std_logic_vector(3 downto 0)
	);
end Prog3;

architecture Behavioral of Prog3 is
begin
	process(enable)
	begin
	no_light <= "0000";
	if (enable = '1') then
		light <= "1111";
	else
		light <= "0000";
	end if;
	end process;
end Behavioral;