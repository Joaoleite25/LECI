library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fase3 is
	port
	(
		enable  : in std_logic;
		green   : out std_logic_vector(3 downto 0);
		red     : out std_logic_vector(3 downto 0)
	);
end fase3;

architecture Behavioral of fase3 is
begin
	process(enable)
	begin
		if (enable = '1') then
			green <= "1111";
			red   <= "1111";
		else
			green <= "0000";
			red   <= "0000";
		end if;
	end process;
end Behavioral;