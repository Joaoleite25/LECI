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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "11/27/2023 17:53:07"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          exercicio_1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY exercicio_1_vhd_vec_tst IS
END exercicio_1_vhd_vec_tst;
ARCHITECTURE exercicio_1_arch OF exercicio_1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL I0 : STD_LOGIC;
SIGNAL I2 : STD_LOGIC;
SIGNAL I3 : STD_LOGIC;
SIGNAL I4 : STD_LOGIC;
SIGNAL I5 : STD_LOGIC;
SIGNAL I6 : STD_LOGIC;
SIGNAL I7 : STD_LOGIC;
SIGNAL I_1 : STD_LOGIC;
SIGNAL s : STD_LOGIC_VECTOR(0 TO 2);
SIGNAL y : STD_LOGIC;
COMPONENT exercicio_1
	PORT (
	I0 : IN STD_LOGIC;
	I2 : IN STD_LOGIC;
	I3 : IN STD_LOGIC;
	I4 : IN STD_LOGIC;
	I5 : IN STD_LOGIC;
	I6 : IN STD_LOGIC;
	I7 : IN STD_LOGIC;
	I_1 : IN STD_LOGIC;
	s : IN STD_LOGIC_VECTOR(0 TO 2);
	y : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : exercicio_1
	PORT MAP (
-- list connections between master ports and signals
	I0 => I0,
	I2 => I2,
	I3 => I3,
	I4 => I4,
	I5 => I5,
	I6 => I6,
	I7 => I7,
	I_1 => I_1,
	s => s,
	y => y
	);

-- I0
t_prcs_I0: PROCESS
BEGIN
	I0 <= '0';
	WAIT FOR 50000 ps;
	I0 <= '1';
	WAIT FOR 50000 ps;
	I0 <= '0';
	WAIT FOR 50000 ps;
	I0 <= '1';
	WAIT FOR 50000 ps;
	I0 <= '0';
	WAIT FOR 50000 ps;
	I0 <= '1';
	WAIT FOR 50000 ps;
	I0 <= '0';
	WAIT FOR 50000 ps;
	I0 <= '1';
	WAIT FOR 50000 ps;
	I0 <= '0';
	WAIT FOR 100000 ps;
	I0 <= '1';
	WAIT FOR 150000 ps;
	I0 <= '0';
	WAIT FOR 50000 ps;
	I0 <= '1';
	WAIT FOR 50000 ps;
	I0 <= '0';
	WAIT FOR 50000 ps;
	I0 <= '1';
WAIT;
END PROCESS t_prcs_I0;

-- I2
t_prcs_I2: PROCESS
BEGIN
	I2 <= '1';
	WAIT FOR 50000 ps;
	I2 <= '0';
	WAIT FOR 50000 ps;
	I2 <= '1';
	WAIT FOR 50000 ps;
	I2 <= '0';
	WAIT FOR 50000 ps;
	I2 <= '1';
	WAIT FOR 200000 ps;
	I2 <= '0';
	WAIT FOR 50000 ps;
	I2 <= '1';
	WAIT FOR 150000 ps;
	I2 <= '0';
	WAIT FOR 50000 ps;
	I2 <= '1';
	WAIT FOR 150000 ps;
	I2 <= '0';
	WAIT FOR 100000 ps;
	I2 <= '1';
WAIT;
END PROCESS t_prcs_I2;

-- I3
t_prcs_I3: PROCESS
BEGIN
	I3 <= '0';
	WAIT FOR 100000 ps;
	I3 <= '1';
	WAIT FOR 150000 ps;
	I3 <= '0';
	WAIT FOR 50000 ps;
	I3 <= '1';
	WAIT FOR 50000 ps;
	I3 <= '0';
	WAIT FOR 150000 ps;
	I3 <= '1';
	WAIT FOR 50000 ps;
	I3 <= '0';
	WAIT FOR 50000 ps;
	I3 <= '1';
	WAIT FOR 50000 ps;
	I3 <= '0';
	WAIT FOR 50000 ps;
	I3 <= '1';
	WAIT FOR 100000 ps;
	I3 <= '0';
	WAIT FOR 50000 ps;
	I3 <= '1';
WAIT;
END PROCESS t_prcs_I3;

-- I4
t_prcs_I4: PROCESS
BEGIN
	I4 <= '1';
	WAIT FOR 200000 ps;
	I4 <= '0';
	WAIT FOR 50000 ps;
	I4 <= '1';
	WAIT FOR 50000 ps;
	I4 <= '0';
	WAIT FOR 50000 ps;
	I4 <= '1';
	WAIT FOR 100000 ps;
	I4 <= '0';
	WAIT FOR 150000 ps;
	I4 <= '1';
	WAIT FOR 50000 ps;
	I4 <= '0';
	WAIT FOR 50000 ps;
	I4 <= '1';
	WAIT FOR 50000 ps;
	I4 <= '0';
WAIT;
END PROCESS t_prcs_I4;

-- I5
t_prcs_I5: PROCESS
BEGIN
	I5 <= '1';
	WAIT FOR 200000 ps;
	I5 <= '0';
	WAIT FOR 50000 ps;
	I5 <= '1';
	WAIT FOR 50000 ps;
	I5 <= '0';
	WAIT FOR 50000 ps;
	I5 <= '1';
	WAIT FOR 100000 ps;
	I5 <= '0';
	WAIT FOR 150000 ps;
	I5 <= '1';
	WAIT FOR 50000 ps;
	I5 <= '0';
	WAIT FOR 50000 ps;
	I5 <= '1';
	WAIT FOR 50000 ps;
	I5 <= '0';
WAIT;
END PROCESS t_prcs_I5;

-- I6
t_prcs_I6: PROCESS
BEGIN
	I6 <= '0';
	WAIT FOR 100000 ps;
	I6 <= '1';
	WAIT FOR 300000 ps;
	I6 <= '0';
	WAIT FOR 50000 ps;
	I6 <= '1';
	WAIT FOR 50000 ps;
	I6 <= '0';
	WAIT FOR 100000 ps;
	I6 <= '1';
	WAIT FOR 100000 ps;
	I6 <= '0';
	WAIT FOR 150000 ps;
	I6 <= '1';
	WAIT FOR 50000 ps;
	I6 <= '0';
WAIT;
END PROCESS t_prcs_I6;

-- I7
t_prcs_I7: PROCESS
BEGIN
	I7 <= '1';
	WAIT FOR 250000 ps;
	I7 <= '0';
	WAIT FOR 250000 ps;
	I7 <= '1';
	WAIT FOR 100000 ps;
	I7 <= '0';
	WAIT FOR 100000 ps;
	I7 <= '1';
	WAIT FOR 100000 ps;
	I7 <= '0';
	WAIT FOR 100000 ps;
	I7 <= '1';
	WAIT FOR 50000 ps;
	I7 <= '0';
WAIT;
END PROCESS t_prcs_I7;

-- I_1
t_prcs_I_1: PROCESS
BEGIN
	I_1 <= '0';
	WAIT FOR 50000 ps;
	I_1 <= '1';
	WAIT FOR 100000 ps;
	I_1 <= '0';
	WAIT FOR 50000 ps;
	I_1 <= '1';
	WAIT FOR 100000 ps;
	I_1 <= '0';
	WAIT FOR 50000 ps;
	I_1 <= '1';
	WAIT FOR 100000 ps;
	I_1 <= '0';
	WAIT FOR 150000 ps;
	I_1 <= '1';
	WAIT FOR 50000 ps;
	I_1 <= '0';
	WAIT FOR 150000 ps;
	I_1 <= '1';
	WAIT FOR 50000 ps;
	I_1 <= '0';
	WAIT FOR 50000 ps;
	I_1 <= '1';
WAIT;
END PROCESS t_prcs_I_1;
-- s[2]
t_prcs_s_2: PROCESS
BEGIN
	s(2) <= '1';
	WAIT FOR 50000 ps;
	s(2) <= '0';
	WAIT FOR 150000 ps;
	s(2) <= '1';
	WAIT FOR 50000 ps;
	s(2) <= '0';
	WAIT FOR 250000 ps;
	s(2) <= '1';
	WAIT FOR 400000 ps;
	s(2) <= '0';
WAIT;
END PROCESS t_prcs_s_2;
-- s[1]
t_prcs_s_1: PROCESS
BEGIN
	s(1) <= '0';
	WAIT FOR 50000 ps;
	s(1) <= '1';
	WAIT FOR 100000 ps;
	s(1) <= '0';
	WAIT FOR 300000 ps;
	s(1) <= '1';
	WAIT FOR 50000 ps;
	s(1) <= '0';
	WAIT FOR 100000 ps;
	s(1) <= '1';
	WAIT FOR 50000 ps;
	s(1) <= '0';
	WAIT FOR 100000 ps;
	s(1) <= '1';
	WAIT FOR 100000 ps;
	s(1) <= '0';
	WAIT FOR 50000 ps;
	s(1) <= '1';
	WAIT FOR 50000 ps;
	s(1) <= '0';
WAIT;
END PROCESS t_prcs_s_1;
-- s[0]
t_prcs_s_0: PROCESS
BEGIN
	s(0) <= '0';
	WAIT FOR 150000 ps;
	s(0) <= '1';
	WAIT FOR 50000 ps;
	s(0) <= '0';
	WAIT FOR 50000 ps;
	s(0) <= '1';
	WAIT FOR 50000 ps;
	s(0) <= '0';
	WAIT FOR 300000 ps;
	s(0) <= '1';
	WAIT FOR 50000 ps;
	s(0) <= '0';
	WAIT FOR 100000 ps;
	s(0) <= '1';
WAIT;
END PROCESS t_prcs_s_0;
END exercicio_1_arch;
