LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Projeto IS 
	PORT
	(
		A0 :  IN  STD_LOGIC;
		A1 :  IN  STD_LOGIC;
		A2 :  IN  STD_LOGIC;
		A3 :  IN  STD_LOGIC;
		N0 :  OUT  STD_LOGIC;
		N1 :  OUT  STD_LOGIC;
		N2 :  OUT  STD_LOGIC
	);
END Projeto;

ARCHITECTURE Behavioral OF Projeto IS 

COMPONENT fulladder
	PORT(a : IN STD_LOGIC;
		 b : IN STD_LOGIC;
		 Ci : IN STD_LOGIC;
		 S : OUT STD_LOGIC;
		 Co : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;

BEGIN 
SYNTHESIZED_WIRE_5 <= '0';

b2v_inst : fulladder
PORT MAP(a => A2,
		 b => A1,
		 Ci => A0,
		 S => SYNTHESIZED_WIRE_1,
		 Co => SYNTHESIZED_WIRE_3);

b2v_inst1 : fulladder
PORT MAP(a => SYNTHESIZED_WIRE_5,
		 b => SYNTHESIZED_WIRE_1,
		 Ci => A3,
		 S => N0,
		 Co => SYNTHESIZED_WIRE_4);

b2v_inst2 : fulladder
PORT MAP(a => SYNTHESIZED_WIRE_5,
		 b => SYNTHESIZED_WIRE_3,
		 Ci => SYNTHESIZED_WIRE_4,
		 S => N1,
		 Co => N2);
		 
END Behavioral;