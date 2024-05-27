library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Pisca is
    Port ( LEDR : out STD_LOGIC_VECTOR (7 downto 0);
           LEDG : out STD_LOGIC_VECTOR (7 downto 0);
           CLK : in STD_LOGIC);
end Pisca;

architecture Behavioral of Pisca is
    signal counter : integer range 0 to 24999999 := 0; 
    signal red_led_state : STD_LOGIC := '1';
    signal green_led_state : STD_LOGIC := '0'; 
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            counter <= counter + 1;
            if counter = 24999999 then 
                counter <= 0;
                red_led_state <= not red_led_state;
                green_led_state <= not green_led_state;
            end if;
        end if;
    end process;

    LEDR <= (others => red_led_state);
    LEDG <= (others => green_led_state);

end Behavioral;
