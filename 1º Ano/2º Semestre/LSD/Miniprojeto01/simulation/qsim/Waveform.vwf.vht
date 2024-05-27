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
-- Generated on "03/11/2024 16:44:08"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Projeto
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Projeto_vhd_vec_tst IS
END Projeto_vhd_vec_tst;
ARCHITECTURE Projeto_arch OF Projeto_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A0 : STD_LOGIC;
SIGNAL A1 : STD_LOGIC;
SIGNAL A2 : STD_LOGIC;
SIGNAL A3 : STD_LOGIC;
SIGNAL N0 : STD_LOGIC;
SIGNAL N1 : STD_LOGIC;
SIGNAL N2 : STD_LOGIC;
COMPONENT Projeto
	PORT (
	A0 : IN STD_LOGIC;
	A1 : IN STD_LOGIC;
	A2 : IN STD_LOGIC;
	A3 : IN STD_LOGIC;
	N0 : OUT STD_LOGIC;
	N1 : OUT STD_LOGIC;
	N2 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Projeto
	PORT MAP (
-- list connections between master ports and signals
	A0 => A0,
	A1 => A1,
	A2 => A2,
	A3 => A3,
	N0 => N0,
	N1 => N1,
	N2 => N2
	);

-- A0
t_prcs_A0: PROCESS
BEGIN
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 20000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 60000 ps;
	A0 <= '0';
	WAIT FOR 20000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 20000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 30000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 20000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 20000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 20000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 20000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 30000 ps;
	A0 <= '0';
	WAIT FOR 20000 ps;
	A0 <= '1';
	WAIT FOR 40000 ps;
	A0 <= '0';
	WAIT FOR 20000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 20000 ps;
	A0 <= '0';
	WAIT FOR 40000 ps;
	A0 <= '1';
	WAIT FOR 20000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 20000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 30000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 20000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 40000 ps;
	A0 <= '1';
	WAIT FOR 30000 ps;
	A0 <= '0';
	WAIT FOR 20000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 20000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 20000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 20000 ps;
	A0 <= '1';
	WAIT FOR 10000 ps;
	A0 <= '0';
	WAIT FOR 10000 ps;
	A0 <= '1';
WAIT;
END PROCESS t_prcs_A0;

-- A1
t_prcs_A1: PROCESS
BEGIN
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 30000 ps;
	A1 <= '1';
	WAIT FOR 20000 ps;
	A1 <= '0';
	WAIT FOR 30000 ps;
	A1 <= '1';
	WAIT FOR 20000 ps;
	A1 <= '0';
	WAIT FOR 10000 ps;
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 20000 ps;
	A1 <= '1';
	WAIT FOR 40000 ps;
	A1 <= '0';
	WAIT FOR 10000 ps;
	A1 <= '1';
	WAIT FOR 30000 ps;
	A1 <= '0';
	WAIT FOR 20000 ps;
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 10000 ps;
	A1 <= '1';
	WAIT FOR 30000 ps;
	A1 <= '0';
	WAIT FOR 30000 ps;
	A1 <= '1';
	WAIT FOR 30000 ps;
	A1 <= '0';
	WAIT FOR 50000 ps;
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 30000 ps;
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 10000 ps;
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 10000 ps;
	A1 <= '1';
	WAIT FOR 20000 ps;
	A1 <= '0';
	WAIT FOR 10000 ps;
	A1 <= '1';
	WAIT FOR 40000 ps;
	A1 <= '0';
	WAIT FOR 10000 ps;
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 40000 ps;
	A1 <= '1';
	WAIT FOR 30000 ps;
	A1 <= '0';
	WAIT FOR 10000 ps;
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 10000 ps;
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 50000 ps;
	A1 <= '1';
	WAIT FOR 20000 ps;
	A1 <= '0';
	WAIT FOR 10000 ps;
	A1 <= '1';
	WAIT FOR 30000 ps;
	A1 <= '0';
	WAIT FOR 10000 ps;
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 20000 ps;
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 20000 ps;
	A1 <= '1';
	WAIT FOR 40000 ps;
	A1 <= '0';
	WAIT FOR 50000 ps;
	A1 <= '1';
	WAIT FOR 10000 ps;
	A1 <= '0';
	WAIT FOR 20000 ps;
	A1 <= '1';
WAIT;
END PROCESS t_prcs_A1;

-- A2
t_prcs_A2: PROCESS
BEGIN
	A2 <= '0';
	WAIT FOR 20000 ps;
	A2 <= '1';
	WAIT FOR 20000 ps;
	A2 <= '0';
	WAIT FOR 20000 ps;
	A2 <= '1';
	WAIT FOR 20000 ps;
	A2 <= '0';
	WAIT FOR 40000 ps;
	A2 <= '1';
	WAIT FOR 20000 ps;
	A2 <= '0';
	WAIT FOR 30000 ps;
	A2 <= '1';
	WAIT FOR 10000 ps;
	A2 <= '0';
	WAIT FOR 30000 ps;
	A2 <= '1';
	WAIT FOR 30000 ps;
	A2 <= '0';
	WAIT FOR 20000 ps;
	A2 <= '1';
	WAIT FOR 60000 ps;
	A2 <= '0';
	WAIT FOR 20000 ps;
	A2 <= '1';
	WAIT FOR 20000 ps;
	A2 <= '0';
	WAIT FOR 20000 ps;
	A2 <= '1';
	WAIT FOR 20000 ps;
	A2 <= '0';
	WAIT FOR 10000 ps;
	A2 <= '1';
	WAIT FOR 20000 ps;
	A2 <= '0';
	WAIT FOR 20000 ps;
	A2 <= '1';
	WAIT FOR 30000 ps;
	A2 <= '0';
	WAIT FOR 20000 ps;
	A2 <= '1';
	WAIT FOR 20000 ps;
	A2 <= '0';
	WAIT FOR 70000 ps;
	A2 <= '1';
	WAIT FOR 10000 ps;
	A2 <= '0';
	WAIT FOR 10000 ps;
	A2 <= '1';
	WAIT FOR 10000 ps;
	A2 <= '0';
	WAIT FOR 20000 ps;
	A2 <= '1';
	WAIT FOR 30000 ps;
	A2 <= '0';
	WAIT FOR 10000 ps;
	A2 <= '1';
	WAIT FOR 20000 ps;
	A2 <= '0';
	WAIT FOR 20000 ps;
	A2 <= '1';
	WAIT FOR 30000 ps;
	A2 <= '0';
	WAIT FOR 30000 ps;
	A2 <= '1';
	WAIT FOR 10000 ps;
	A2 <= '0';
	WAIT FOR 30000 ps;
	A2 <= '1';
	WAIT FOR 10000 ps;
	A2 <= '0';
	WAIT FOR 30000 ps;
	A2 <= '1';
	WAIT FOR 10000 ps;
	A2 <= '0';
	WAIT FOR 20000 ps;
	A2 <= '1';
	WAIT FOR 20000 ps;
	A2 <= '0';
	WAIT FOR 30000 ps;
	A2 <= '1';
	WAIT FOR 10000 ps;
	A2 <= '0';
	WAIT FOR 40000 ps;
	A2 <= '1';
WAIT;
END PROCESS t_prcs_A2;

-- A3
t_prcs_A3: PROCESS
BEGIN
	A3 <= '0';
	WAIT FOR 10000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 20000 ps;
	A3 <= '1';
	WAIT FOR 20000 ps;
	A3 <= '0';
	WAIT FOR 10000 ps;
	A3 <= '1';
	WAIT FOR 60000 ps;
	A3 <= '0';
	WAIT FOR 10000 ps;
	A3 <= '1';
	WAIT FOR 20000 ps;
	A3 <= '0';
	WAIT FOR 30000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 20000 ps;
	A3 <= '1';
	WAIT FOR 20000 ps;
	A3 <= '0';
	WAIT FOR 10000 ps;
	A3 <= '1';
	WAIT FOR 20000 ps;
	A3 <= '0';
	WAIT FOR 10000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 20000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 80000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 30000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 10000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 20000 ps;
	A3 <= '1';
	WAIT FOR 20000 ps;
	A3 <= '0';
	WAIT FOR 10000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 30000 ps;
	A3 <= '1';
	WAIT FOR 20000 ps;
	A3 <= '0';
	WAIT FOR 10000 ps;
	A3 <= '1';
	WAIT FOR 50000 ps;
	A3 <= '0';
	WAIT FOR 10000 ps;
	A3 <= '1';
	WAIT FOR 20000 ps;
	A3 <= '0';
	WAIT FOR 30000 ps;
	A3 <= '1';
	WAIT FOR 40000 ps;
	A3 <= '0';
	WAIT FOR 60000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 40000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 30000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 20000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 30000 ps;
	A3 <= '1';
	WAIT FOR 10000 ps;
	A3 <= '0';
	WAIT FOR 10000 ps;
	A3 <= '1';
WAIT;
END PROCESS t_prcs_A3;
END Projeto_arch;
