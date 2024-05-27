library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Program_2 is
    port (
        clk : in std_logic;
        reset : in std_logic;
        red : out std_logic_vector(3 downto 0);
        green : out std_logic_vector(3 downto 0)
    );
end Program_2;

architecture Behavioral of Program_2 is
    signal counter : integer range 0 to 25000000 := 0; -- Contador para piscar a cada 0.5s (50 MHz)
    signal red_on : boolean := true; -- Indica se os LEDs vermelhos estão ligados ou desligados
begin
    process(clk)
    begin
        if rising_edge(clk) then
            if reset = '1' then
                -- Todos os LEDs desligados no reset
                red <= (others => '0');
                green <= (others => '0');
                counter <= 0;
                red <= true;
            else
                -- Contagem para piscar os LEDs vermelhos
                if counter = 25000000 then
                    if red_on then
                        red <= (others => '0'); -- Desliga os LEDs vermelhos
                    else
                        red <= (others => '1'); -- Liga os LEDs vermelhos
                    end if;
                    red_on <= not red_on;
                    counter <= 0;
                else
                    counter <= counter + 1;
                end if;
                
                -- Desliga os LEDs verdes
                green_LED <= (others => '0');
            end if;
        end if;
    end process;
end Behavioral;