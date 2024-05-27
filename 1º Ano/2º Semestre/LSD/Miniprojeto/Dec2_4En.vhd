library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Dec2_4En is
    Port (
        EN : in STD_LOGIC;
        A : in STD_LOGIC_VECTOR(1 downto 0);
        Y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Dec2_4En;

architecture Behavioral of Dec2_4En is
begin
    process(EN, A)
    begin
        if EN = '1' then
            case A is
                when "00" =>
                    Y <= "0001";
                when "01" =>
                    Y <= "0010";
                when "10" =>
                    Y <= "0100";
                when "11" =>
                    Y <= "1000";
                when others =>
                    Y <= (others => '0');
            end case;
        else
            Y <= (others => '0');
        end if;
    end process;
end Behavioral;
