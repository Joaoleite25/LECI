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

-- DATE "04/22/2024 11:25:59"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
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
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


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

ENTITY 	fase1 IS
    PORT (
	CLOCK_50 : IN std_logic;
	SW : IN std_logic_vector(1 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(6 DOWNTO 0);
	LEDR : BUFFER std_logic_vector(3 DOWNTO 0);
	LEDG : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END fase1;

-- Design Ports Information
-- HEX0[0]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[6]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF fase1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_SW : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(3 DOWNTO 0);
SIGNAL \system_core|Equal1~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \system_core|Equal0~0clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \system_core|Equal2~0_combout\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[0]~24_combout\ : std_logic;
SIGNAL \system_core|Equal1~0_combout\ : std_logic;
SIGNAL \system_core|Equal1~0clkctrl_outclk\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[15]~55\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[16]~56_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[16]~57\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[17]~58_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[17]~59\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[18]~60_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[18]~61\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[19]~62_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[19]~63\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[20]~64_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[20]~65\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[21]~66_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[21]~67\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[22]~68_combout\ : std_logic;
SIGNAL \Blink_Prog2|LessThan0~6_combout\ : std_logic;
SIGNAL \Blink_Prog2|LessThan0~7_combout\ : std_logic;
SIGNAL \Blink_Prog2|LessThan0~1_combout\ : std_logic;
SIGNAL \Blink_Prog2|LessThan0~0_combout\ : std_logic;
SIGNAL \Blink_Prog2|LessThan0~2_combout\ : std_logic;
SIGNAL \Blink_Prog2|LessThan0~3_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[22]~69\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[23]~70_combout\ : std_logic;
SIGNAL \Blink_Prog2|LessThan0~4_combout\ : std_logic;
SIGNAL \LEDR~3_combout\ : std_logic;
SIGNAL \Blink_Prog2|LessThan0~5_combout\ : std_logic;
SIGNAL \Blink_Prog2|LessThan0~8_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[0]~25\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[1]~26_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[1]~27\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[2]~28_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[2]~29\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[3]~30_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[3]~31\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[4]~32_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[4]~33\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[5]~34_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[5]~35\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[6]~36_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[6]~37\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[7]~38_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[7]~39\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[8]~40_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[8]~41\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[9]~42_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[9]~43\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[10]~44_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[10]~45\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[11]~46_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[11]~47\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[12]~48_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[12]~49\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[13]~50_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[13]~51\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[14]~52_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[14]~53\ : std_logic;
SIGNAL \Blink_Prog2|s_counter[15]~54_combout\ : std_logic;
SIGNAL \LEDR~0_combout\ : std_logic;
SIGNAL \LEDR~1_combout\ : std_logic;
SIGNAL \LEDR~2_combout\ : std_logic;
SIGNAL \LEDR~4_combout\ : std_logic;
SIGNAL \LEDR~5_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[0]~26_combout\ : std_logic;
SIGNAL \system_core|Equal0~0_combout\ : std_logic;
SIGNAL \system_core|Equal0~0clkctrl_outclk\ : std_logic;
SIGNAL \Blink_Prog3|LessThan0~1_combout\ : std_logic;
SIGNAL \LEDG~3_combout\ : std_logic;
SIGNAL \Blink_Prog3|LessThan0~0_combout\ : std_logic;
SIGNAL \Blink_Prog3|LessThan0~4_combout\ : std_logic;
SIGNAL \Blink_Prog3|LessThan0~2_combout\ : std_logic;
SIGNAL \Blink_Prog3|LessThan0~3_combout\ : std_logic;
SIGNAL \Blink_Prog3|LessThan0~5_combout\ : std_logic;
SIGNAL \Blink_Prog3|LessThan0~6_combout\ : std_logic;
SIGNAL \Blink_Prog3|LessThan0~7_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[0]~27\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[1]~28_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[1]~29\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[2]~30_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[2]~31\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[3]~32_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[3]~33\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[4]~34_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[4]~35\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[5]~36_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[5]~37\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[6]~38_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[6]~39\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[7]~40_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[7]~41\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[8]~42_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[8]~43\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[9]~44_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[9]~45\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[10]~46_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[10]~47\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[11]~48_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[11]~49\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[12]~50_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[12]~51\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[13]~52_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[13]~53\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[14]~54_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[14]~55\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[15]~56_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[15]~57\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[16]~58_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[16]~59\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[17]~60_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[17]~61\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[18]~62_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[18]~63\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[19]~64_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[19]~65\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[20]~66_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[20]~67\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[21]~68_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[21]~69\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[22]~70_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[22]~71\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[23]~72_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[23]~73\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[24]~74_combout\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[24]~75\ : std_logic;
SIGNAL \Blink_Prog3|s_counter[25]~76_combout\ : std_logic;
SIGNAL \LEDG~0_combout\ : std_logic;
SIGNAL \LEDG~1_combout\ : std_logic;
SIGNAL \LEDG~2_combout\ : std_logic;
SIGNAL \LEDG~4_combout\ : std_logic;
SIGNAL \LEDG~5_combout\ : std_logic;
SIGNAL \Blink_Prog2|s_counter\ : std_logic_vector(23 DOWNTO 0);
SIGNAL \Blink_Prog3|s_counter\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \system_core|ALT_INV_Equal0~0clkctrl_outclk\ : std_logic;
SIGNAL \system_core|ALT_INV_Equal1~0clkctrl_outclk\ : std_logic;
SIGNAL \system_core|ALT_INV_Equal2~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_CLOCK_50 <= CLOCK_50;
ww_SW <= SW;
HEX0 <= ww_HEX0;
LEDR <= ww_LEDR;
LEDG <= ww_LEDG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\system_core|Equal1~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \system_core|Equal1~0_combout\);

\system_core|Equal0~0clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \system_core|Equal0~0_combout\);

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\system_core|ALT_INV_Equal0~0clkctrl_outclk\ <= NOT \system_core|Equal0~0clkctrl_outclk\;
\system_core|ALT_INV_Equal1~0clkctrl_outclk\ <= NOT \system_core|Equal1~0clkctrl_outclk\;
\system_core|ALT_INV_Equal2~0_combout\ <= NOT \system_core|Equal2~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X67_Y73_N2
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[1]~input_o\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X52_Y73_N9
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \system_core|ALT_INV_Equal2~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[1]~input_o\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X52_Y73_N2
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \system_core|Equal2~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X35_Y73_N23
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \SW[1]~input_o\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~5_combout\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOOBUF_X67_Y73_N16
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~5_combout\,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~5_combout\,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDR~5_combout\,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X45_Y73_N2
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDG~5_combout\,
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X45_Y73_N9
\LEDG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDG~5_combout\,
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X47_Y73_N16
\LEDG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDG~5_combout\,
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X47_Y73_N2
\LEDG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \LEDG~5_combout\,
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOIBUF_X69_Y73_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

-- Location: IOIBUF_X65_Y73_N8
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

-- Location: LCCOMB_X65_Y69_N12
\system_core|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \system_core|Equal2~0_combout\ = (\SW[0]~input_o\) # (\SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[0]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \system_core|Equal2~0_combout\);

-- Location: IOIBUF_X0_Y36_N8
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G2
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: LCCOMB_X66_Y70_N8
\Blink_Prog2|s_counter[0]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[0]~24_combout\ = \Blink_Prog2|s_counter\(0) $ (VCC)
-- \Blink_Prog2|s_counter[0]~25\ = CARRY(\Blink_Prog2|s_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(0),
	datad => VCC,
	combout => \Blink_Prog2|s_counter[0]~24_combout\,
	cout => \Blink_Prog2|s_counter[0]~25\);

-- Location: LCCOMB_X65_Y69_N10
\system_core|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \system_core|Equal1~0_combout\ = (\SW[1]~input_o\) # (!\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[0]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \system_core|Equal1~0_combout\);

-- Location: CLKCTRL_G14
\system_core|Equal1~0clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \system_core|Equal1~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \system_core|Equal1~0clkctrl_outclk\);

-- Location: LCCOMB_X66_Y69_N6
\Blink_Prog2|s_counter[15]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[15]~54_combout\ = (\Blink_Prog2|s_counter\(15) & (!\Blink_Prog2|s_counter[14]~53\)) # (!\Blink_Prog2|s_counter\(15) & ((\Blink_Prog2|s_counter[14]~53\) # (GND)))
-- \Blink_Prog2|s_counter[15]~55\ = CARRY((!\Blink_Prog2|s_counter[14]~53\) # (!\Blink_Prog2|s_counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(15),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[14]~53\,
	combout => \Blink_Prog2|s_counter[15]~54_combout\,
	cout => \Blink_Prog2|s_counter[15]~55\);

-- Location: LCCOMB_X66_Y69_N8
\Blink_Prog2|s_counter[16]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[16]~56_combout\ = (\Blink_Prog2|s_counter\(16) & (\Blink_Prog2|s_counter[15]~55\ $ (GND))) # (!\Blink_Prog2|s_counter\(16) & (!\Blink_Prog2|s_counter[15]~55\ & VCC))
-- \Blink_Prog2|s_counter[16]~57\ = CARRY((\Blink_Prog2|s_counter\(16) & !\Blink_Prog2|s_counter[15]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(16),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[15]~55\,
	combout => \Blink_Prog2|s_counter[16]~56_combout\,
	cout => \Blink_Prog2|s_counter[16]~57\);

-- Location: FF_X66_Y69_N9
\Blink_Prog2|s_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[16]~56_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(16));

-- Location: LCCOMB_X66_Y69_N10
\Blink_Prog2|s_counter[17]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[17]~58_combout\ = (\Blink_Prog2|s_counter\(17) & (!\Blink_Prog2|s_counter[16]~57\)) # (!\Blink_Prog2|s_counter\(17) & ((\Blink_Prog2|s_counter[16]~57\) # (GND)))
-- \Blink_Prog2|s_counter[17]~59\ = CARRY((!\Blink_Prog2|s_counter[16]~57\) # (!\Blink_Prog2|s_counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(17),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[16]~57\,
	combout => \Blink_Prog2|s_counter[17]~58_combout\,
	cout => \Blink_Prog2|s_counter[17]~59\);

-- Location: FF_X66_Y69_N11
\Blink_Prog2|s_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[17]~58_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(17));

-- Location: LCCOMB_X66_Y69_N12
\Blink_Prog2|s_counter[18]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[18]~60_combout\ = (\Blink_Prog2|s_counter\(18) & (\Blink_Prog2|s_counter[17]~59\ $ (GND))) # (!\Blink_Prog2|s_counter\(18) & (!\Blink_Prog2|s_counter[17]~59\ & VCC))
-- \Blink_Prog2|s_counter[18]~61\ = CARRY((\Blink_Prog2|s_counter\(18) & !\Blink_Prog2|s_counter[17]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(18),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[17]~59\,
	combout => \Blink_Prog2|s_counter[18]~60_combout\,
	cout => \Blink_Prog2|s_counter[18]~61\);

-- Location: FF_X66_Y69_N13
\Blink_Prog2|s_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[18]~60_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(18));

-- Location: LCCOMB_X66_Y69_N14
\Blink_Prog2|s_counter[19]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[19]~62_combout\ = (\Blink_Prog2|s_counter\(19) & (!\Blink_Prog2|s_counter[18]~61\)) # (!\Blink_Prog2|s_counter\(19) & ((\Blink_Prog2|s_counter[18]~61\) # (GND)))
-- \Blink_Prog2|s_counter[19]~63\ = CARRY((!\Blink_Prog2|s_counter[18]~61\) # (!\Blink_Prog2|s_counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(19),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[18]~61\,
	combout => \Blink_Prog2|s_counter[19]~62_combout\,
	cout => \Blink_Prog2|s_counter[19]~63\);

-- Location: FF_X66_Y69_N15
\Blink_Prog2|s_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[19]~62_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(19));

-- Location: LCCOMB_X66_Y69_N16
\Blink_Prog2|s_counter[20]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[20]~64_combout\ = (\Blink_Prog2|s_counter\(20) & (\Blink_Prog2|s_counter[19]~63\ $ (GND))) # (!\Blink_Prog2|s_counter\(20) & (!\Blink_Prog2|s_counter[19]~63\ & VCC))
-- \Blink_Prog2|s_counter[20]~65\ = CARRY((\Blink_Prog2|s_counter\(20) & !\Blink_Prog2|s_counter[19]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(20),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[19]~63\,
	combout => \Blink_Prog2|s_counter[20]~64_combout\,
	cout => \Blink_Prog2|s_counter[20]~65\);

-- Location: FF_X66_Y69_N17
\Blink_Prog2|s_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[20]~64_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(20));

-- Location: LCCOMB_X66_Y69_N18
\Blink_Prog2|s_counter[21]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[21]~66_combout\ = (\Blink_Prog2|s_counter\(21) & (!\Blink_Prog2|s_counter[20]~65\)) # (!\Blink_Prog2|s_counter\(21) & ((\Blink_Prog2|s_counter[20]~65\) # (GND)))
-- \Blink_Prog2|s_counter[21]~67\ = CARRY((!\Blink_Prog2|s_counter[20]~65\) # (!\Blink_Prog2|s_counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(21),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[20]~65\,
	combout => \Blink_Prog2|s_counter[21]~66_combout\,
	cout => \Blink_Prog2|s_counter[21]~67\);

-- Location: FF_X66_Y69_N19
\Blink_Prog2|s_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[21]~66_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(21));

-- Location: LCCOMB_X66_Y69_N20
\Blink_Prog2|s_counter[22]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[22]~68_combout\ = (\Blink_Prog2|s_counter\(22) & (\Blink_Prog2|s_counter[21]~67\ $ (GND))) # (!\Blink_Prog2|s_counter\(22) & (!\Blink_Prog2|s_counter[21]~67\ & VCC))
-- \Blink_Prog2|s_counter[22]~69\ = CARRY((\Blink_Prog2|s_counter\(22) & !\Blink_Prog2|s_counter[21]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(22),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[21]~67\,
	combout => \Blink_Prog2|s_counter[22]~68_combout\,
	cout => \Blink_Prog2|s_counter[22]~69\);

-- Location: FF_X66_Y69_N21
\Blink_Prog2|s_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[22]~68_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(22));

-- Location: LCCOMB_X65_Y69_N16
\Blink_Prog2|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|LessThan0~6_combout\ = (!\Blink_Prog2|s_counter\(16) & (!\Blink_Prog2|s_counter\(22) & !\Blink_Prog2|s_counter\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(16),
	datac => \Blink_Prog2|s_counter\(22),
	datad => \Blink_Prog2|s_counter\(14),
	combout => \Blink_Prog2|LessThan0~6_combout\);

-- Location: LCCOMB_X66_Y69_N24
\Blink_Prog2|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|LessThan0~7_combout\ = (((!\Blink_Prog2|s_counter\(12)) # (!\Blink_Prog2|s_counter\(11))) # (!\Blink_Prog2|s_counter\(13))) # (!\Blink_Prog2|s_counter\(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(10),
	datab => \Blink_Prog2|s_counter\(13),
	datac => \Blink_Prog2|s_counter\(11),
	datad => \Blink_Prog2|s_counter\(12),
	combout => \Blink_Prog2|LessThan0~7_combout\);

-- Location: LCCOMB_X66_Y69_N28
\Blink_Prog2|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|LessThan0~1_combout\ = (!\Blink_Prog2|s_counter\(16) & (!\Blink_Prog2|s_counter\(22) & (!\Blink_Prog2|s_counter\(14) & !\Blink_Prog2|s_counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(16),
	datab => \Blink_Prog2|s_counter\(22),
	datac => \Blink_Prog2|s_counter\(14),
	datad => \Blink_Prog2|s_counter\(9),
	combout => \Blink_Prog2|LessThan0~1_combout\);

-- Location: LCCOMB_X66_Y70_N2
\Blink_Prog2|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|LessThan0~0_combout\ = (!\Blink_Prog2|s_counter\(7) & (!\Blink_Prog2|s_counter\(5) & (!\Blink_Prog2|s_counter\(8) & !\Blink_Prog2|s_counter\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(7),
	datab => \Blink_Prog2|s_counter\(5),
	datac => \Blink_Prog2|s_counter\(8),
	datad => \Blink_Prog2|s_counter\(6),
	combout => \Blink_Prog2|LessThan0~0_combout\);

-- Location: LCCOMB_X66_Y70_N6
\Blink_Prog2|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|LessThan0~2_combout\ = (((!\Blink_Prog2|s_counter\(1)) # (!\Blink_Prog2|s_counter\(0))) # (!\Blink_Prog2|s_counter\(4))) # (!\Blink_Prog2|s_counter\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(2),
	datab => \Blink_Prog2|s_counter\(4),
	datac => \Blink_Prog2|s_counter\(0),
	datad => \Blink_Prog2|s_counter\(1),
	combout => \Blink_Prog2|LessThan0~2_combout\);

-- Location: LCCOMB_X66_Y69_N26
\Blink_Prog2|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|LessThan0~3_combout\ = (\Blink_Prog2|LessThan0~1_combout\ & (\Blink_Prog2|LessThan0~0_combout\ & ((\Blink_Prog2|LessThan0~2_combout\) # (!\Blink_Prog2|s_counter\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(3),
	datab => \Blink_Prog2|LessThan0~1_combout\,
	datac => \Blink_Prog2|LessThan0~0_combout\,
	datad => \Blink_Prog2|LessThan0~2_combout\,
	combout => \Blink_Prog2|LessThan0~3_combout\);

-- Location: LCCOMB_X66_Y69_N22
\Blink_Prog2|s_counter[23]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[23]~70_combout\ = \Blink_Prog2|s_counter\(23) $ (\Blink_Prog2|s_counter[22]~69\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(23),
	cin => \Blink_Prog2|s_counter[22]~69\,
	combout => \Blink_Prog2|s_counter[23]~70_combout\);

-- Location: FF_X66_Y69_N23
\Blink_Prog2|s_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[23]~70_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(23));

-- Location: LCCOMB_X65_Y69_N8
\Blink_Prog2|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|LessThan0~4_combout\ = ((!\Blink_Prog2|s_counter\(15) & !\Blink_Prog2|s_counter\(16))) # (!\Blink_Prog2|s_counter\(21))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(15),
	datac => \Blink_Prog2|s_counter\(16),
	datad => \Blink_Prog2|s_counter\(21),
	combout => \Blink_Prog2|LessThan0~4_combout\);

-- Location: LCCOMB_X65_Y69_N20
\LEDR~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDR~3_combout\ = (\Blink_Prog2|s_counter\(18) & (\Blink_Prog2|s_counter\(17) & (\Blink_Prog2|s_counter\(19) & \Blink_Prog2|s_counter\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(18),
	datab => \Blink_Prog2|s_counter\(17),
	datac => \Blink_Prog2|s_counter\(19),
	datad => \Blink_Prog2|s_counter\(20),
	combout => \LEDR~3_combout\);

-- Location: LCCOMB_X65_Y69_N14
\Blink_Prog2|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|LessThan0~5_combout\ = ((!\Blink_Prog2|s_counter\(22) & ((\Blink_Prog2|LessThan0~4_combout\) # (!\LEDR~3_combout\)))) # (!\Blink_Prog2|s_counter\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(22),
	datab => \Blink_Prog2|s_counter\(23),
	datac => \Blink_Prog2|LessThan0~4_combout\,
	datad => \LEDR~3_combout\,
	combout => \Blink_Prog2|LessThan0~5_combout\);

-- Location: LCCOMB_X66_Y69_N30
\Blink_Prog2|LessThan0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|LessThan0~8_combout\ = (!\Blink_Prog2|LessThan0~3_combout\ & (!\Blink_Prog2|LessThan0~5_combout\ & ((!\Blink_Prog2|LessThan0~7_combout\) # (!\Blink_Prog2|LessThan0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|LessThan0~6_combout\,
	datab => \Blink_Prog2|LessThan0~7_combout\,
	datac => \Blink_Prog2|LessThan0~3_combout\,
	datad => \Blink_Prog2|LessThan0~5_combout\,
	combout => \Blink_Prog2|LessThan0~8_combout\);

-- Location: FF_X66_Y70_N9
\Blink_Prog2|s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[0]~24_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(0));

-- Location: LCCOMB_X66_Y70_N10
\Blink_Prog2|s_counter[1]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[1]~26_combout\ = (\Blink_Prog2|s_counter\(1) & (!\Blink_Prog2|s_counter[0]~25\)) # (!\Blink_Prog2|s_counter\(1) & ((\Blink_Prog2|s_counter[0]~25\) # (GND)))
-- \Blink_Prog2|s_counter[1]~27\ = CARRY((!\Blink_Prog2|s_counter[0]~25\) # (!\Blink_Prog2|s_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(1),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[0]~25\,
	combout => \Blink_Prog2|s_counter[1]~26_combout\,
	cout => \Blink_Prog2|s_counter[1]~27\);

-- Location: FF_X66_Y70_N11
\Blink_Prog2|s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[1]~26_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(1));

-- Location: LCCOMB_X66_Y70_N12
\Blink_Prog2|s_counter[2]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[2]~28_combout\ = (\Blink_Prog2|s_counter\(2) & (\Blink_Prog2|s_counter[1]~27\ $ (GND))) # (!\Blink_Prog2|s_counter\(2) & (!\Blink_Prog2|s_counter[1]~27\ & VCC))
-- \Blink_Prog2|s_counter[2]~29\ = CARRY((\Blink_Prog2|s_counter\(2) & !\Blink_Prog2|s_counter[1]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(2),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[1]~27\,
	combout => \Blink_Prog2|s_counter[2]~28_combout\,
	cout => \Blink_Prog2|s_counter[2]~29\);

-- Location: FF_X66_Y70_N13
\Blink_Prog2|s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[2]~28_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(2));

-- Location: LCCOMB_X66_Y70_N14
\Blink_Prog2|s_counter[3]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[3]~30_combout\ = (\Blink_Prog2|s_counter\(3) & (!\Blink_Prog2|s_counter[2]~29\)) # (!\Blink_Prog2|s_counter\(3) & ((\Blink_Prog2|s_counter[2]~29\) # (GND)))
-- \Blink_Prog2|s_counter[3]~31\ = CARRY((!\Blink_Prog2|s_counter[2]~29\) # (!\Blink_Prog2|s_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(3),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[2]~29\,
	combout => \Blink_Prog2|s_counter[3]~30_combout\,
	cout => \Blink_Prog2|s_counter[3]~31\);

-- Location: FF_X66_Y70_N15
\Blink_Prog2|s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[3]~30_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(3));

-- Location: LCCOMB_X66_Y70_N16
\Blink_Prog2|s_counter[4]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[4]~32_combout\ = (\Blink_Prog2|s_counter\(4) & (\Blink_Prog2|s_counter[3]~31\ $ (GND))) # (!\Blink_Prog2|s_counter\(4) & (!\Blink_Prog2|s_counter[3]~31\ & VCC))
-- \Blink_Prog2|s_counter[4]~33\ = CARRY((\Blink_Prog2|s_counter\(4) & !\Blink_Prog2|s_counter[3]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(4),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[3]~31\,
	combout => \Blink_Prog2|s_counter[4]~32_combout\,
	cout => \Blink_Prog2|s_counter[4]~33\);

-- Location: FF_X66_Y70_N17
\Blink_Prog2|s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[4]~32_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(4));

-- Location: LCCOMB_X66_Y70_N18
\Blink_Prog2|s_counter[5]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[5]~34_combout\ = (\Blink_Prog2|s_counter\(5) & (!\Blink_Prog2|s_counter[4]~33\)) # (!\Blink_Prog2|s_counter\(5) & ((\Blink_Prog2|s_counter[4]~33\) # (GND)))
-- \Blink_Prog2|s_counter[5]~35\ = CARRY((!\Blink_Prog2|s_counter[4]~33\) # (!\Blink_Prog2|s_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(5),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[4]~33\,
	combout => \Blink_Prog2|s_counter[5]~34_combout\,
	cout => \Blink_Prog2|s_counter[5]~35\);

-- Location: FF_X66_Y70_N19
\Blink_Prog2|s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[5]~34_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(5));

-- Location: LCCOMB_X66_Y70_N20
\Blink_Prog2|s_counter[6]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[6]~36_combout\ = (\Blink_Prog2|s_counter\(6) & (\Blink_Prog2|s_counter[5]~35\ $ (GND))) # (!\Blink_Prog2|s_counter\(6) & (!\Blink_Prog2|s_counter[5]~35\ & VCC))
-- \Blink_Prog2|s_counter[6]~37\ = CARRY((\Blink_Prog2|s_counter\(6) & !\Blink_Prog2|s_counter[5]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(6),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[5]~35\,
	combout => \Blink_Prog2|s_counter[6]~36_combout\,
	cout => \Blink_Prog2|s_counter[6]~37\);

-- Location: FF_X66_Y70_N21
\Blink_Prog2|s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[6]~36_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(6));

-- Location: LCCOMB_X66_Y70_N22
\Blink_Prog2|s_counter[7]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[7]~38_combout\ = (\Blink_Prog2|s_counter\(7) & (!\Blink_Prog2|s_counter[6]~37\)) # (!\Blink_Prog2|s_counter\(7) & ((\Blink_Prog2|s_counter[6]~37\) # (GND)))
-- \Blink_Prog2|s_counter[7]~39\ = CARRY((!\Blink_Prog2|s_counter[6]~37\) # (!\Blink_Prog2|s_counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(7),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[6]~37\,
	combout => \Blink_Prog2|s_counter[7]~38_combout\,
	cout => \Blink_Prog2|s_counter[7]~39\);

-- Location: FF_X66_Y70_N23
\Blink_Prog2|s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[7]~38_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(7));

-- Location: LCCOMB_X66_Y70_N24
\Blink_Prog2|s_counter[8]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[8]~40_combout\ = (\Blink_Prog2|s_counter\(8) & (\Blink_Prog2|s_counter[7]~39\ $ (GND))) # (!\Blink_Prog2|s_counter\(8) & (!\Blink_Prog2|s_counter[7]~39\ & VCC))
-- \Blink_Prog2|s_counter[8]~41\ = CARRY((\Blink_Prog2|s_counter\(8) & !\Blink_Prog2|s_counter[7]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(8),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[7]~39\,
	combout => \Blink_Prog2|s_counter[8]~40_combout\,
	cout => \Blink_Prog2|s_counter[8]~41\);

-- Location: FF_X66_Y70_N25
\Blink_Prog2|s_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[8]~40_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(8));

-- Location: LCCOMB_X66_Y70_N26
\Blink_Prog2|s_counter[9]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[9]~42_combout\ = (\Blink_Prog2|s_counter\(9) & (!\Blink_Prog2|s_counter[8]~41\)) # (!\Blink_Prog2|s_counter\(9) & ((\Blink_Prog2|s_counter[8]~41\) # (GND)))
-- \Blink_Prog2|s_counter[9]~43\ = CARRY((!\Blink_Prog2|s_counter[8]~41\) # (!\Blink_Prog2|s_counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(9),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[8]~41\,
	combout => \Blink_Prog2|s_counter[9]~42_combout\,
	cout => \Blink_Prog2|s_counter[9]~43\);

-- Location: FF_X66_Y70_N27
\Blink_Prog2|s_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[9]~42_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(9));

-- Location: LCCOMB_X66_Y70_N28
\Blink_Prog2|s_counter[10]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[10]~44_combout\ = (\Blink_Prog2|s_counter\(10) & (\Blink_Prog2|s_counter[9]~43\ $ (GND))) # (!\Blink_Prog2|s_counter\(10) & (!\Blink_Prog2|s_counter[9]~43\ & VCC))
-- \Blink_Prog2|s_counter[10]~45\ = CARRY((\Blink_Prog2|s_counter\(10) & !\Blink_Prog2|s_counter[9]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(10),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[9]~43\,
	combout => \Blink_Prog2|s_counter[10]~44_combout\,
	cout => \Blink_Prog2|s_counter[10]~45\);

-- Location: FF_X66_Y70_N29
\Blink_Prog2|s_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[10]~44_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(10));

-- Location: LCCOMB_X66_Y70_N30
\Blink_Prog2|s_counter[11]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[11]~46_combout\ = (\Blink_Prog2|s_counter\(11) & (!\Blink_Prog2|s_counter[10]~45\)) # (!\Blink_Prog2|s_counter\(11) & ((\Blink_Prog2|s_counter[10]~45\) # (GND)))
-- \Blink_Prog2|s_counter[11]~47\ = CARRY((!\Blink_Prog2|s_counter[10]~45\) # (!\Blink_Prog2|s_counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(11),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[10]~45\,
	combout => \Blink_Prog2|s_counter[11]~46_combout\,
	cout => \Blink_Prog2|s_counter[11]~47\);

-- Location: FF_X67_Y69_N1
\Blink_Prog2|s_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \Blink_Prog2|s_counter[11]~46_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(11));

-- Location: LCCOMB_X66_Y69_N0
\Blink_Prog2|s_counter[12]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[12]~48_combout\ = (\Blink_Prog2|s_counter\(12) & (\Blink_Prog2|s_counter[11]~47\ $ (GND))) # (!\Blink_Prog2|s_counter\(12) & (!\Blink_Prog2|s_counter[11]~47\ & VCC))
-- \Blink_Prog2|s_counter[12]~49\ = CARRY((\Blink_Prog2|s_counter\(12) & !\Blink_Prog2|s_counter[11]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(12),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[11]~47\,
	combout => \Blink_Prog2|s_counter[12]~48_combout\,
	cout => \Blink_Prog2|s_counter[12]~49\);

-- Location: FF_X66_Y69_N1
\Blink_Prog2|s_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[12]~48_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(12));

-- Location: LCCOMB_X66_Y69_N2
\Blink_Prog2|s_counter[13]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[13]~50_combout\ = (\Blink_Prog2|s_counter\(13) & (!\Blink_Prog2|s_counter[12]~49\)) # (!\Blink_Prog2|s_counter\(13) & ((\Blink_Prog2|s_counter[12]~49\) # (GND)))
-- \Blink_Prog2|s_counter[13]~51\ = CARRY((!\Blink_Prog2|s_counter[12]~49\) # (!\Blink_Prog2|s_counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(13),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[12]~49\,
	combout => \Blink_Prog2|s_counter[13]~50_combout\,
	cout => \Blink_Prog2|s_counter[13]~51\);

-- Location: FF_X66_Y69_N3
\Blink_Prog2|s_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[13]~50_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(13));

-- Location: LCCOMB_X66_Y69_N4
\Blink_Prog2|s_counter[14]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog2|s_counter[14]~52_combout\ = (\Blink_Prog2|s_counter\(14) & (\Blink_Prog2|s_counter[13]~51\ $ (GND))) # (!\Blink_Prog2|s_counter\(14) & (!\Blink_Prog2|s_counter[13]~51\ & VCC))
-- \Blink_Prog2|s_counter[14]~53\ = CARRY((\Blink_Prog2|s_counter\(14) & !\Blink_Prog2|s_counter[13]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog2|s_counter\(14),
	datad => VCC,
	cin => \Blink_Prog2|s_counter[13]~51\,
	combout => \Blink_Prog2|s_counter[14]~52_combout\,
	cout => \Blink_Prog2|s_counter[14]~53\);

-- Location: FF_X66_Y69_N5
\Blink_Prog2|s_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[14]~52_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(14));

-- Location: FF_X66_Y69_N7
\Blink_Prog2|s_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog2|s_counter[15]~54_combout\,
	clrn => \system_core|ALT_INV_Equal1~0clkctrl_outclk\,
	sclr => \Blink_Prog2|LessThan0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog2|s_counter\(15));

-- Location: LCCOMB_X66_Y70_N0
\LEDR~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDR~0_combout\ = (\Blink_Prog2|s_counter\(12) & (\Blink_Prog2|s_counter\(10) & (\Blink_Prog2|s_counter\(9) & \Blink_Prog2|s_counter\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(12),
	datab => \Blink_Prog2|s_counter\(10),
	datac => \Blink_Prog2|s_counter\(9),
	datad => \Blink_Prog2|s_counter\(11),
	combout => \LEDR~0_combout\);

-- Location: LCCOMB_X66_Y70_N4
\LEDR~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDR~1_combout\ = (\Blink_Prog2|s_counter\(13)) # ((\LEDR~0_combout\ & ((\Blink_Prog2|s_counter\(4)) # (!\Blink_Prog2|LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|LessThan0~0_combout\,
	datab => \Blink_Prog2|s_counter\(13),
	datac => \Blink_Prog2|s_counter\(4),
	datad => \LEDR~0_combout\,
	combout => \LEDR~1_combout\);

-- Location: LCCOMB_X65_Y69_N26
\LEDR~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDR~2_combout\ = (\Blink_Prog2|s_counter\(15)) # ((\LEDR~1_combout\ & \Blink_Prog2|s_counter\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog2|s_counter\(15),
	datac => \LEDR~1_combout\,
	datad => \Blink_Prog2|s_counter\(14),
	combout => \LEDR~2_combout\);

-- Location: LCCOMB_X65_Y69_N22
\LEDR~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDR~4_combout\ = (\Blink_Prog2|s_counter\(21)) # ((\LEDR~2_combout\ & (\LEDR~3_combout\ & \Blink_Prog2|s_counter\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LEDR~2_combout\,
	datab => \LEDR~3_combout\,
	datac => \Blink_Prog2|s_counter\(16),
	datad => \Blink_Prog2|s_counter\(21),
	combout => \LEDR~4_combout\);

-- Location: LCCOMB_X65_Y69_N4
\LEDR~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDR~5_combout\ = (\Blink_Prog2|s_counter\(23)) # (((\LEDR~4_combout\ & \Blink_Prog2|s_counter\(22))) # (!\system_core|Equal2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LEDR~4_combout\,
	datab => \Blink_Prog2|s_counter\(23),
	datac => \Blink_Prog2|s_counter\(22),
	datad => \system_core|Equal2~0_combout\,
	combout => \LEDR~5_combout\);

-- Location: LCCOMB_X47_Y69_N6
\Blink_Prog3|s_counter[0]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[0]~26_combout\ = \Blink_Prog3|s_counter\(0) $ (VCC)
-- \Blink_Prog3|s_counter[0]~27\ = CARRY(\Blink_Prog3|s_counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(0),
	datad => VCC,
	combout => \Blink_Prog3|s_counter[0]~26_combout\,
	cout => \Blink_Prog3|s_counter[0]~27\);

-- Location: LCCOMB_X65_Y69_N18
\system_core|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \system_core|Equal0~0_combout\ = (\SW[0]~input_o\) # (!\SW[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[0]~input_o\,
	datad => \SW[1]~input_o\,
	combout => \system_core|Equal0~0_combout\);

-- Location: CLKCTRL_G11
\system_core|Equal0~0clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \system_core|Equal0~0clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \system_core|Equal0~0clkctrl_outclk\);

-- Location: LCCOMB_X48_Y69_N8
\Blink_Prog3|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|LessThan0~1_combout\ = ((!\Blink_Prog3|s_counter\(18) & !\Blink_Prog3|s_counter\(17))) # (!\Blink_Prog3|s_counter\(23))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(18),
	datac => \Blink_Prog3|s_counter\(23),
	datad => \Blink_Prog3|s_counter\(17),
	combout => \Blink_Prog3|LessThan0~1_combout\);

-- Location: LCCOMB_X47_Y68_N26
\LEDG~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDG~3_combout\ = (\Blink_Prog3|s_counter\(19) & (\Blink_Prog3|s_counter\(21) & (\Blink_Prog3|s_counter\(20) & \Blink_Prog3|s_counter\(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(19),
	datab => \Blink_Prog3|s_counter\(21),
	datac => \Blink_Prog3|s_counter\(20),
	datad => \Blink_Prog3|s_counter\(22),
	combout => \LEDG~3_combout\);

-- Location: LCCOMB_X47_Y69_N0
\Blink_Prog3|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|LessThan0~0_combout\ = (!\Blink_Prog3|s_counter\(8) & (!\Blink_Prog3|s_counter\(7) & (!\Blink_Prog3|s_counter\(10) & !\Blink_Prog3|s_counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(8),
	datab => \Blink_Prog3|s_counter\(7),
	datac => \Blink_Prog3|s_counter\(10),
	datad => \Blink_Prog3|s_counter\(9),
	combout => \Blink_Prog3|LessThan0~0_combout\);

-- Location: LCCOMB_X48_Y69_N14
\Blink_Prog3|LessThan0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|LessThan0~4_combout\ = (((!\Blink_Prog3|s_counter\(12)) # (!\Blink_Prog3|s_counter\(14))) # (!\Blink_Prog3|s_counter\(15))) # (!\Blink_Prog3|s_counter\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(13),
	datab => \Blink_Prog3|s_counter\(15),
	datac => \Blink_Prog3|s_counter\(14),
	datad => \Blink_Prog3|s_counter\(12),
	combout => \Blink_Prog3|LessThan0~4_combout\);

-- Location: LCCOMB_X47_Y69_N2
\Blink_Prog3|LessThan0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|LessThan0~2_combout\ = (((!\Blink_Prog3|s_counter\(0)) # (!\Blink_Prog3|s_counter\(1))) # (!\Blink_Prog3|s_counter\(6))) # (!\Blink_Prog3|s_counter\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(2),
	datab => \Blink_Prog3|s_counter\(6),
	datac => \Blink_Prog3|s_counter\(1),
	datad => \Blink_Prog3|s_counter\(0),
	combout => \Blink_Prog3|LessThan0~2_combout\);

-- Location: LCCOMB_X47_Y69_N4
\Blink_Prog3|LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|LessThan0~3_combout\ = (((\Blink_Prog3|LessThan0~2_combout\) # (!\Blink_Prog3|s_counter\(4))) # (!\Blink_Prog3|s_counter\(5))) # (!\Blink_Prog3|s_counter\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(3),
	datab => \Blink_Prog3|s_counter\(5),
	datac => \Blink_Prog3|s_counter\(4),
	datad => \Blink_Prog3|LessThan0~2_combout\,
	combout => \Blink_Prog3|LessThan0~3_combout\);

-- Location: LCCOMB_X48_Y69_N16
\Blink_Prog3|LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|LessThan0~5_combout\ = (\Blink_Prog3|LessThan0~4_combout\) # ((\Blink_Prog3|LessThan0~0_combout\ & (\Blink_Prog3|LessThan0~3_combout\ & !\Blink_Prog3|s_counter\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|LessThan0~0_combout\,
	datab => \Blink_Prog3|LessThan0~4_combout\,
	datac => \Blink_Prog3|LessThan0~3_combout\,
	datad => \Blink_Prog3|s_counter\(11),
	combout => \Blink_Prog3|LessThan0~5_combout\);

-- Location: LCCOMB_X48_Y69_N10
\Blink_Prog3|LessThan0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|LessThan0~6_combout\ = (\LEDG~3_combout\ & ((\Blink_Prog3|s_counter\(18)) # ((\Blink_Prog3|s_counter\(16)) # (!\Blink_Prog3|LessThan0~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(18),
	datab => \Blink_Prog3|s_counter\(16),
	datac => \LEDG~3_combout\,
	datad => \Blink_Prog3|LessThan0~5_combout\,
	combout => \Blink_Prog3|LessThan0~6_combout\);

-- Location: LCCOMB_X48_Y69_N4
\Blink_Prog3|LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|LessThan0~7_combout\ = (\Blink_Prog3|s_counter\(25) & ((\Blink_Prog3|s_counter\(24)) # ((!\Blink_Prog3|LessThan0~1_combout\ & \Blink_Prog3|LessThan0~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(25),
	datab => \Blink_Prog3|LessThan0~1_combout\,
	datac => \Blink_Prog3|s_counter\(24),
	datad => \Blink_Prog3|LessThan0~6_combout\,
	combout => \Blink_Prog3|LessThan0~7_combout\);

-- Location: FF_X47_Y69_N7
\Blink_Prog3|s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[0]~26_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(0));

-- Location: LCCOMB_X47_Y69_N8
\Blink_Prog3|s_counter[1]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[1]~28_combout\ = (\Blink_Prog3|s_counter\(1) & (!\Blink_Prog3|s_counter[0]~27\)) # (!\Blink_Prog3|s_counter\(1) & ((\Blink_Prog3|s_counter[0]~27\) # (GND)))
-- \Blink_Prog3|s_counter[1]~29\ = CARRY((!\Blink_Prog3|s_counter[0]~27\) # (!\Blink_Prog3|s_counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(1),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[0]~27\,
	combout => \Blink_Prog3|s_counter[1]~28_combout\,
	cout => \Blink_Prog3|s_counter[1]~29\);

-- Location: FF_X47_Y69_N9
\Blink_Prog3|s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[1]~28_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(1));

-- Location: LCCOMB_X47_Y69_N10
\Blink_Prog3|s_counter[2]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[2]~30_combout\ = (\Blink_Prog3|s_counter\(2) & (\Blink_Prog3|s_counter[1]~29\ $ (GND))) # (!\Blink_Prog3|s_counter\(2) & (!\Blink_Prog3|s_counter[1]~29\ & VCC))
-- \Blink_Prog3|s_counter[2]~31\ = CARRY((\Blink_Prog3|s_counter\(2) & !\Blink_Prog3|s_counter[1]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(2),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[1]~29\,
	combout => \Blink_Prog3|s_counter[2]~30_combout\,
	cout => \Blink_Prog3|s_counter[2]~31\);

-- Location: FF_X47_Y69_N11
\Blink_Prog3|s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[2]~30_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(2));

-- Location: LCCOMB_X47_Y69_N12
\Blink_Prog3|s_counter[3]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[3]~32_combout\ = (\Blink_Prog3|s_counter\(3) & (!\Blink_Prog3|s_counter[2]~31\)) # (!\Blink_Prog3|s_counter\(3) & ((\Blink_Prog3|s_counter[2]~31\) # (GND)))
-- \Blink_Prog3|s_counter[3]~33\ = CARRY((!\Blink_Prog3|s_counter[2]~31\) # (!\Blink_Prog3|s_counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(3),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[2]~31\,
	combout => \Blink_Prog3|s_counter[3]~32_combout\,
	cout => \Blink_Prog3|s_counter[3]~33\);

-- Location: FF_X47_Y69_N13
\Blink_Prog3|s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[3]~32_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(3));

-- Location: LCCOMB_X47_Y69_N14
\Blink_Prog3|s_counter[4]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[4]~34_combout\ = (\Blink_Prog3|s_counter\(4) & (\Blink_Prog3|s_counter[3]~33\ $ (GND))) # (!\Blink_Prog3|s_counter\(4) & (!\Blink_Prog3|s_counter[3]~33\ & VCC))
-- \Blink_Prog3|s_counter[4]~35\ = CARRY((\Blink_Prog3|s_counter\(4) & !\Blink_Prog3|s_counter[3]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(4),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[3]~33\,
	combout => \Blink_Prog3|s_counter[4]~34_combout\,
	cout => \Blink_Prog3|s_counter[4]~35\);

-- Location: FF_X47_Y69_N15
\Blink_Prog3|s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[4]~34_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(4));

-- Location: LCCOMB_X47_Y69_N16
\Blink_Prog3|s_counter[5]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[5]~36_combout\ = (\Blink_Prog3|s_counter\(5) & (!\Blink_Prog3|s_counter[4]~35\)) # (!\Blink_Prog3|s_counter\(5) & ((\Blink_Prog3|s_counter[4]~35\) # (GND)))
-- \Blink_Prog3|s_counter[5]~37\ = CARRY((!\Blink_Prog3|s_counter[4]~35\) # (!\Blink_Prog3|s_counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(5),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[4]~35\,
	combout => \Blink_Prog3|s_counter[5]~36_combout\,
	cout => \Blink_Prog3|s_counter[5]~37\);

-- Location: FF_X47_Y69_N17
\Blink_Prog3|s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[5]~36_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(5));

-- Location: LCCOMB_X47_Y69_N18
\Blink_Prog3|s_counter[6]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[6]~38_combout\ = (\Blink_Prog3|s_counter\(6) & (\Blink_Prog3|s_counter[5]~37\ $ (GND))) # (!\Blink_Prog3|s_counter\(6) & (!\Blink_Prog3|s_counter[5]~37\ & VCC))
-- \Blink_Prog3|s_counter[6]~39\ = CARRY((\Blink_Prog3|s_counter\(6) & !\Blink_Prog3|s_counter[5]~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(6),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[5]~37\,
	combout => \Blink_Prog3|s_counter[6]~38_combout\,
	cout => \Blink_Prog3|s_counter[6]~39\);

-- Location: FF_X47_Y69_N19
\Blink_Prog3|s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[6]~38_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(6));

-- Location: LCCOMB_X47_Y69_N20
\Blink_Prog3|s_counter[7]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[7]~40_combout\ = (\Blink_Prog3|s_counter\(7) & (!\Blink_Prog3|s_counter[6]~39\)) # (!\Blink_Prog3|s_counter\(7) & ((\Blink_Prog3|s_counter[6]~39\) # (GND)))
-- \Blink_Prog3|s_counter[7]~41\ = CARRY((!\Blink_Prog3|s_counter[6]~39\) # (!\Blink_Prog3|s_counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(7),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[6]~39\,
	combout => \Blink_Prog3|s_counter[7]~40_combout\,
	cout => \Blink_Prog3|s_counter[7]~41\);

-- Location: FF_X47_Y69_N21
\Blink_Prog3|s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[7]~40_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(7));

-- Location: LCCOMB_X47_Y69_N22
\Blink_Prog3|s_counter[8]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[8]~42_combout\ = (\Blink_Prog3|s_counter\(8) & (\Blink_Prog3|s_counter[7]~41\ $ (GND))) # (!\Blink_Prog3|s_counter\(8) & (!\Blink_Prog3|s_counter[7]~41\ & VCC))
-- \Blink_Prog3|s_counter[8]~43\ = CARRY((\Blink_Prog3|s_counter\(8) & !\Blink_Prog3|s_counter[7]~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(8),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[7]~41\,
	combout => \Blink_Prog3|s_counter[8]~42_combout\,
	cout => \Blink_Prog3|s_counter[8]~43\);

-- Location: FF_X47_Y69_N23
\Blink_Prog3|s_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[8]~42_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(8));

-- Location: LCCOMB_X47_Y69_N24
\Blink_Prog3|s_counter[9]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[9]~44_combout\ = (\Blink_Prog3|s_counter\(9) & (!\Blink_Prog3|s_counter[8]~43\)) # (!\Blink_Prog3|s_counter\(9) & ((\Blink_Prog3|s_counter[8]~43\) # (GND)))
-- \Blink_Prog3|s_counter[9]~45\ = CARRY((!\Blink_Prog3|s_counter[8]~43\) # (!\Blink_Prog3|s_counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(9),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[8]~43\,
	combout => \Blink_Prog3|s_counter[9]~44_combout\,
	cout => \Blink_Prog3|s_counter[9]~45\);

-- Location: FF_X47_Y69_N25
\Blink_Prog3|s_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[9]~44_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(9));

-- Location: LCCOMB_X47_Y69_N26
\Blink_Prog3|s_counter[10]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[10]~46_combout\ = (\Blink_Prog3|s_counter\(10) & (\Blink_Prog3|s_counter[9]~45\ $ (GND))) # (!\Blink_Prog3|s_counter\(10) & (!\Blink_Prog3|s_counter[9]~45\ & VCC))
-- \Blink_Prog3|s_counter[10]~47\ = CARRY((\Blink_Prog3|s_counter\(10) & !\Blink_Prog3|s_counter[9]~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(10),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[9]~45\,
	combout => \Blink_Prog3|s_counter[10]~46_combout\,
	cout => \Blink_Prog3|s_counter[10]~47\);

-- Location: FF_X47_Y69_N27
\Blink_Prog3|s_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[10]~46_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(10));

-- Location: LCCOMB_X47_Y69_N28
\Blink_Prog3|s_counter[11]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[11]~48_combout\ = (\Blink_Prog3|s_counter\(11) & (!\Blink_Prog3|s_counter[10]~47\)) # (!\Blink_Prog3|s_counter\(11) & ((\Blink_Prog3|s_counter[10]~47\) # (GND)))
-- \Blink_Prog3|s_counter[11]~49\ = CARRY((!\Blink_Prog3|s_counter[10]~47\) # (!\Blink_Prog3|s_counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(11),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[10]~47\,
	combout => \Blink_Prog3|s_counter[11]~48_combout\,
	cout => \Blink_Prog3|s_counter[11]~49\);

-- Location: FF_X47_Y69_N29
\Blink_Prog3|s_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[11]~48_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(11));

-- Location: LCCOMB_X47_Y69_N30
\Blink_Prog3|s_counter[12]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[12]~50_combout\ = (\Blink_Prog3|s_counter\(12) & (\Blink_Prog3|s_counter[11]~49\ $ (GND))) # (!\Blink_Prog3|s_counter\(12) & (!\Blink_Prog3|s_counter[11]~49\ & VCC))
-- \Blink_Prog3|s_counter[12]~51\ = CARRY((\Blink_Prog3|s_counter\(12) & !\Blink_Prog3|s_counter[11]~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(12),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[11]~49\,
	combout => \Blink_Prog3|s_counter[12]~50_combout\,
	cout => \Blink_Prog3|s_counter[12]~51\);

-- Location: FF_X47_Y69_N31
\Blink_Prog3|s_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[12]~50_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(12));

-- Location: LCCOMB_X47_Y68_N0
\Blink_Prog3|s_counter[13]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[13]~52_combout\ = (\Blink_Prog3|s_counter\(13) & (!\Blink_Prog3|s_counter[12]~51\)) # (!\Blink_Prog3|s_counter\(13) & ((\Blink_Prog3|s_counter[12]~51\) # (GND)))
-- \Blink_Prog3|s_counter[13]~53\ = CARRY((!\Blink_Prog3|s_counter[12]~51\) # (!\Blink_Prog3|s_counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(13),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[12]~51\,
	combout => \Blink_Prog3|s_counter[13]~52_combout\,
	cout => \Blink_Prog3|s_counter[13]~53\);

-- Location: FF_X48_Y69_N13
\Blink_Prog3|s_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \Blink_Prog3|s_counter[13]~52_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(13));

-- Location: LCCOMB_X47_Y68_N2
\Blink_Prog3|s_counter[14]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[14]~54_combout\ = (\Blink_Prog3|s_counter\(14) & (\Blink_Prog3|s_counter[13]~53\ $ (GND))) # (!\Blink_Prog3|s_counter\(14) & (!\Blink_Prog3|s_counter[13]~53\ & VCC))
-- \Blink_Prog3|s_counter[14]~55\ = CARRY((\Blink_Prog3|s_counter\(14) & !\Blink_Prog3|s_counter[13]~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(14),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[13]~53\,
	combout => \Blink_Prog3|s_counter[14]~54_combout\,
	cout => \Blink_Prog3|s_counter[14]~55\);

-- Location: FF_X48_Y69_N31
\Blink_Prog3|s_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \Blink_Prog3|s_counter[14]~54_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(14));

-- Location: LCCOMB_X47_Y68_N4
\Blink_Prog3|s_counter[15]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[15]~56_combout\ = (\Blink_Prog3|s_counter\(15) & (!\Blink_Prog3|s_counter[14]~55\)) # (!\Blink_Prog3|s_counter\(15) & ((\Blink_Prog3|s_counter[14]~55\) # (GND)))
-- \Blink_Prog3|s_counter[15]~57\ = CARRY((!\Blink_Prog3|s_counter[14]~55\) # (!\Blink_Prog3|s_counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(15),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[14]~55\,
	combout => \Blink_Prog3|s_counter[15]~56_combout\,
	cout => \Blink_Prog3|s_counter[15]~57\);

-- Location: FF_X48_Y69_N19
\Blink_Prog3|s_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \Blink_Prog3|s_counter[15]~56_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(15));

-- Location: LCCOMB_X47_Y68_N6
\Blink_Prog3|s_counter[16]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[16]~58_combout\ = (\Blink_Prog3|s_counter\(16) & (\Blink_Prog3|s_counter[15]~57\ $ (GND))) # (!\Blink_Prog3|s_counter\(16) & (!\Blink_Prog3|s_counter[15]~57\ & VCC))
-- \Blink_Prog3|s_counter[16]~59\ = CARRY((\Blink_Prog3|s_counter\(16) & !\Blink_Prog3|s_counter[15]~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(16),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[15]~57\,
	combout => \Blink_Prog3|s_counter[16]~58_combout\,
	cout => \Blink_Prog3|s_counter[16]~59\);

-- Location: FF_X48_Y69_N25
\Blink_Prog3|s_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \Blink_Prog3|s_counter[16]~58_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(16));

-- Location: LCCOMB_X47_Y68_N8
\Blink_Prog3|s_counter[17]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[17]~60_combout\ = (\Blink_Prog3|s_counter\(17) & (!\Blink_Prog3|s_counter[16]~59\)) # (!\Blink_Prog3|s_counter\(17) & ((\Blink_Prog3|s_counter[16]~59\) # (GND)))
-- \Blink_Prog3|s_counter[17]~61\ = CARRY((!\Blink_Prog3|s_counter[16]~59\) # (!\Blink_Prog3|s_counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(17),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[16]~59\,
	combout => \Blink_Prog3|s_counter[17]~60_combout\,
	cout => \Blink_Prog3|s_counter[17]~61\);

-- Location: FF_X47_Y68_N9
\Blink_Prog3|s_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[17]~60_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(17));

-- Location: LCCOMB_X47_Y68_N10
\Blink_Prog3|s_counter[18]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[18]~62_combout\ = (\Blink_Prog3|s_counter\(18) & (\Blink_Prog3|s_counter[17]~61\ $ (GND))) # (!\Blink_Prog3|s_counter\(18) & (!\Blink_Prog3|s_counter[17]~61\ & VCC))
-- \Blink_Prog3|s_counter[18]~63\ = CARRY((\Blink_Prog3|s_counter\(18) & !\Blink_Prog3|s_counter[17]~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(18),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[17]~61\,
	combout => \Blink_Prog3|s_counter[18]~62_combout\,
	cout => \Blink_Prog3|s_counter[18]~63\);

-- Location: FF_X47_Y68_N11
\Blink_Prog3|s_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[18]~62_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(18));

-- Location: LCCOMB_X47_Y68_N12
\Blink_Prog3|s_counter[19]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[19]~64_combout\ = (\Blink_Prog3|s_counter\(19) & (!\Blink_Prog3|s_counter[18]~63\)) # (!\Blink_Prog3|s_counter\(19) & ((\Blink_Prog3|s_counter[18]~63\) # (GND)))
-- \Blink_Prog3|s_counter[19]~65\ = CARRY((!\Blink_Prog3|s_counter[18]~63\) # (!\Blink_Prog3|s_counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(19),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[18]~63\,
	combout => \Blink_Prog3|s_counter[19]~64_combout\,
	cout => \Blink_Prog3|s_counter[19]~65\);

-- Location: FF_X47_Y68_N13
\Blink_Prog3|s_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[19]~64_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(19));

-- Location: LCCOMB_X47_Y68_N14
\Blink_Prog3|s_counter[20]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[20]~66_combout\ = (\Blink_Prog3|s_counter\(20) & (\Blink_Prog3|s_counter[19]~65\ $ (GND))) # (!\Blink_Prog3|s_counter\(20) & (!\Blink_Prog3|s_counter[19]~65\ & VCC))
-- \Blink_Prog3|s_counter[20]~67\ = CARRY((\Blink_Prog3|s_counter\(20) & !\Blink_Prog3|s_counter[19]~65\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(20),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[19]~65\,
	combout => \Blink_Prog3|s_counter[20]~66_combout\,
	cout => \Blink_Prog3|s_counter[20]~67\);

-- Location: FF_X47_Y68_N15
\Blink_Prog3|s_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[20]~66_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(20));

-- Location: LCCOMB_X47_Y68_N16
\Blink_Prog3|s_counter[21]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[21]~68_combout\ = (\Blink_Prog3|s_counter\(21) & (!\Blink_Prog3|s_counter[20]~67\)) # (!\Blink_Prog3|s_counter\(21) & ((\Blink_Prog3|s_counter[20]~67\) # (GND)))
-- \Blink_Prog3|s_counter[21]~69\ = CARRY((!\Blink_Prog3|s_counter[20]~67\) # (!\Blink_Prog3|s_counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(21),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[20]~67\,
	combout => \Blink_Prog3|s_counter[21]~68_combout\,
	cout => \Blink_Prog3|s_counter[21]~69\);

-- Location: FF_X47_Y68_N17
\Blink_Prog3|s_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[21]~68_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(21));

-- Location: LCCOMB_X47_Y68_N18
\Blink_Prog3|s_counter[22]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[22]~70_combout\ = (\Blink_Prog3|s_counter\(22) & (\Blink_Prog3|s_counter[21]~69\ $ (GND))) # (!\Blink_Prog3|s_counter\(22) & (!\Blink_Prog3|s_counter[21]~69\ & VCC))
-- \Blink_Prog3|s_counter[22]~71\ = CARRY((\Blink_Prog3|s_counter\(22) & !\Blink_Prog3|s_counter[21]~69\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(22),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[21]~69\,
	combout => \Blink_Prog3|s_counter[22]~70_combout\,
	cout => \Blink_Prog3|s_counter[22]~71\);

-- Location: FF_X47_Y68_N19
\Blink_Prog3|s_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[22]~70_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(22));

-- Location: LCCOMB_X47_Y68_N20
\Blink_Prog3|s_counter[23]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[23]~72_combout\ = (\Blink_Prog3|s_counter\(23) & (!\Blink_Prog3|s_counter[22]~71\)) # (!\Blink_Prog3|s_counter\(23) & ((\Blink_Prog3|s_counter[22]~71\) # (GND)))
-- \Blink_Prog3|s_counter[23]~73\ = CARRY((!\Blink_Prog3|s_counter[22]~71\) # (!\Blink_Prog3|s_counter\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(23),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[22]~71\,
	combout => \Blink_Prog3|s_counter[23]~72_combout\,
	cout => \Blink_Prog3|s_counter[23]~73\);

-- Location: FF_X47_Y68_N21
\Blink_Prog3|s_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[23]~72_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(23));

-- Location: LCCOMB_X47_Y68_N22
\Blink_Prog3|s_counter[24]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[24]~74_combout\ = (\Blink_Prog3|s_counter\(24) & (\Blink_Prog3|s_counter[23]~73\ $ (GND))) # (!\Blink_Prog3|s_counter\(24) & (!\Blink_Prog3|s_counter[23]~73\ & VCC))
-- \Blink_Prog3|s_counter[24]~75\ = CARRY((\Blink_Prog3|s_counter\(24) & !\Blink_Prog3|s_counter[23]~73\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(24),
	datad => VCC,
	cin => \Blink_Prog3|s_counter[23]~73\,
	combout => \Blink_Prog3|s_counter[24]~74_combout\,
	cout => \Blink_Prog3|s_counter[24]~75\);

-- Location: FF_X47_Y68_N23
\Blink_Prog3|s_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[24]~74_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(24));

-- Location: LCCOMB_X47_Y68_N24
\Blink_Prog3|s_counter[25]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \Blink_Prog3|s_counter[25]~76_combout\ = \Blink_Prog3|s_counter[24]~75\ $ (\Blink_Prog3|s_counter\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \Blink_Prog3|s_counter\(25),
	cin => \Blink_Prog3|s_counter[24]~75\,
	combout => \Blink_Prog3|s_counter[25]~76_combout\);

-- Location: FF_X47_Y68_N25
\Blink_Prog3|s_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \Blink_Prog3|s_counter[25]~76_combout\,
	clrn => \system_core|ALT_INV_Equal0~0clkctrl_outclk\,
	sclr => \Blink_Prog3|LessThan0~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Blink_Prog3|s_counter\(25));

-- Location: LCCOMB_X48_Y69_N28
\LEDG~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDG~0_combout\ = (\Blink_Prog3|s_counter\(14) & (\Blink_Prog3|s_counter\(12) & (\Blink_Prog3|s_counter\(11) & \Blink_Prog3|s_counter\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(14),
	datab => \Blink_Prog3|s_counter\(12),
	datac => \Blink_Prog3|s_counter\(11),
	datad => \Blink_Prog3|s_counter\(13),
	combout => \LEDG~0_combout\);

-- Location: LCCOMB_X48_Y69_N18
\LEDG~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDG~1_combout\ = (\Blink_Prog3|s_counter\(15)) # ((\LEDG~0_combout\ & ((\Blink_Prog3|s_counter\(6)) # (!\Blink_Prog3|LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|LessThan0~0_combout\,
	datab => \Blink_Prog3|s_counter\(6),
	datac => \Blink_Prog3|s_counter\(15),
	datad => \LEDG~0_combout\,
	combout => \LEDG~1_combout\);

-- Location: LCCOMB_X48_Y69_N22
\LEDG~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDG~2_combout\ = (\Blink_Prog3|s_counter\(17)) # ((\Blink_Prog3|s_counter\(16) & \LEDG~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Blink_Prog3|s_counter\(16),
	datac => \LEDG~1_combout\,
	datad => \Blink_Prog3|s_counter\(17),
	combout => \LEDG~2_combout\);

-- Location: LCCOMB_X48_Y69_N20
\LEDG~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDG~4_combout\ = (\Blink_Prog3|s_counter\(23)) # ((\LEDG~3_combout\ & (\LEDG~2_combout\ & \Blink_Prog3|s_counter\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LEDG~3_combout\,
	datab => \LEDG~2_combout\,
	datac => \Blink_Prog3|s_counter\(23),
	datad => \Blink_Prog3|s_counter\(18),
	combout => \LEDG~4_combout\);

-- Location: LCCOMB_X48_Y69_N26
\LEDG~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LEDG~5_combout\ = (\Blink_Prog3|s_counter\(25)) # (((\LEDG~4_combout\ & \Blink_Prog3|s_counter\(24))) # (!\system_core|Equal2~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Blink_Prog3|s_counter\(25),
	datab => \LEDG~4_combout\,
	datac => \Blink_Prog3|s_counter\(24),
	datad => \system_core|Equal2~0_combout\,
	combout => \LEDG~5_combout\);

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;
END structure;


