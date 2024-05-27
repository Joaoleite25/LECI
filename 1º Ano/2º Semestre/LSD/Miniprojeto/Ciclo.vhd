library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ciclo is
    Port ( CLK : in STD_LOGIC;
           LEDR : out STD_LOGIC_VECTOR (7 downto 0);
           LEDG : out STD_LOGIC_VECTOR (7 downto 0));
end Ciclo;

architecture Behavioral of Ciclo is
    signal counter : integer range 0 to 49999999 := 0;
    signal led_state : STD_LOGIC := '1'; 
    signal switch_state : STD_LOGIC := '0';

begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            counter <= counter + 1;
            if counter = 49999999 then 
                counter <= 0;
                switch_state <= not switch_state;
            end if;
        end if;
    end process;

    process(CLK)
    begin
        if rising_edge(CLK) then
            if counter < 24999999 then 
                if counter mod 12500000 = 0 then
                    led_state <= not led_state;
                end if;
            else

                if counter = 25000000 then
                    led_state <= '0';
                elsif counter = 49999999 then
                    led_state <= '1';
                end if;
            end if;
        end if;
    end process;

    LEDR <= (others => led_state) when switch_state = '0' else (others => not led_state);
    LEDG <= (others => '1') when switch_state = '0' else (others => led_state);
end Behavioral;
