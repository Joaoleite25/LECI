library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ShiftRegisterN is
    generic (size : integer := 4);
    Port ( dataIn : in  STD_LOGIC_VECTOR (size-1 downto 0);
           clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR (size-1 downto 0));
end ShiftRegisterN;

architecture Behavioral of ShiftRegisterN is
signal shiftRegister : STD_LOGIC_VECTOR (size-1 downto 0);
begin
    process(clock, reset)
    begin
        if reset = '1' then
            shiftRegister <= (others => '0');
        elsif rising_edge(clock) then
            shiftRegister <= dataIn(size-2 downto 0) & '0';
        end if;
    end process;
    dataOut <= shiftRegister;
end Behavioral;