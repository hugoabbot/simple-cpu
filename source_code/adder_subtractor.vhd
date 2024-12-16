-- Copyright (C) 2020  Intel Corporation. All rights reserved.
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

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 20.1.0 Build 711 06/05/2020 SJ Lite Edition"
-- CREATED		"Mon Oct 07 11:47:16 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY adder_subtractor IS 
	PORT
	(
		sel :  IN  STD_LOGIC;
		cin :  IN  STD_LOGIC;
		a :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		b :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		cout :  OUT  STD_LOGIC;
		sum :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END adder_subtractor;

ARCHITECTURE bdf_type OF adder_subtractor IS 

COMPONENT fulladder
	PORT(
		A : IN STD_LOGIC;
		B : IN STD_LOGIC;
		CIN : IN STD_LOGIC;
		S : OUT STD_LOGIC;
		Cout : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL sum_altera_synthesized :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL synthesized_wire_0 :  STD_LOGIC;
SIGNAL synthesized_wire_1 :  STD_LOGIC;
SIGNAL synthesized_wire_2 :  STD_LOGIC;
SIGNAL synthesized_wire_3 :  STD_LOGIC;
SIGNAL synthesized_wire_4 :  STD_LOGIC;
SIGNAL synthesized_wire_5 :  STD_LOGIC;
SIGNAL synthesized_wire_6 :  STD_LOGIC;
SIGNAL synthesized_wire_7 :  STD_LOGIC;
SIGNAL synthesized_wire_8 :  STD_LOGIC;
SIGNAL synthesized_wire_9 :  STD_LOGIC;
SIGNAL synthesized_wire_10 :  STD_LOGIC;
SIGNAL synthesized_wire_11 :  STD_LOGIC;
SIGNAL synthesized_wire_12 :  STD_LOGIC;
SIGNAL synthesized_wire_13 :  STD_LOGIC;
SIGNAL synthesized_wire_14 :  STD_LOGIC;

BEGIN 

b2v_adder1 : fulladder
	PORT MAP(
		A => a(0),
		B => synthesized_wire_0,
		CIN => cin,
		S => sum_altera_synthesized(0),
		Cout => synthesized_wire_2
	);

b2v_adder2 : fulladder
	PORT MAP(
		A => a(1),
		B => synthesized_wire_1,
		CIN => synthesized_wire_2,
		S => sum_altera_synthesized(1),
		Cout => synthesized_wire_4
	);

b2v_adder3 : fulladder
	PORT MAP(
		A => a(2),
		B => synthesized_wire_3,
		CIN => synthesized_wire_4,
		S => sum_altera_synthesized(2),
		Cout => synthesized_wire_6
	);

b2v_adder4 : fulladder
	PORT MAP(
		A => a(3),
		B => synthesized_wire_5,
		CIN => synthesized_wire_6,
		S => sum_altera_synthesized(3),
		Cout => synthesized_wire_8
	);

b2v_adder5 : fulladder
	PORT MAP(
		A => a(4),
		B => synthesized_wire_7,
		CIN => synthesized_wire_8,
		S => sum_altera_synthesized(4),
		Cout => synthesized_wire_10
	);

b2v_adder6 : fulladder
	PORT MAP(
		A => a(5),
		B => synthesized_wire_9,
		CIN => synthesized_wire_10,
		S => sum_altera_synthesized(5),
		Cout => synthesized_wire_12
	);

b2v_adder7 : fulladder
	PORT MAP(
		A => a(6),
		B => synthesized_wire_11,
		CIN => synthesized_wire_12,
		S => sum_altera_synthesized(6),
		Cout => synthesized_wire_14
	);

b2v_adder8 : fulladder
	PORT MAP(
		A => a(7),
		B => synthesized_wire_13,
		CIN => synthesized_wire_14,
		S => sum_altera_synthesized(7),
		Cout => cout
	);

synthesized_wire_0 <= b(0) XOR sel;
synthesized_wire_1 <= sel XOR b(1);
synthesized_wire_3 <= sel XOR b(2);
synthesized_wire_5 <= sel XOR b(3);
synthesized_wire_7 <= sel XOR b(4);
synthesized_wire_9 <= sel XOR b(5);
synthesized_wire_11 <= sel XOR b(6);
synthesized_wire_13 <= sel XOR b(7);

sum <= sum_altera_synthesized;

END bdf_type;
