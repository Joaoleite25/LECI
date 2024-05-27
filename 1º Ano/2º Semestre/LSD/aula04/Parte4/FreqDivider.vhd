library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FreqDivider is
 port(
 clkIn : in std_logic;
 k : in std_logic_vector(31 downto 0);
 clkOut : buffer std_logic
 );
end entity;

architecture Behavioral of FreqDivider is
 signal s_counter : unsigned(31 downto 0);
 signal s_halfWay : unsigned(31 downto 0);
begin

 s_halfWay <= to_unsigned(to_integer(unsigned(k)) / 2, s_halfWay'length);

 process(clkIn)
 begin
 if rising_edge(clkIn) then
 s_counter <= s_counter + 1;
 if s_counter >= s_halfWay then
 clkOut <= NOT clkOut;
 s_counter <= to_unsigned(0, s_counter'length);
 end if;
 end if;
 end process;

end architecture;