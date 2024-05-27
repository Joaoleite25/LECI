library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ShiftRegister_Demo is
    Port ( CLOCK_50 : in std_logic;
           reset : in std_logic;
           switches : in std_logic_vector(7 downto 0);
           leds : out std_logic_vector(7 downto 0));
end ShiftRegister_Demo;

architecture Behavioral of ShiftRegister_Demo is
    component ClkDividerN is
        generic(divFactor : positive := 10);
        port(clkIn : in std_logic;
             clkOut : out std_logic);
    end component;
    
    component ShiftRegisterN is
        generic(size : positive := 4);
        port(clkIn : in std_logic;
             reset : in std_logic;
             dataIn : in std_logic_vector(size - 1 downto 0);
             dataOut : out std_logic_vector(size - 1 downto 0));
    end component;
    
    signal clk : std_logic := '0';
    signal shiftRegDataOut : std_logic_vector(7 downto 0);
begin
    
    clkDivider : ClkDividerN
        generic map(divFactor => 50000000)
        port map(clkIn => CLOCK_50, clkOut => clk);
    
    shiftReg : ShiftRegisterN
        generic map(size => 8)
        port map(clkIn => clk, reset => reset, dataIn => switches, dataOut => shiftRegDataOut);
    
    leds <= shiftRegDataOut;
end Behavioral;