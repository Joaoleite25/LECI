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
-- Generated on "11/27/2023 21:25:10"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          exercicio_2
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY exercicio_2_vhd_vec_tst IS
END exercicio_2_vhd_vec_tst;
ARCHITECTURE exercicio_2_arch OF exercicio_2_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL i0 : STD_LOGIC;
SIGNAL i2 : STD_LOGIC;
SIGNAL i3 : STD_LOGIC;
SIGNAL i4 : STD_LOGIC;
SIGNAL i5 : STD_LOGIC;
SIGNAL i6 : STD_LOGIC;
SIGNAL i7 : STD_LOGIC;
SIGNAL i_1 : STD_LOGIC;
SIGNAL S : STD_LOGIC_VECTOR(0 TO 2);
SIGNAL Y : STD_LOGIC;
COMPONENT exercicio_2
	PORT (
	i0 : IN STD_LOGIC;
	i2 : IN STD_LOGIC;
	i3 : IN STD_LOGIC;
	i4 : IN STD_LOGIC;
	i5 : IN STD_LOGIC;
	i6 : IN STD_LOGIC;
	i7 : IN STD_LOGIC;
	i_1 : IN STD_LOGIC;
	S : IN STD_LOGIC_VECTOR(0 TO 2);
	Y : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : exercicio_2
	PORT MAP (
-- list connections between master ports and signals
	i0 => i0,
	i2 => i2,
	i3 => i3,
	i4 => i4,
	i5 => i5,
	i6 => i6,
	i7 => i7,
	i_1 => i_1,
	S => S,
	Y => Y
	);

-- i0
t_prcs_i0: PROCESS
BEGIN
	i0 <= '0';
	WAIT FOR 100000 ps;
	i0 <= '1';
	WAIT FOR 50000 ps;
	i0 <= '0';
	WAIT FOR 50000 ps;
	i0 <= '1';
	WAIT FOR 50000 ps;
	i0 <= '0';
	WAIT FOR 50000 ps;
	i0 <= '1';
	WAIT FOR 100000 ps;
	i0 <= '0';
	WAIT FOR 50000 ps;
	i0 <= '1';
	WAIT FOR 50000 ps;
	i0 <= '0';
	WAIT FOR 50000 ps;
	i0 <= '1';
	WAIT FOR 50000 ps;
	i0 <= '0';
	WAIT FOR 50000 ps;
	i0 <= '1';
	WAIT FOR 150000 ps;
	i0 <= '0';
WAIT;
END PROCESS t_prcs_i0;

-- i2
t_prcs_i2: PROCESS
BEGIN
	i2 <= '1';
	WAIT FOR 50000 ps;
	i2 <= '0';
	WAIT FOR 100000 ps;
	i2 <= '1';
	WAIT FOR 50000 ps;
	i2 <= '0';
	WAIT FOR 50000 ps;
	i2 <= '1';
	WAIT FOR 50000 ps;
	i2 <= '0';
	WAIT FOR 50000 ps;
	i2 <= '1';
	WAIT FOR 50000 ps;
	i2 <= '0';
	WAIT FOR 100000 ps;
	i2 <= '1';
	WAIT FOR 100000 ps;
	i2 <= '0';
	WAIT FOR 100000 ps;
	i2 <= '1';
	WAIT FOR 50000 ps;
	i2 <= '0';
	WAIT FOR 200000 ps;
	i2 <= '1';
WAIT;
END PROCESS t_prcs_i2;

-- i3
t_prcs_i3: PROCESS
BEGIN
	i3 <= '1';
	WAIT FOR 100000 ps;
	i3 <= '0';
	WAIT FOR 100000 ps;
	i3 <= '1';
	WAIT FOR 200000 ps;
	i3 <= '0';
	WAIT FOR 50000 ps;
	i3 <= '1';
	WAIT FOR 50000 ps;
	i3 <= '0';
	WAIT FOR 50000 ps;
	i3 <= '1';
	WAIT FOR 100000 ps;
	i3 <= '0';
	WAIT FOR 50000 ps;
	i3 <= '1';
	WAIT FOR 50000 ps;
	i3 <= '0';
	WAIT FOR 50000 ps;
	i3 <= '1';
	WAIT FOR 150000 ps;
	i3 <= '0';
WAIT;
END PROCESS t_prcs_i3;

-- i4
t_prcs_i4: PROCESS
BEGIN
	i4 <= '0';
	WAIT FOR 350000 ps;
	i4 <= '1';
	WAIT FOR 100000 ps;
	i4 <= '0';
	WAIT FOR 100000 ps;
	i4 <= '1';
	WAIT FOR 50000 ps;
	i4 <= '0';
	WAIT FOR 50000 ps;
	i4 <= '1';
	WAIT FOR 300000 ps;
	i4 <= '0';
WAIT;
END PROCESS t_prcs_i4;

-- i5
t_prcs_i5: PROCESS
BEGIN
	i5 <= '1';
	WAIT FOR 50000 ps;
	i5 <= '0';
	WAIT FOR 50000 ps;
	i5 <= '1';
	WAIT FOR 50000 ps;
	i5 <= '0';
	WAIT FOR 100000 ps;
	i5 <= '1';
	WAIT FOR 100000 ps;
	i5 <= '0';
	WAIT FOR 50000 ps;
	i5 <= '1';
	WAIT FOR 150000 ps;
	i5 <= '0';
	WAIT FOR 150000 ps;
	i5 <= '1';
	WAIT FOR 50000 ps;
	i5 <= '0';
	WAIT FOR 50000 ps;
	i5 <= '1';
	WAIT FOR 100000 ps;
	i5 <= '0';
WAIT;
END PROCESS t_prcs_i5;

-- i6
t_prcs_i6: PROCESS
BEGIN
	i6 <= '0';
	WAIT FOR 50000 ps;
	i6 <= '1';
	WAIT FOR 50000 ps;
	i6 <= '0';
	WAIT FOR 100000 ps;
	i6 <= '1';
	WAIT FOR 50000 ps;
	i6 <= '0';
	WAIT FOR 100000 ps;
	i6 <= '1';
	WAIT FOR 50000 ps;
	i6 <= '0';
	WAIT FOR 50000 ps;
	i6 <= '1';
	WAIT FOR 50000 ps;
	i6 <= '0';
	WAIT FOR 50000 ps;
	i6 <= '1';
	WAIT FOR 50000 ps;
	i6 <= '0';
	WAIT FOR 150000 ps;
	i6 <= '1';
	WAIT FOR 100000 ps;
	i6 <= '0';
	WAIT FOR 50000 ps;
	i6 <= '1';
WAIT;
END PROCESS t_prcs_i6;

-- i7
t_prcs_i7: PROCESS
BEGIN
	i7 <= '1';
	WAIT FOR 50000 ps;
	i7 <= '0';
	WAIT FOR 150000 ps;
	i7 <= '1';
	WAIT FOR 50000 ps;
	i7 <= '0';
	WAIT FOR 50000 ps;
	i7 <= '1';
	WAIT FOR 200000 ps;
	i7 <= '0';
	WAIT FOR 200000 ps;
	i7 <= '1';
	WAIT FOR 50000 ps;
	i7 <= '0';
	WAIT FOR 200000 ps;
	i7 <= '1';
WAIT;
END PROCESS t_prcs_i7;

-- i_1
t_prcs_i_1: PROCESS
BEGIN
	i_1 <= '1';
	WAIT FOR 100000 ps;
	i_1 <= '0';
	WAIT FOR 200000 ps;
	i_1 <= '1';
	WAIT FOR 50000 ps;
	i_1 <= '0';
	WAIT FOR 50000 ps;
	i_1 <= '1';
	WAIT FOR 200000 ps;
	i_1 <= '0';
	WAIT FOR 50000 ps;
	i_1 <= '1';
	WAIT FOR 50000 ps;
	i_1 <= '0';
	WAIT FOR 150000 ps;
	i_1 <= '1';
	WAIT FOR 100000 ps;
	i_1 <= '0';
WAIT;
END PROCESS t_prcs_i_1;
-- S[2]
t_prcs_S_2: PROCESS
BEGIN
	S(2) <= '0';
	WAIT FOR 50000 ps;
	S(2) <= '1';
	WAIT FOR 100000 ps;
	S(2) <= '0';
	WAIT FOR 200000 ps;
	S(2) <= '1';
	WAIT FOR 100000 ps;
	S(2) <= '0';
	WAIT FOR 100000 ps;
	S(2) <= '1';
	WAIT FOR 50000 ps;
	S(2) <= '0';
	WAIT FOR 100000 ps;
	S(2) <= '1';
	WAIT FOR 50000 ps;
	S(2) <= '0';
	WAIT FOR 50000 ps;
	S(2) <= '1';
	WAIT FOR 50000 ps;
	S(2) <= '0';
	WAIT FOR 50000 ps;
	S(2) <= '1';
WAIT;
END PROCESS t_prcs_S_2;
-- S[1]
t_prcs_S_1: PROCESS
BEGIN
	S(1) <= '1';
	WAIT FOR 150000 ps;
	S(1) <= '0';
	WAIT FOR 50000 ps;
	S(1) <= '1';
	WAIT FOR 100000 ps;
	S(1) <= '0';
	WAIT FOR 50000 ps;
	S(1) <= '1';
	WAIT FOR 50000 ps;
	S(1) <= '0';
	WAIT FOR 100000 ps;
	S(1) <= '1';
	WAIT FOR 50000 ps;
	S(1) <= '0';
	WAIT FOR 50000 ps;
	S(1) <= '1';
	WAIT FOR 50000 ps;
	S(1) <= '0';
	WAIT FOR 250000 ps;
	S(1) <= '1';
WAIT;
END PROCESS t_prcs_S_1;
-- S[0]
t_prcs_S_0: PROCESS
BEGIN
	S(0) <= '0';
	WAIT FOR 50000 ps;
	S(0) <= '1';
	WAIT FOR 50000 ps;
	S(0) <= '0';
	WAIT FOR 50000 ps;
	S(0) <= '1';
	WAIT FOR 100000 ps;
	S(0) <= '0';
	WAIT FOR 100000 ps;
	S(0) <= '1';
	WAIT FOR 150000 ps;
	S(0) <= '0';
	WAIT FOR 50000 ps;
	S(0) <= '1';
	WAIT FOR 50000 ps;
	S(0) <= '0';
	WAIT FOR 100000 ps;
	S(0) <= '1';
	WAIT FOR 100000 ps;
	S(0) <= '0';
	WAIT FOR 50000 ps;
	S(0) <= '1';
WAIT;
END PROCESS t_prcs_S_0;
END exercicio_2_arch;
