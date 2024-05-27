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

-- DATE "03/11/2024 16:44:09"

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


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Projeto IS
    PORT (
	A0 : IN std_logic;
	A1 : IN std_logic;
	A2 : IN std_logic;
	A3 : IN std_logic;
	N0 : OUT std_logic;
	N1 : OUT std_logic;
	N2 : OUT std_logic
	);
END Projeto;

-- Design Ports Information
-- N0	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- N1	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- N2	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A3	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A0	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A1	=>  Location: PIN_7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A2	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Projeto IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A0 : std_logic;
SIGNAL ww_A1 : std_logic;
SIGNAL ww_A2 : std_logic;
SIGNAL ww_A3 : std_logic;
SIGNAL ww_N0 : std_logic;
SIGNAL ww_N1 : std_logic;
SIGNAL ww_N2 : std_logic;
SIGNAL \N0~output_o\ : std_logic;
SIGNAL \N1~output_o\ : std_logic;
SIGNAL \N2~output_o\ : std_logic;
SIGNAL \A0~input_o\ : std_logic;
SIGNAL \A3~input_o\ : std_logic;
SIGNAL \A1~input_o\ : std_logic;
SIGNAL \A2~input_o\ : std_logic;
SIGNAL \b2v_inst1|S~combout\ : std_logic;
SIGNAL \b2v_inst2|S~combout\ : std_logic;
SIGNAL \b2v_inst2|Co~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_A0 <= A0;
ww_A1 <= A1;
ww_A2 <= A2;
ww_A3 <= A3;
N0 <= ww_N0;
N1 <= ww_N1;
N2 <= ww_N2;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y18_N23
\N0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b2v_inst1|S~combout\,
	devoe => ww_devoe,
	o => \N0~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\N1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b2v_inst2|S~combout\,
	devoe => ww_devoe,
	o => \N1~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\N2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b2v_inst2|Co~0_combout\,
	devoe => ww_devoe,
	o => \N2~output_o\);

-- Location: IOIBUF_X0_Y6_N22
\A0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A0,
	o => \A0~input_o\);

-- Location: IOIBUF_X0_Y8_N15
\A3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A3,
	o => \A3~input_o\);

-- Location: IOIBUF_X0_Y21_N8
\A1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A1,
	o => \A1~input_o\);

-- Location: IOIBUF_X0_Y9_N8
\A2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A2,
	o => \A2~input_o\);

-- Location: LCCOMB_X1_Y9_N0
\b2v_inst1|S\ : cycloneive_lcell_comb
-- Equation(s):
-- \b2v_inst1|S~combout\ = \A0~input_o\ $ (\A3~input_o\ $ (\A1~input_o\ $ (\A2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0~input_o\,
	datab => \A3~input_o\,
	datac => \A1~input_o\,
	datad => \A2~input_o\,
	combout => \b2v_inst1|S~combout\);

-- Location: LCCOMB_X1_Y9_N18
\b2v_inst2|S\ : cycloneive_lcell_comb
-- Equation(s):
-- \b2v_inst2|S~combout\ = (\A0~input_o\ & ((\A3~input_o\ & ((!\A2~input_o\) # (!\A1~input_o\))) # (!\A3~input_o\ & ((\A1~input_o\) # (\A2~input_o\))))) # (!\A0~input_o\ & ((\A3~input_o\ & ((\A1~input_o\) # (\A2~input_o\))) # (!\A3~input_o\ & (\A1~input_o\ & 
-- \A2~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0~input_o\,
	datab => \A3~input_o\,
	datac => \A1~input_o\,
	datad => \A2~input_o\,
	combout => \b2v_inst2|S~combout\);

-- Location: LCCOMB_X1_Y9_N20
\b2v_inst2|Co~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \b2v_inst2|Co~0_combout\ = (\A0~input_o\ & (\A3~input_o\ & (\A1~input_o\ & \A2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0~input_o\,
	datab => \A3~input_o\,
	datac => \A1~input_o\,
	datad => \A2~input_o\,
	combout => \b2v_inst2|Co~0_combout\);

ww_N0 <= \N0~output_o\;

ww_N1 <= \N1~output_o\;

ww_N2 <= \N2~output_o\;
END structure;


