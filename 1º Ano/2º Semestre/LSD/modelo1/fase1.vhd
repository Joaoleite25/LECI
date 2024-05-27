library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity fase1 is
	port
	(
		CLOCK_50 : in std_logic;
		SW       : in std_logic_vector(1 downto 0);
		HEX0     : out std_logic_vector(6  downto 0);
		LEDR     : out std_logic_vector(3  downto 0);
		LEDG     : out std_logic_vector(3  downto 0)
	);
end fase1;

architecture Shell of fase1 is
	signal inter : std_logic_vector(3 downto 0);
	
	signal redL_prog1, greenL_prog1 : std_logic_vector(3 downto 0);
	signal redL_prog2, greenL_prog2 : std_logic_vector(3 downto 0);
	signal redL_prog3, greenL_prog3 : std_logic_vector(3 downto 0);
	
	signal pulse_prog2 : std_logic;
	signal pulse_prog3 : std_logic;
	signal pulse_prog4 : std_logic;
begin
--Escolha a opção
	system_core : entity work.Dec2_4En(Behavioral)
	port map(
		enable  => '1',
		inputs  => SW(1 downto 0),
		outputs => inter(3 downto 0)
	);

--Hex0
	opcao : entity work.Bin7Decoder(Behavioral)
	port map(
		enable => '0',
		binInput => inter(1 downto 0),
		decOut_n => HEX0
	);
	
---Programa 1
	Programa1 : entity work.fase3(Behavioral)
	port map(
		enable => inter(0),
		green => greenL_prog1,
		red => redL_prog1
	);
	
--Programa 2
	Blink_Prog2 : entity work.Blink(Behavioral)
	generic map (MAX => 12_500_000)
	port map
	(
		enable => inter(1),
		clk    => CLOCK_50,
		pulse  => pulse_prog2
	);
	
	Programa2 : entity work.Prog3(Behavioral)
	port map(
		enable   => pulse_prog2,
		light    => redL_prog2,
		no_light => greenL_prog2
	);
	
--Programa 3
	Blink_Prog3 : entity work.Blink(Behavioral)
	generic map (MAX => 50_000_000)
	port map
	(
		enable => inter(2),
		clk    => CLOCK_50,
		pulse  => pulse_prog3
	);
	
	Programa3 : entity work.Prog3(Behavioral)
	port map(
		enable   => pulse_prog3,
		light    => greenL_prog3,
		no_light => redL_prog3
	);
	
	LEDR <= redL_prog1 or redL_prog2 or redL_prog3;
	LEDG <= greenL_prog1 or greenL_prog2 or greenL_prog3;
	
end Shell;