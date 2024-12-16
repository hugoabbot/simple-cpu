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
-- CREATED		"Wed Nov 20 11:28:08 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY simple_cpu IS 
	PORT
	(
		reset :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		data_bus :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		r :  OUT  STD_LOGIC;
		w :  OUT  STD_LOGIC;
		address_bus :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0)
	);
END simple_cpu;

ARCHITECTURE bdf_type OF simple_cpu IS 

COMPONENT decoder_3
	PORT(execute : IN STD_LOGIC;
		 opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 load : OUT STD_LOGIC;
		 store : OUT STD_LOGIC;
		 add : OUT STD_LOGIC;
		 sub : OUT STD_LOGIC;
		 inc : OUT STD_LOGIC;
		 dec : OUT STD_LOGIC;
		 bra : OUT STD_LOGIC;
		 beq : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT control_signals_logic
	PORT(load : IN STD_LOGIC;
		 store : IN STD_LOGIC;
		 add : IN STD_LOGIC;
		 sub : IN STD_LOGIC;
		 inc : IN STD_LOGIC;
		 dec : IN STD_LOGIC;
		 bra : IN STD_LOGIC;
		 beq : IN STD_LOGIC;
		 t0 : IN STD_LOGIC;
		 t1 : IN STD_LOGIC;
		 t2 : IN STD_LOGIC;
		 t3 : IN STD_LOGIC;
		 t4 : IN STD_LOGIC;
		 t5 : IN STD_LOGIC;
		 t6 : IN STD_LOGIC;
		 t7 : IN STD_LOGIC;
		 Z : IN STD_LOGIC;
		 r : OUT STD_LOGIC;
		 w : OUT STD_LOGIC;
		 cmar : OUT STD_LOGIC;
		 cmbr : OUT STD_LOGIC;
		 embr : OUT STD_LOGIC;
		 cir : OUT STD_LOGIC;
		 eir : OUT STD_LOGIC;
		 cpc : OUT STD_LOGIC;
		 epc : OUT STD_LOGIC;
		 cd0 : OUT STD_LOGIC;
		 ed0 : OUT STD_LOGIC;
		 calu : OUT STD_LOGIC;
		 ealu : OUT STD_LOGIC;
		 F0 : OUT STD_LOGIC;
		 F1 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT datapath
	PORT(add : IN STD_LOGIC;
		 sub : IN STD_LOGIC;
		 inc : IN STD_LOGIC;
		 dec : IN STD_LOGIC;
		 t6 : IN STD_LOGIC;
		 f1 : IN STD_LOGIC;
		 f0 : IN STD_LOGIC;
		 ealu : IN STD_LOGIC;
		 calu : IN STD_LOGIC;
		 ed0 : IN STD_LOGIC;
		 cd0 : IN STD_LOGIC;
		 epc : IN STD_LOGIC;
		 cpc : IN STD_LOGIC;
		 eir : IN STD_LOGIC;
		 cir : IN STD_LOGIC;
		 embr : IN STD_LOGIC;
		 cmbr : IN STD_LOGIC;
		 cmar : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 reset : IN STD_LOGIC;
		 data_bus : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Z : OUT STD_LOGIC;
		 address_bus : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
		 opcode : OUT STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END COMPONENT;

COMPONENT instruction_sequencer
	PORT(reset : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 opcode : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 t0 : OUT STD_LOGIC;
		 t1 : OUT STD_LOGIC;
		 t2 : OUT STD_LOGIC;
		 t3 : OUT STD_LOGIC;
		 t4 : OUT STD_LOGIC;
		 t5 : OUT STD_LOGIC;
		 t6 : OUT STD_LOGIC;
		 t7 : OUT STD_LOGIC;
		 execute : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_38 :  STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_39 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_40 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_41 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_42 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_43 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_24 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_25 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_26 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_27 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_28 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_29 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_30 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_31 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_32 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_33 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_34 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_35 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_36 :  STD_LOGIC;


BEGIN 



b2v_decoder_0 : decoder_3
PORT MAP(execute => SYNTHESIZED_WIRE_0,
		 opcode => SYNTHESIZED_WIRE_38,
		 load => SYNTHESIZED_WIRE_2,
		 store => SYNTHESIZED_WIRE_3,
		 add => SYNTHESIZED_WIRE_39,
		 sub => SYNTHESIZED_WIRE_40,
		 inc => SYNTHESIZED_WIRE_41,
		 dec => SYNTHESIZED_WIRE_42,
		 bra => SYNTHESIZED_WIRE_8,
		 beq => SYNTHESIZED_WIRE_9);


b2v_inst : control_signals_logic
PORT MAP(load => SYNTHESIZED_WIRE_2,
		 store => SYNTHESIZED_WIRE_3,
		 add => SYNTHESIZED_WIRE_39,
		 sub => SYNTHESIZED_WIRE_40,
		 inc => SYNTHESIZED_WIRE_41,
		 dec => SYNTHESIZED_WIRE_42,
		 bra => SYNTHESIZED_WIRE_8,
		 beq => SYNTHESIZED_WIRE_9,
		 t0 => SYNTHESIZED_WIRE_10,
		 t1 => SYNTHESIZED_WIRE_11,
		 t2 => SYNTHESIZED_WIRE_12,
		 t3 => SYNTHESIZED_WIRE_13,
		 t4 => SYNTHESIZED_WIRE_14,
		 t5 => SYNTHESIZED_WIRE_15,
		 t6 => SYNTHESIZED_WIRE_43,
		 t7 => SYNTHESIZED_WIRE_17,
		 Z => SYNTHESIZED_WIRE_18,
		 r => r,
		 w => w,
		 cmar => SYNTHESIZED_WIRE_36,
		 cmbr => SYNTHESIZED_WIRE_35,
		 embr => SYNTHESIZED_WIRE_34,
		 cir => SYNTHESIZED_WIRE_33,
		 eir => SYNTHESIZED_WIRE_32,
		 cpc => SYNTHESIZED_WIRE_31,
		 epc => SYNTHESIZED_WIRE_30,
		 cd0 => SYNTHESIZED_WIRE_29,
		 ed0 => SYNTHESIZED_WIRE_28,
		 calu => SYNTHESIZED_WIRE_27,
		 ealu => SYNTHESIZED_WIRE_26,
		 F0 => SYNTHESIZED_WIRE_25,
		 F1 => SYNTHESIZED_WIRE_24);


b2v_inst2 : datapath
PORT MAP(add => SYNTHESIZED_WIRE_39,
		 sub => SYNTHESIZED_WIRE_40,
		 inc => SYNTHESIZED_WIRE_41,
		 dec => SYNTHESIZED_WIRE_42,
		 t6 => SYNTHESIZED_WIRE_43,
		 f1 => SYNTHESIZED_WIRE_24,
		 f0 => SYNTHESIZED_WIRE_25,
		 ealu => SYNTHESIZED_WIRE_26,
		 calu => SYNTHESIZED_WIRE_27,
		 ed0 => SYNTHESIZED_WIRE_28,
		 cd0 => SYNTHESIZED_WIRE_29,
		 epc => SYNTHESIZED_WIRE_30,
		 cpc => SYNTHESIZED_WIRE_31,
		 eir => SYNTHESIZED_WIRE_32,
		 cir => SYNTHESIZED_WIRE_33,
		 embr => SYNTHESIZED_WIRE_34,
		 cmbr => SYNTHESIZED_WIRE_35,
		 cmar => SYNTHESIZED_WIRE_36,
		 clock => clock,
		 reset => reset,
		 data_bus => data_bus,
		 Z => SYNTHESIZED_WIRE_18,
		 address_bus => address_bus,
		 opcode => SYNTHESIZED_WIRE_38);


b2v_sequencer_0 : instruction_sequencer
PORT MAP(reset => reset,
		 clock => clock,
		 opcode => SYNTHESIZED_WIRE_38,
		 t0 => SYNTHESIZED_WIRE_10,
		 t1 => SYNTHESIZED_WIRE_11,
		 t2 => SYNTHESIZED_WIRE_12,
		 t3 => SYNTHESIZED_WIRE_13,
		 t4 => SYNTHESIZED_WIRE_14,
		 t5 => SYNTHESIZED_WIRE_15,
		 t6 => SYNTHESIZED_WIRE_43,
		 t7 => SYNTHESIZED_WIRE_17,
		 execute => SYNTHESIZED_WIRE_0);


END bdf_type;