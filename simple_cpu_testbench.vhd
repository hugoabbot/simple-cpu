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
-- VERSION		"Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"
-- CREATED		"Thu Jun 01 08:36:34 2023"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY simple_cpu_testbench IS 
END simple_cpu_testbench;

ARCHITECTURE bdf_type OF simple_cpu_testbench IS 

COMPONENT clock_reset_generation
	PORT(		 reset : OUT STD_LOGIC;
		 clock : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT eeprom_memory
GENERIC (filename : STRING
			);
	PORT(r : IN STD_LOGIC;
		 w : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 address_bus : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT simple_cpu
	PORT(reset : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 data_bus : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 r : OUT STD_LOGIC;
		 w : OUT STD_LOGIC;
		 address_bus : OUT STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	address_bus :  STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL	clock :  STD_LOGIC;
SIGNAL	data_bus :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	r :  STD_LOGIC;
SIGNAL	reset :  STD_LOGIC;
SIGNAL	w :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_0 <= '1';



b2v_clock_reset_0 : clock_reset_generation
PORT MAP(		 reset => reset,
		 clock => clock);



b2v_memory_0 : eeprom_memory
GENERIC MAP(filename => "ProgramData.txt"
			)
PORT MAP(r => r,
		 w => w,
		 clock => clock,
		 enable => SYNTHESIZED_WIRE_0,
		 address_bus => address_bus,
		 data_in => data_bus,
		 data_out => data_bus);


b2v_simple_cpu_0 : simple_cpu
PORT MAP(reset => reset,
		 clock => clock,
		 data_bus => data_bus,
		 r => r,
		 w => w,
		 address_bus => address_bus);


END bdf_type;
