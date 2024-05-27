-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"

-- DATE "04/08/2024 16:42:03"

-- 
-- Device: Altera EP4CE6E22A7 Package TQFP144
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	FreqDivider IS
    PORT (
	clkIn : IN std_logic;
	k : IN std_logic_vector(31 DOWNTO 0);
	clkOut : BUFFER std_logic
	);
END FreqDivider;

-- Design Ports Information
-- k[0]	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[31]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clkOut	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[30]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[29]	=>  Location: PIN_71,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[28]	=>  Location: PIN_59,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[27]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[26]	=>  Location: PIN_67,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[25]	=>  Location: PIN_69,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[24]	=>  Location: PIN_70,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[23]	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[22]	=>  Location: PIN_88,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[21]	=>  Location: PIN_89,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[20]	=>  Location: PIN_72,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[19]	=>  Location: PIN_68,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[18]	=>  Location: PIN_76,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[17]	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[16]	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[15]	=>  Location: PIN_73,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[14]	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[13]	=>  Location: PIN_83,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[12]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[11]	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[10]	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[9]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[8]	=>  Location: PIN_99,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[7]	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[6]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[5]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[4]	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[3]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[2]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- k[1]	=>  Location: PIN_74,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clkIn	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF FreqDivider IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clkIn : std_logic;
SIGNAL ww_k : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_clkOut : std_logic;
SIGNAL \clkIn~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \k[0]~input_o\ : std_logic;
SIGNAL \k[31]~input_o\ : std_logic;
SIGNAL \clkOut~output_o\ : std_logic;
SIGNAL \clkIn~input_o\ : std_logic;
SIGNAL \clkIn~inputclkctrl_outclk\ : std_logic;
SIGNAL \s_counter[0]~32_combout\ : std_logic;
SIGNAL \s_counter[30]~93\ : std_logic;
SIGNAL \s_counter[31]~94_combout\ : std_logic;
SIGNAL \k[30]~input_o\ : std_logic;
SIGNAL \k[29]~input_o\ : std_logic;
SIGNAL \k[28]~input_o\ : std_logic;
SIGNAL \k[27]~input_o\ : std_logic;
SIGNAL \k[26]~input_o\ : std_logic;
SIGNAL \k[25]~input_o\ : std_logic;
SIGNAL \k[24]~input_o\ : std_logic;
SIGNAL \k[23]~input_o\ : std_logic;
SIGNAL \k[22]~input_o\ : std_logic;
SIGNAL \k[21]~input_o\ : std_logic;
SIGNAL \k[20]~input_o\ : std_logic;
SIGNAL \k[19]~input_o\ : std_logic;
SIGNAL \k[18]~input_o\ : std_logic;
SIGNAL \k[17]~input_o\ : std_logic;
SIGNAL \k[16]~input_o\ : std_logic;
SIGNAL \k[15]~input_o\ : std_logic;
SIGNAL \k[14]~input_o\ : std_logic;
SIGNAL \k[13]~input_o\ : std_logic;
SIGNAL \k[12]~input_o\ : std_logic;
SIGNAL \k[11]~input_o\ : std_logic;
SIGNAL \k[10]~input_o\ : std_logic;
SIGNAL \k[9]~input_o\ : std_logic;
SIGNAL \k[8]~input_o\ : std_logic;
SIGNAL \k[7]~input_o\ : std_logic;
SIGNAL \k[6]~input_o\ : std_logic;
SIGNAL \k[5]~input_o\ : std_logic;
SIGNAL \k[4]~input_o\ : std_logic;
SIGNAL \k[3]~input_o\ : std_logic;
SIGNAL \k[2]~input_o\ : std_logic;
SIGNAL \k[1]~input_o\ : std_logic;
SIGNAL \LessThan0~1_cout\ : std_logic;
SIGNAL \LessThan0~3_cout\ : std_logic;
SIGNAL \LessThan0~5_cout\ : std_logic;
SIGNAL \LessThan0~7_cout\ : std_logic;
SIGNAL \LessThan0~9_cout\ : std_logic;
SIGNAL \LessThan0~11_cout\ : std_logic;
SIGNAL \LessThan0~13_cout\ : std_logic;
SIGNAL \LessThan0~15_cout\ : std_logic;
SIGNAL \LessThan0~17_cout\ : std_logic;
SIGNAL \LessThan0~19_cout\ : std_logic;
SIGNAL \LessThan0~21_cout\ : std_logic;
SIGNAL \LessThan0~23_cout\ : std_logic;
SIGNAL \LessThan0~25_cout\ : std_logic;
SIGNAL \LessThan0~27_cout\ : std_logic;
SIGNAL \LessThan0~29_cout\ : std_logic;
SIGNAL \LessThan0~31_cout\ : std_logic;
SIGNAL \LessThan0~33_cout\ : std_logic;
SIGNAL \LessThan0~35_cout\ : std_logic;
SIGNAL \LessThan0~37_cout\ : std_logic;
SIGNAL \LessThan0~39_cout\ : std_logic;
SIGNAL \LessThan0~41_cout\ : std_logic;
SIGNAL \LessThan0~43_cout\ : std_logic;
SIGNAL \LessThan0~45_cout\ : std_logic;
SIGNAL \LessThan0~47_cout\ : std_logic;
SIGNAL \LessThan0~49_cout\ : std_logic;
SIGNAL \LessThan0~51_cout\ : std_logic;
SIGNAL \LessThan0~53_cout\ : std_logic;
SIGNAL \LessThan0~55_cout\ : std_logic;
SIGNAL \LessThan0~57_cout\ : std_logic;
SIGNAL \LessThan0~58_combout\ : std_logic;
SIGNAL \LessThan0~60_combout\ : std_logic;
SIGNAL \s_counter[0]~33\ : std_logic;
SIGNAL \s_counter[1]~34_combout\ : std_logic;
SIGNAL \s_counter[1]~35\ : std_logic;
SIGNAL \s_counter[2]~36_combout\ : std_logic;
SIGNAL \s_counter[2]~37\ : std_logic;
SIGNAL \s_counter[3]~38_combout\ : std_logic;
SIGNAL \s_counter[3]~39\ : std_logic;
SIGNAL \s_counter[4]~40_combout\ : std_logic;
SIGNAL \s_counter[4]~41\ : std_logic;
SIGNAL \s_counter[5]~42_combout\ : std_logic;
SIGNAL \s_counter[5]~43\ : std_logic;
SIGNAL \s_counter[6]~44_combout\ : std_logic;
SIGNAL \s_counter[6]~45\ : std_logic;
SIGNAL \s_counter[7]~46_combout\ : std_logic;
SIGNAL \s_counter[7]~47\ : std_logic;
SIGNAL \s_counter[8]~48_combout\ : std_logic;
SIGNAL \s_counter[8]~49\ : std_logic;
SIGNAL \s_counter[9]~50_combout\ : std_logic;
SIGNAL \s_counter[9]~51\ : std_logic;
SIGNAL \s_counter[10]~52_combout\ : std_logic;
SIGNAL \s_counter[10]~53\ : std_logic;
SIGNAL \s_counter[11]~54_combout\ : std_logic;
SIGNAL \s_counter[11]~55\ : std_logic;
SIGNAL \s_counter[12]~56_combout\ : std_logic;
SIGNAL \s_counter[12]~57\ : std_logic;
SIGNAL \s_counter[13]~58_combout\ : std_logic;
SIGNAL \s_counter[13]~59\ : std_logic;
SIGNAL \s_counter[14]~60_combout\ : std_logic;
SIGNAL \s_counter[14]~61\ : std_logic;
SIGNAL \s_counter[15]~62_combout\ : std_logic;
SIGNAL \s_counter[15]~63\ : std_logic;
SIGNAL \s_counter[16]~64_combout\ : std_logic;
SIGNAL \s_counter[16]~65\ : std_logic;
SIGNAL \s_counter[17]~66_combout\ : std_logic;
SIGNAL \s_counter[17]~67\ : std_logic;
SIGNAL \s_counter[18]~68_combout\ : std_logic;
SIGNAL \s_counter[18]~69\ : std_logic;
SIGNAL \s_counter[19]~70_combout\ : std_logic;
SIGNAL \s_counter[19]~71\ : std_logic;
SIGNAL \s_counter[20]~72_combout\ : std_logic;
SIGNAL \s_counter[20]~73\ : std_logic;
SIGNAL \s_counter[21]~74_combout\ : std_logic;
SIGNAL \s_counter[21]~75\ : std_logic;
SIGNAL \s_counter[22]~76_combout\ : std_logic;
SIGNAL \s_counter[22]~77\ : std_logic;
SIGNAL \s_counter[23]~78_combout\ : std_logic;
SIGNAL \s_counter[23]~79\ : std_logic;
SIGNAL \s_counter[24]~80_combout\ : std_logic;
SIGNAL \s_counter[24]~81\ : std_logic;
SIGNAL \s_counter[25]~82_combout\ : std_logic;
SIGNAL \s_counter[25]~83\ : std_logic;
SIGNAL \s_counter[26]~84_combout\ : std_logic;
SIGNAL \s_counter[26]~85\ : std_logic;
SIGNAL \s_counter[27]~86_combout\ : std_logic;
SIGNAL \s_counter[27]~87\ : std_logic;
SIGNAL \s_counter[28]~88_combout\ : std_logic;
SIGNAL \s_counter[28]~89\ : std_logic;
SIGNAL \s_counter[29]~90_combout\ : std_logic;
SIGNAL \s_counter[29]~91\ : std_logic;
SIGNAL \s_counter[30]~92_combout\ : std_logic;
SIGNAL \clkOut~0_combout\ : std_logic;
SIGNAL \clkOut~reg0_q\ : std_logic;
SIGNAL s_counter : std_logic_vector(31 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clkIn <= clkIn;
ww_k <= k;
clkOut <= ww_clkOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clkIn~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clkIn~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X23_Y0_N9
\clkOut~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clkOut~reg0_q\,
	devoe => ww_devoe,
	o => \clkOut~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\clkIn~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clkIn,
	o => \clkIn~input_o\);

-- Location: CLKCTRL_G2
\clkIn~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clkIn~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clkIn~inputclkctrl_outclk\);

-- Location: LCCOMB_X31_Y6_N0
\s_counter[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[0]~32_combout\ = s_counter(0) $ (VCC)
-- \s_counter[0]~33\ = CARRY(s_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => s_counter(0),
	datad => VCC,
	combout => \s_counter[0]~32_combout\,
	cout => \s_counter[0]~33\);

-- Location: LCCOMB_X31_Y5_N28
\s_counter[30]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[30]~92_combout\ = (s_counter(30) & (\s_counter[29]~91\ $ (GND))) # (!s_counter(30) & (!\s_counter[29]~91\ & VCC))
-- \s_counter[30]~93\ = CARRY((s_counter(30) & !\s_counter[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(30),
	datad => VCC,
	cin => \s_counter[29]~91\,
	combout => \s_counter[30]~92_combout\,
	cout => \s_counter[30]~93\);

-- Location: LCCOMB_X31_Y5_N30
\s_counter[31]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[31]~94_combout\ = s_counter(31) $ (\s_counter[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(31),
	cin => \s_counter[30]~93\,
	combout => \s_counter[31]~94_combout\);

-- Location: FF_X31_Y5_N31
\s_counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[31]~94_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(31));

-- Location: IOIBUF_X34_Y9_N8
\k[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(30),
	o => \k[30]~input_o\);

-- Location: IOIBUF_X32_Y0_N15
\k[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(29),
	o => \k[29]~input_o\);

-- Location: IOIBUF_X23_Y0_N15
\k[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(28),
	o => \k[28]~input_o\);

-- Location: IOIBUF_X21_Y0_N8
\k[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(27),
	o => \k[27]~input_o\);

-- Location: IOIBUF_X30_Y0_N22
\k[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(26),
	o => \k[26]~input_o\);

-- Location: IOIBUF_X30_Y0_N1
\k[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(25),
	o => \k[25]~input_o\);

-- Location: IOIBUF_X32_Y0_N22
\k[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(24),
	o => \k[24]~input_o\);

-- Location: IOIBUF_X28_Y0_N22
\k[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(23),
	o => \k[23]~input_o\);

-- Location: IOIBUF_X34_Y12_N22
\k[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(22),
	o => \k[22]~input_o\);

-- Location: IOIBUF_X34_Y12_N15
\k[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(21),
	o => \k[21]~input_o\);

-- Location: IOIBUF_X32_Y0_N8
\k[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(20),
	o => \k[20]~input_o\);

-- Location: IOIBUF_X30_Y0_N8
\k[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(19),
	o => \k[19]~input_o\);

-- Location: IOIBUF_X34_Y4_N22
\k[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(18),
	o => \k[18]~input_o\);

-- Location: IOIBUF_X34_Y4_N15
\k[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(17),
	o => \k[17]~input_o\);

-- Location: IOIBUF_X28_Y0_N1
\k[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(16),
	o => \k[16]~input_o\);

-- Location: IOIBUF_X34_Y2_N22
\k[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(15),
	o => \k[15]~input_o\);

-- Location: IOIBUF_X34_Y17_N1
\k[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(14),
	o => \k[14]~input_o\);

-- Location: IOIBUF_X34_Y9_N22
\k[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(13),
	o => \k[13]~input_o\);

-- Location: IOIBUF_X34_Y17_N22
\k[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(12),
	o => \k[12]~input_o\);

-- Location: IOIBUF_X34_Y9_N15
\k[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(11),
	o => \k[11]~input_o\);

-- Location: IOIBUF_X34_Y7_N8
\k[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(10),
	o => \k[10]~input_o\);

-- Location: IOIBUF_X34_Y10_N8
\k[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(9),
	o => \k[9]~input_o\);

-- Location: IOIBUF_X34_Y17_N15
\k[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(8),
	o => \k[8]~input_o\);

-- Location: IOIBUF_X34_Y3_N22
\k[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(7),
	o => \k[7]~input_o\);

-- Location: IOIBUF_X34_Y12_N8
\k[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(6),
	o => \k[6]~input_o\);

-- Location: IOIBUF_X34_Y12_N1
\k[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(5),
	o => \k[5]~input_o\);

-- Location: IOIBUF_X25_Y0_N1
\k[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(4),
	o => \k[4]~input_o\);

-- Location: IOIBUF_X34_Y9_N1
\k[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(3),
	o => \k[3]~input_o\);

-- Location: IOIBUF_X18_Y0_N15
\k[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(2),
	o => \k[2]~input_o\);

-- Location: IOIBUF_X34_Y2_N15
\k[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(1),
	o => \k[1]~input_o\);

-- Location: LCCOMB_X32_Y6_N2
\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_cout\ = CARRY((!s_counter(0) & \k[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(0),
	datab => \k[1]~input_o\,
	datad => VCC,
	cout => \LessThan0~1_cout\);

-- Location: LCCOMB_X32_Y6_N4
\LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~3_cout\ = CARRY((\k[2]~input_o\ & (s_counter(1) & !\LessThan0~1_cout\)) # (!\k[2]~input_o\ & ((s_counter(1)) # (!\LessThan0~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[2]~input_o\,
	datab => s_counter(1),
	datad => VCC,
	cin => \LessThan0~1_cout\,
	cout => \LessThan0~3_cout\);

-- Location: LCCOMB_X32_Y6_N6
\LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~5_cout\ = CARRY((\k[3]~input_o\ & ((!\LessThan0~3_cout\) # (!s_counter(2)))) # (!\k[3]~input_o\ & (!s_counter(2) & !\LessThan0~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[3]~input_o\,
	datab => s_counter(2),
	datad => VCC,
	cin => \LessThan0~3_cout\,
	cout => \LessThan0~5_cout\);

-- Location: LCCOMB_X32_Y6_N8
\LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~7_cout\ = CARRY((\k[4]~input_o\ & (s_counter(3) & !\LessThan0~5_cout\)) # (!\k[4]~input_o\ & ((s_counter(3)) # (!\LessThan0~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[4]~input_o\,
	datab => s_counter(3),
	datad => VCC,
	cin => \LessThan0~5_cout\,
	cout => \LessThan0~7_cout\);

-- Location: LCCOMB_X32_Y6_N10
\LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~9_cout\ = CARRY((s_counter(4) & (\k[5]~input_o\ & !\LessThan0~7_cout\)) # (!s_counter(4) & ((\k[5]~input_o\) # (!\LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(4),
	datab => \k[5]~input_o\,
	datad => VCC,
	cin => \LessThan0~7_cout\,
	cout => \LessThan0~9_cout\);

-- Location: LCCOMB_X32_Y6_N12
\LessThan0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~11_cout\ = CARRY((s_counter(5) & ((!\LessThan0~9_cout\) # (!\k[6]~input_o\))) # (!s_counter(5) & (!\k[6]~input_o\ & !\LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(5),
	datab => \k[6]~input_o\,
	datad => VCC,
	cin => \LessThan0~9_cout\,
	cout => \LessThan0~11_cout\);

-- Location: LCCOMB_X32_Y6_N14
\LessThan0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~13_cout\ = CARRY((s_counter(6) & (\k[7]~input_o\ & !\LessThan0~11_cout\)) # (!s_counter(6) & ((\k[7]~input_o\) # (!\LessThan0~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(6),
	datab => \k[7]~input_o\,
	datad => VCC,
	cin => \LessThan0~11_cout\,
	cout => \LessThan0~13_cout\);

-- Location: LCCOMB_X32_Y6_N16
\LessThan0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~15_cout\ = CARRY((s_counter(7) & ((!\LessThan0~13_cout\) # (!\k[8]~input_o\))) # (!s_counter(7) & (!\k[8]~input_o\ & !\LessThan0~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(7),
	datab => \k[8]~input_o\,
	datad => VCC,
	cin => \LessThan0~13_cout\,
	cout => \LessThan0~15_cout\);

-- Location: LCCOMB_X32_Y6_N18
\LessThan0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~17_cout\ = CARRY((\k[9]~input_o\ & ((!\LessThan0~15_cout\) # (!s_counter(8)))) # (!\k[9]~input_o\ & (!s_counter(8) & !\LessThan0~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[9]~input_o\,
	datab => s_counter(8),
	datad => VCC,
	cin => \LessThan0~15_cout\,
	cout => \LessThan0~17_cout\);

-- Location: LCCOMB_X32_Y6_N20
\LessThan0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~19_cout\ = CARRY((\k[10]~input_o\ & (s_counter(9) & !\LessThan0~17_cout\)) # (!\k[10]~input_o\ & ((s_counter(9)) # (!\LessThan0~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[10]~input_o\,
	datab => s_counter(9),
	datad => VCC,
	cin => \LessThan0~17_cout\,
	cout => \LessThan0~19_cout\);

-- Location: LCCOMB_X32_Y6_N22
\LessThan0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~21_cout\ = CARRY((\k[11]~input_o\ & ((!\LessThan0~19_cout\) # (!s_counter(10)))) # (!\k[11]~input_o\ & (!s_counter(10) & !\LessThan0~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[11]~input_o\,
	datab => s_counter(10),
	datad => VCC,
	cin => \LessThan0~19_cout\,
	cout => \LessThan0~21_cout\);

-- Location: LCCOMB_X32_Y6_N24
\LessThan0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~23_cout\ = CARRY((\k[12]~input_o\ & (s_counter(11) & !\LessThan0~21_cout\)) # (!\k[12]~input_o\ & ((s_counter(11)) # (!\LessThan0~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[12]~input_o\,
	datab => s_counter(11),
	datad => VCC,
	cin => \LessThan0~21_cout\,
	cout => \LessThan0~23_cout\);

-- Location: LCCOMB_X32_Y6_N26
\LessThan0~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~25_cout\ = CARRY((s_counter(12) & (\k[13]~input_o\ & !\LessThan0~23_cout\)) # (!s_counter(12) & ((\k[13]~input_o\) # (!\LessThan0~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(12),
	datab => \k[13]~input_o\,
	datad => VCC,
	cin => \LessThan0~23_cout\,
	cout => \LessThan0~25_cout\);

-- Location: LCCOMB_X32_Y6_N28
\LessThan0~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~27_cout\ = CARRY((s_counter(13) & ((!\LessThan0~25_cout\) # (!\k[14]~input_o\))) # (!s_counter(13) & (!\k[14]~input_o\ & !\LessThan0~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(13),
	datab => \k[14]~input_o\,
	datad => VCC,
	cin => \LessThan0~25_cout\,
	cout => \LessThan0~27_cout\);

-- Location: LCCOMB_X32_Y6_N30
\LessThan0~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~29_cout\ = CARRY((s_counter(14) & (\k[15]~input_o\ & !\LessThan0~27_cout\)) # (!s_counter(14) & ((\k[15]~input_o\) # (!\LessThan0~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(14),
	datab => \k[15]~input_o\,
	datad => VCC,
	cin => \LessThan0~27_cout\,
	cout => \LessThan0~29_cout\);

-- Location: LCCOMB_X32_Y5_N0
\LessThan0~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~31_cout\ = CARRY((\k[16]~input_o\ & (s_counter(15) & !\LessThan0~29_cout\)) # (!\k[16]~input_o\ & ((s_counter(15)) # (!\LessThan0~29_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[16]~input_o\,
	datab => s_counter(15),
	datad => VCC,
	cin => \LessThan0~29_cout\,
	cout => \LessThan0~31_cout\);

-- Location: LCCOMB_X32_Y5_N2
\LessThan0~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~33_cout\ = CARRY((s_counter(16) & (\k[17]~input_o\ & !\LessThan0~31_cout\)) # (!s_counter(16) & ((\k[17]~input_o\) # (!\LessThan0~31_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(16),
	datab => \k[17]~input_o\,
	datad => VCC,
	cin => \LessThan0~31_cout\,
	cout => \LessThan0~33_cout\);

-- Location: LCCOMB_X32_Y5_N4
\LessThan0~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~35_cout\ = CARRY((s_counter(17) & ((!\LessThan0~33_cout\) # (!\k[18]~input_o\))) # (!s_counter(17) & (!\k[18]~input_o\ & !\LessThan0~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(17),
	datab => \k[18]~input_o\,
	datad => VCC,
	cin => \LessThan0~33_cout\,
	cout => \LessThan0~35_cout\);

-- Location: LCCOMB_X32_Y5_N6
\LessThan0~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~37_cout\ = CARRY((\k[19]~input_o\ & ((!\LessThan0~35_cout\) # (!s_counter(18)))) # (!\k[19]~input_o\ & (!s_counter(18) & !\LessThan0~35_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[19]~input_o\,
	datab => s_counter(18),
	datad => VCC,
	cin => \LessThan0~35_cout\,
	cout => \LessThan0~37_cout\);

-- Location: LCCOMB_X32_Y5_N8
\LessThan0~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~39_cout\ = CARRY((\k[20]~input_o\ & (s_counter(19) & !\LessThan0~37_cout\)) # (!\k[20]~input_o\ & ((s_counter(19)) # (!\LessThan0~37_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[20]~input_o\,
	datab => s_counter(19),
	datad => VCC,
	cin => \LessThan0~37_cout\,
	cout => \LessThan0~39_cout\);

-- Location: LCCOMB_X32_Y5_N10
\LessThan0~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~41_cout\ = CARRY((s_counter(20) & (\k[21]~input_o\ & !\LessThan0~39_cout\)) # (!s_counter(20) & ((\k[21]~input_o\) # (!\LessThan0~39_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(20),
	datab => \k[21]~input_o\,
	datad => VCC,
	cin => \LessThan0~39_cout\,
	cout => \LessThan0~41_cout\);

-- Location: LCCOMB_X32_Y5_N12
\LessThan0~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~43_cout\ = CARRY((s_counter(21) & ((!\LessThan0~41_cout\) # (!\k[22]~input_o\))) # (!s_counter(21) & (!\k[22]~input_o\ & !\LessThan0~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(21),
	datab => \k[22]~input_o\,
	datad => VCC,
	cin => \LessThan0~41_cout\,
	cout => \LessThan0~43_cout\);

-- Location: LCCOMB_X32_Y5_N14
\LessThan0~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~45_cout\ = CARRY((s_counter(22) & (\k[23]~input_o\ & !\LessThan0~43_cout\)) # (!s_counter(22) & ((\k[23]~input_o\) # (!\LessThan0~43_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(22),
	datab => \k[23]~input_o\,
	datad => VCC,
	cin => \LessThan0~43_cout\,
	cout => \LessThan0~45_cout\);

-- Location: LCCOMB_X32_Y5_N16
\LessThan0~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~47_cout\ = CARRY((s_counter(23) & ((!\LessThan0~45_cout\) # (!\k[24]~input_o\))) # (!s_counter(23) & (!\k[24]~input_o\ & !\LessThan0~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(23),
	datab => \k[24]~input_o\,
	datad => VCC,
	cin => \LessThan0~45_cout\,
	cout => \LessThan0~47_cout\);

-- Location: LCCOMB_X32_Y5_N18
\LessThan0~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~49_cout\ = CARRY((s_counter(24) & (\k[25]~input_o\ & !\LessThan0~47_cout\)) # (!s_counter(24) & ((\k[25]~input_o\) # (!\LessThan0~47_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(24),
	datab => \k[25]~input_o\,
	datad => VCC,
	cin => \LessThan0~47_cout\,
	cout => \LessThan0~49_cout\);

-- Location: LCCOMB_X32_Y5_N20
\LessThan0~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~51_cout\ = CARRY((\k[26]~input_o\ & (s_counter(25) & !\LessThan0~49_cout\)) # (!\k[26]~input_o\ & ((s_counter(25)) # (!\LessThan0~49_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[26]~input_o\,
	datab => s_counter(25),
	datad => VCC,
	cin => \LessThan0~49_cout\,
	cout => \LessThan0~51_cout\);

-- Location: LCCOMB_X32_Y5_N22
\LessThan0~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~53_cout\ = CARRY((\k[27]~input_o\ & ((!\LessThan0~51_cout\) # (!s_counter(26)))) # (!\k[27]~input_o\ & (!s_counter(26) & !\LessThan0~51_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[27]~input_o\,
	datab => s_counter(26),
	datad => VCC,
	cin => \LessThan0~51_cout\,
	cout => \LessThan0~53_cout\);

-- Location: LCCOMB_X32_Y5_N24
\LessThan0~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~55_cout\ = CARRY((\k[28]~input_o\ & (s_counter(27) & !\LessThan0~53_cout\)) # (!\k[28]~input_o\ & ((s_counter(27)) # (!\LessThan0~53_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[28]~input_o\,
	datab => s_counter(27),
	datad => VCC,
	cin => \LessThan0~53_cout\,
	cout => \LessThan0~55_cout\);

-- Location: LCCOMB_X32_Y5_N26
\LessThan0~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~57_cout\ = CARRY((\k[29]~input_o\ & ((!\LessThan0~55_cout\) # (!s_counter(28)))) # (!\k[29]~input_o\ & (!s_counter(28) & !\LessThan0~55_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[29]~input_o\,
	datab => s_counter(28),
	datad => VCC,
	cin => \LessThan0~55_cout\,
	cout => \LessThan0~57_cout\);

-- Location: LCCOMB_X32_Y5_N28
\LessThan0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~58_combout\ = (s_counter(29) & (\LessThan0~57_cout\ & \k[30]~input_o\)) # (!s_counter(29) & ((\LessThan0~57_cout\) # (\k[30]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(29),
	datad => \k[30]~input_o\,
	cin => \LessThan0~57_cout\,
	combout => \LessThan0~58_combout\);

-- Location: LCCOMB_X32_Y5_N30
\LessThan0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~60_combout\ = (s_counter(31)) # ((s_counter(30)) # (!\LessThan0~58_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(31),
	datab => s_counter(30),
	datad => \LessThan0~58_combout\,
	combout => \LessThan0~60_combout\);

-- Location: FF_X32_Y6_N23
\s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[0]~32_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(0));

-- Location: LCCOMB_X31_Y6_N2
\s_counter[1]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[1]~34_combout\ = (s_counter(1) & (!\s_counter[0]~33\)) # (!s_counter(1) & ((\s_counter[0]~33\) # (GND)))
-- \s_counter[1]~35\ = CARRY((!\s_counter[0]~33\) # (!s_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(1),
	datad => VCC,
	cin => \s_counter[0]~33\,
	combout => \s_counter[1]~34_combout\,
	cout => \s_counter[1]~35\);

-- Location: FF_X32_Y6_N19
\s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[1]~34_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(1));

-- Location: LCCOMB_X31_Y6_N4
\s_counter[2]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[2]~36_combout\ = (s_counter(2) & (\s_counter[1]~35\ $ (GND))) # (!s_counter(2) & (!\s_counter[1]~35\ & VCC))
-- \s_counter[2]~37\ = CARRY((s_counter(2) & !\s_counter[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(2),
	datad => VCC,
	cin => \s_counter[1]~35\,
	combout => \s_counter[2]~36_combout\,
	cout => \s_counter[2]~37\);

-- Location: FF_X32_Y6_N15
\s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[2]~36_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(2));

-- Location: LCCOMB_X31_Y6_N6
\s_counter[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[3]~38_combout\ = (s_counter(3) & (!\s_counter[2]~37\)) # (!s_counter(3) & ((\s_counter[2]~37\) # (GND)))
-- \s_counter[3]~39\ = CARRY((!\s_counter[2]~37\) # (!s_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(3),
	datad => VCC,
	cin => \s_counter[2]~37\,
	combout => \s_counter[3]~38_combout\,
	cout => \s_counter[3]~39\);

-- Location: FF_X32_Y6_N21
\s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[3]~38_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(3));

-- Location: LCCOMB_X31_Y6_N8
\s_counter[4]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[4]~40_combout\ = (s_counter(4) & (\s_counter[3]~39\ $ (GND))) # (!s_counter(4) & (!\s_counter[3]~39\ & VCC))
-- \s_counter[4]~41\ = CARRY((s_counter(4) & !\s_counter[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(4),
	datad => VCC,
	cin => \s_counter[3]~39\,
	combout => \s_counter[4]~40_combout\,
	cout => \s_counter[4]~41\);

-- Location: FF_X32_Y6_N7
\s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[4]~40_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(4));

-- Location: LCCOMB_X31_Y6_N10
\s_counter[5]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[5]~42_combout\ = (s_counter(5) & (!\s_counter[4]~41\)) # (!s_counter(5) & ((\s_counter[4]~41\) # (GND)))
-- \s_counter[5]~43\ = CARRY((!\s_counter[4]~41\) # (!s_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(5),
	datad => VCC,
	cin => \s_counter[4]~41\,
	combout => \s_counter[5]~42_combout\,
	cout => \s_counter[5]~43\);

-- Location: FF_X31_Y6_N11
\s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[5]~42_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(5));

-- Location: LCCOMB_X31_Y6_N12
\s_counter[6]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[6]~44_combout\ = (s_counter(6) & (\s_counter[5]~43\ $ (GND))) # (!s_counter(6) & (!\s_counter[5]~43\ & VCC))
-- \s_counter[6]~45\ = CARRY((s_counter(6) & !\s_counter[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(6),
	datad => VCC,
	cin => \s_counter[5]~43\,
	combout => \s_counter[6]~44_combout\,
	cout => \s_counter[6]~45\);

-- Location: FF_X31_Y6_N13
\s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[6]~44_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(6));

-- Location: LCCOMB_X31_Y6_N14
\s_counter[7]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[7]~46_combout\ = (s_counter(7) & (!\s_counter[6]~45\)) # (!s_counter(7) & ((\s_counter[6]~45\) # (GND)))
-- \s_counter[7]~47\ = CARRY((!\s_counter[6]~45\) # (!s_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(7),
	datad => VCC,
	cin => \s_counter[6]~45\,
	combout => \s_counter[7]~46_combout\,
	cout => \s_counter[7]~47\);

-- Location: FF_X32_Y6_N31
\s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[7]~46_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(7));

-- Location: LCCOMB_X31_Y6_N16
\s_counter[8]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[8]~48_combout\ = (s_counter(8) & (\s_counter[7]~47\ $ (GND))) # (!s_counter(8) & (!\s_counter[7]~47\ & VCC))
-- \s_counter[8]~49\ = CARRY((s_counter(8) & !\s_counter[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(8),
	datad => VCC,
	cin => \s_counter[7]~47\,
	combout => \s_counter[8]~48_combout\,
	cout => \s_counter[8]~49\);

-- Location: FF_X32_Y6_N1
\s_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[8]~48_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(8));

-- Location: LCCOMB_X31_Y6_N18
\s_counter[9]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[9]~50_combout\ = (s_counter(9) & (!\s_counter[8]~49\)) # (!s_counter(9) & ((\s_counter[8]~49\) # (GND)))
-- \s_counter[9]~51\ = CARRY((!\s_counter[8]~49\) # (!s_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(9),
	datad => VCC,
	cin => \s_counter[8]~49\,
	combout => \s_counter[9]~50_combout\,
	cout => \s_counter[9]~51\);

-- Location: FF_X32_Y6_N17
\s_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[9]~50_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(9));

-- Location: LCCOMB_X31_Y6_N20
\s_counter[10]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[10]~52_combout\ = (s_counter(10) & (\s_counter[9]~51\ $ (GND))) # (!s_counter(10) & (!\s_counter[9]~51\ & VCC))
-- \s_counter[10]~53\ = CARRY((s_counter(10) & !\s_counter[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(10),
	datad => VCC,
	cin => \s_counter[9]~51\,
	combout => \s_counter[10]~52_combout\,
	cout => \s_counter[10]~53\);

-- Location: FF_X31_Y6_N21
\s_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[10]~52_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(10));

-- Location: LCCOMB_X31_Y6_N22
\s_counter[11]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[11]~54_combout\ = (s_counter(11) & (!\s_counter[10]~53\)) # (!s_counter(11) & ((\s_counter[10]~53\) # (GND)))
-- \s_counter[11]~55\ = CARRY((!\s_counter[10]~53\) # (!s_counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(11),
	datad => VCC,
	cin => \s_counter[10]~53\,
	combout => \s_counter[11]~54_combout\,
	cout => \s_counter[11]~55\);

-- Location: FF_X32_Y6_N3
\s_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[11]~54_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(11));

-- Location: LCCOMB_X31_Y6_N24
\s_counter[12]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[12]~56_combout\ = (s_counter(12) & (\s_counter[11]~55\ $ (GND))) # (!s_counter(12) & (!\s_counter[11]~55\ & VCC))
-- \s_counter[12]~57\ = CARRY((s_counter(12) & !\s_counter[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(12),
	datad => VCC,
	cin => \s_counter[11]~55\,
	combout => \s_counter[12]~56_combout\,
	cout => \s_counter[12]~57\);

-- Location: FF_X32_Y6_N13
\s_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[12]~56_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(12));

-- Location: LCCOMB_X31_Y6_N26
\s_counter[13]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[13]~58_combout\ = (s_counter(13) & (!\s_counter[12]~57\)) # (!s_counter(13) & ((\s_counter[12]~57\) # (GND)))
-- \s_counter[13]~59\ = CARRY((!\s_counter[12]~57\) # (!s_counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(13),
	datad => VCC,
	cin => \s_counter[12]~57\,
	combout => \s_counter[13]~58_combout\,
	cout => \s_counter[13]~59\);

-- Location: FF_X31_Y6_N27
\s_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[13]~58_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(13));

-- Location: LCCOMB_X31_Y6_N28
\s_counter[14]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[14]~60_combout\ = (s_counter(14) & (\s_counter[13]~59\ $ (GND))) # (!s_counter(14) & (!\s_counter[13]~59\ & VCC))
-- \s_counter[14]~61\ = CARRY((s_counter(14) & !\s_counter[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(14),
	datad => VCC,
	cin => \s_counter[13]~59\,
	combout => \s_counter[14]~60_combout\,
	cout => \s_counter[14]~61\);

-- Location: FF_X32_Y6_N11
\s_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[14]~60_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(14));

-- Location: LCCOMB_X31_Y6_N30
\s_counter[15]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[15]~62_combout\ = (s_counter(15) & (!\s_counter[14]~61\)) # (!s_counter(15) & ((\s_counter[14]~61\) # (GND)))
-- \s_counter[15]~63\ = CARRY((!\s_counter[14]~61\) # (!s_counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(15),
	datad => VCC,
	cin => \s_counter[14]~61\,
	combout => \s_counter[15]~62_combout\,
	cout => \s_counter[15]~63\);

-- Location: FF_X32_Y5_N15
\s_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[15]~62_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(15));

-- Location: LCCOMB_X31_Y5_N0
\s_counter[16]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[16]~64_combout\ = (s_counter(16) & (\s_counter[15]~63\ $ (GND))) # (!s_counter(16) & (!\s_counter[15]~63\ & VCC))
-- \s_counter[16]~65\ = CARRY((s_counter(16) & !\s_counter[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(16),
	datad => VCC,
	cin => \s_counter[15]~63\,
	combout => \s_counter[16]~64_combout\,
	cout => \s_counter[16]~65\);

-- Location: FF_X32_Y5_N31
\s_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	asdata => \s_counter[16]~64_combout\,
	sclr => \LessThan0~60_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(16));

-- Location: LCCOMB_X31_Y5_N2
\s_counter[17]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[17]~66_combout\ = (s_counter(17) & (!\s_counter[16]~65\)) # (!s_counter(17) & ((\s_counter[16]~65\) # (GND)))
-- \s_counter[17]~67\ = CARRY((!\s_counter[16]~65\) # (!s_counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(17),
	datad => VCC,
	cin => \s_counter[16]~65\,
	combout => \s_counter[17]~66_combout\,
	cout => \s_counter[17]~67\);

-- Location: FF_X31_Y5_N3
\s_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[17]~66_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(17));

-- Location: LCCOMB_X31_Y5_N4
\s_counter[18]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[18]~68_combout\ = (s_counter(18) & (\s_counter[17]~67\ $ (GND))) # (!s_counter(18) & (!\s_counter[17]~67\ & VCC))
-- \s_counter[18]~69\ = CARRY((s_counter(18) & !\s_counter[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(18),
	datad => VCC,
	cin => \s_counter[17]~67\,
	combout => \s_counter[18]~68_combout\,
	cout => \s_counter[18]~69\);

-- Location: FF_X31_Y5_N5
\s_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[18]~68_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(18));

-- Location: LCCOMB_X31_Y5_N6
\s_counter[19]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[19]~70_combout\ = (s_counter(19) & (!\s_counter[18]~69\)) # (!s_counter(19) & ((\s_counter[18]~69\) # (GND)))
-- \s_counter[19]~71\ = CARRY((!\s_counter[18]~69\) # (!s_counter(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(19),
	datad => VCC,
	cin => \s_counter[18]~69\,
	combout => \s_counter[19]~70_combout\,
	cout => \s_counter[19]~71\);

-- Location: FF_X31_Y5_N7
\s_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[19]~70_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(19));

-- Location: LCCOMB_X31_Y5_N8
\s_counter[20]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[20]~72_combout\ = (s_counter(20) & (\s_counter[19]~71\ $ (GND))) # (!s_counter(20) & (!\s_counter[19]~71\ & VCC))
-- \s_counter[20]~73\ = CARRY((s_counter(20) & !\s_counter[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(20),
	datad => VCC,
	cin => \s_counter[19]~71\,
	combout => \s_counter[20]~72_combout\,
	cout => \s_counter[20]~73\);

-- Location: FF_X31_Y5_N9
\s_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[20]~72_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(20));

-- Location: LCCOMB_X31_Y5_N10
\s_counter[21]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[21]~74_combout\ = (s_counter(21) & (!\s_counter[20]~73\)) # (!s_counter(21) & ((\s_counter[20]~73\) # (GND)))
-- \s_counter[21]~75\ = CARRY((!\s_counter[20]~73\) # (!s_counter(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(21),
	datad => VCC,
	cin => \s_counter[20]~73\,
	combout => \s_counter[21]~74_combout\,
	cout => \s_counter[21]~75\);

-- Location: FF_X31_Y5_N11
\s_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[21]~74_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(21));

-- Location: LCCOMB_X31_Y5_N12
\s_counter[22]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[22]~76_combout\ = (s_counter(22) & (\s_counter[21]~75\ $ (GND))) # (!s_counter(22) & (!\s_counter[21]~75\ & VCC))
-- \s_counter[22]~77\ = CARRY((s_counter(22) & !\s_counter[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(22),
	datad => VCC,
	cin => \s_counter[21]~75\,
	combout => \s_counter[22]~76_combout\,
	cout => \s_counter[22]~77\);

-- Location: FF_X31_Y5_N13
\s_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[22]~76_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(22));

-- Location: LCCOMB_X31_Y5_N14
\s_counter[23]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[23]~78_combout\ = (s_counter(23) & (!\s_counter[22]~77\)) # (!s_counter(23) & ((\s_counter[22]~77\) # (GND)))
-- \s_counter[23]~79\ = CARRY((!\s_counter[22]~77\) # (!s_counter(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(23),
	datad => VCC,
	cin => \s_counter[22]~77\,
	combout => \s_counter[23]~78_combout\,
	cout => \s_counter[23]~79\);

-- Location: FF_X31_Y5_N15
\s_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[23]~78_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(23));

-- Location: LCCOMB_X31_Y5_N16
\s_counter[24]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[24]~80_combout\ = (s_counter(24) & (\s_counter[23]~79\ $ (GND))) # (!s_counter(24) & (!\s_counter[23]~79\ & VCC))
-- \s_counter[24]~81\ = CARRY((s_counter(24) & !\s_counter[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(24),
	datad => VCC,
	cin => \s_counter[23]~79\,
	combout => \s_counter[24]~80_combout\,
	cout => \s_counter[24]~81\);

-- Location: FF_X31_Y5_N17
\s_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[24]~80_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(24));

-- Location: LCCOMB_X31_Y5_N18
\s_counter[25]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[25]~82_combout\ = (s_counter(25) & (!\s_counter[24]~81\)) # (!s_counter(25) & ((\s_counter[24]~81\) # (GND)))
-- \s_counter[25]~83\ = CARRY((!\s_counter[24]~81\) # (!s_counter(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(25),
	datad => VCC,
	cin => \s_counter[24]~81\,
	combout => \s_counter[25]~82_combout\,
	cout => \s_counter[25]~83\);

-- Location: FF_X31_Y5_N19
\s_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[25]~82_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(25));

-- Location: LCCOMB_X31_Y5_N20
\s_counter[26]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[26]~84_combout\ = (s_counter(26) & (\s_counter[25]~83\ $ (GND))) # (!s_counter(26) & (!\s_counter[25]~83\ & VCC))
-- \s_counter[26]~85\ = CARRY((s_counter(26) & !\s_counter[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(26),
	datad => VCC,
	cin => \s_counter[25]~83\,
	combout => \s_counter[26]~84_combout\,
	cout => \s_counter[26]~85\);

-- Location: FF_X31_Y5_N21
\s_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[26]~84_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(26));

-- Location: LCCOMB_X31_Y5_N22
\s_counter[27]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[27]~86_combout\ = (s_counter(27) & (!\s_counter[26]~85\)) # (!s_counter(27) & ((\s_counter[26]~85\) # (GND)))
-- \s_counter[27]~87\ = CARRY((!\s_counter[26]~85\) # (!s_counter(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(27),
	datad => VCC,
	cin => \s_counter[26]~85\,
	combout => \s_counter[27]~86_combout\,
	cout => \s_counter[27]~87\);

-- Location: FF_X31_Y5_N23
\s_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[27]~86_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(27));

-- Location: LCCOMB_X31_Y5_N24
\s_counter[28]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[28]~88_combout\ = (s_counter(28) & (\s_counter[27]~87\ $ (GND))) # (!s_counter(28) & (!\s_counter[27]~87\ & VCC))
-- \s_counter[28]~89\ = CARRY((s_counter(28) & !\s_counter[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => s_counter(28),
	datad => VCC,
	cin => \s_counter[27]~87\,
	combout => \s_counter[28]~88_combout\,
	cout => \s_counter[28]~89\);

-- Location: FF_X31_Y5_N25
\s_counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[28]~88_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(28));

-- Location: LCCOMB_X31_Y5_N26
\s_counter[29]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[29]~90_combout\ = (s_counter(29) & (!\s_counter[28]~89\)) # (!s_counter(29) & ((\s_counter[28]~89\) # (GND)))
-- \s_counter[29]~91\ = CARRY((!\s_counter[28]~89\) # (!s_counter(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(29),
	datad => VCC,
	cin => \s_counter[28]~89\,
	combout => \s_counter[29]~90_combout\,
	cout => \s_counter[29]~91\);

-- Location: FF_X31_Y5_N27
\s_counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[29]~90_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(29));

-- Location: FF_X31_Y5_N29
\s_counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \s_counter[30]~92_combout\,
	sclr => \LessThan0~60_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(30));

-- Location: LCCOMB_X33_Y5_N4
\clkOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clkOut~0_combout\ = \clkOut~reg0_q\ $ (((s_counter(30)) # ((s_counter(31)) # (!\LessThan0~58_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(30),
	datab => s_counter(31),
	datac => \clkOut~reg0_q\,
	datad => \LessThan0~58_combout\,
	combout => \clkOut~0_combout\);

-- Location: FF_X33_Y5_N5
\clkOut~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~inputclkctrl_outclk\,
	d => \clkOut~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkOut~reg0_q\);

-- Location: IOIBUF_X11_Y24_N15
\k[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(0),
	o => \k[0]~input_o\);

-- Location: IOIBUF_X28_Y24_N15
\k[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(31),
	o => \k[31]~input_o\);

ww_clkOut <= \clkOut~output_o\;
END structure;


