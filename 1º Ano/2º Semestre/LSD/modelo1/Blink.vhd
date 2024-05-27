library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Blink is
    generic(MAX : positive := 50_000_000);
    port ( 
		enable : in std_logic;
		clk : in std_logic;
      pulse: out std_logic
		);
end Blink;

architecture Behavioral of Blink is
    signal s_counter : natural range 0 to MAX-1;
begin
    count_proc: process(clk, enable)
    begin
	 if (enable ='1') then
        if rising_edge(clk) then
            if (s_counter >= MAX-1) then
                s_counter <= 0;
            else
                s_counter <= s_counter + 1;
            end if;
        end if;
	 else
		s_counter <= 0;
	 end if;
    end process;
    pulse <= '1' when s_counter >= (MAX/2) else '0';
end Behavioral;