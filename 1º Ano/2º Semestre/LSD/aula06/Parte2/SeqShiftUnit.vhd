library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity SeqShiftUnit is
    Port ( clk : in std_logic;
           dataIn : in std_logic_vector(7 downto 0);
           siLeft : in std_logic;
           siRight : in std_logic;
           loadEn : in std_logic;
           rotate : in std_logic;
           dirLeft : in std_logic;
           shArith : in std_logic;
           dataOut : out std_logic_vector(7 downto 0));
end SeqShiftUnit;

architecture Behavioral of SeqShiftUnit is
    signal s_shiftReg : std_logic_vector(7 downto 0);
begin
    process(clk)
    begin
        if (falling_edge(clk)) then
            if (loadEn = '1') then
                s_shiftReg <= dataIn;
            elsif (rotate = '1') then
                if (dirLeft = '1') then
                    s_shiftReg <= s_shiftReg(6 downto 0) & s_shiftReg(7);
                else
                    s_shiftReg <= s_shiftReg(0) & s_shiftReg(7 downto 1);
                end if;
            elsif (shArith = '1') then
					 if (dirLeft = '1') then
						  s_shiftReg <= std_logic_vector(to_signed(to_integer(unsigned(s_shiftReg(6 downto 0))) + to_integer(unsigned(s_shiftReg(7))), s_shiftReg'length));
					 else
						  s_shiftReg <= std_logic_vector(to_signed(to_integer(unsigned(s_shiftReg(0))) + to_integer(shift_right(unsigned(s_shiftReg(7 downto 1)), 1)), s_shiftReg'length));
					 end if;
				end if;
        end if;
    end process;
    dataOut <= s_shiftReg;
end Behavioral;