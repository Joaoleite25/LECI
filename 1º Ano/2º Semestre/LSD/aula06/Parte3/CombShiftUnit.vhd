library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity CombShiftUnit is
    Port ( dataIn : in  STD_LOGIC_VECTOR (7 downto 0);
           siLeft : in  STD_LOGIC;
           siRight : in  STD_LOGIC;
           loadEn : in  STD_LOGIC;
           rotate : in  STD_LOGIC;
           dirLeft : in  STD_LOGIC;
           shArith : in  STD_LOGIC;
           dataOut : out  STD_LOGIC_VECTOR (7 downto 0));
end CombShiftUnit;

architecture Behavioral of CombShiftUnit is
begin
    process(dataIn, siLeft, siRight, loadEn, rotate, dirLeft, shArith)
    begin
        if loadEn = '1' then
            dataOut <= dataIn;
        elsif rotate = '1' then
            if dirLeft = '1' then
                dataOut <= dataIn(6 downto 0) & dataIn(7);
            else
                dataOut <= dataIn(0) & dataIn(7 downto 1);
            end if;
        elsif shArith = '1' then
            if dirLeft = '1' then
                dataOut <= std_logic_vector(to_unsigned(to_integer(natural(dataIn(6 downto 0))) + to_integer(dataIn(7)), dataIn'length));
            else
                dataOut <= std_logic_vector(to_unsigned(to_integer(natural(dataIn(0))) + to_integer(dataIn(7 downto 1)), dataIn'length));
            end if;
        else
            if dirLeft = '1' then
                dataOut <= dataIn(6 downto 0) & '0';
            else
                dataOut <= '0' & dataIn(7 downto 1);
            end if;
        end if;
    end process;
end Behavioral;