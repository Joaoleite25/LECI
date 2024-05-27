library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity counter5 is
	port(
		clk    : in std_logic;
		reset  : in std_logic;
		enable : in std_logic;
		count  : out std_logic_vector(2 downto 0)
		);
end counter5;


