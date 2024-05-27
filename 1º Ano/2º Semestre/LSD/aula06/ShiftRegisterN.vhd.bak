library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegister4 is
    Port ( dataIn : in  STD_LOGIC_VECTOR (3 downto 0);
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR (3 downto 0));
end ShiftRegister4;

architecture Behavioral of ShiftRegister4 is
signal shiftRegister : STD_LOGIC_VECTOR (3 downto 0);
begin
    process(clock, reset)
    begin
        if reset = '1' then
            shiftRegister <= "0000";
        elsif rising_edge(clock) then
            shiftRegister <= dataIn(2 downto 0) & '0';
        end if;
    end process;
    dataOut <= shiftRegister;
end Behavioral;