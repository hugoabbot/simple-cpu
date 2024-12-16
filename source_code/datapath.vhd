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
-- CREATED		"Wed Nov 13 11:33:44 2024"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY datapath IS 
	PORT
	(
		add :  IN  STD_LOGIC;
		sub :  IN  STD_LOGIC;
		inc :  IN  STD_LOGIC;
		dec :  IN  STD_LOGIC;
		t6 :  IN  STD_LOGIC;
		f1 :  IN  STD_LOGIC;
		f0 :  IN  STD_LOGIC;
		ealu :  IN  STD_LOGIC;
		calu :  IN  STD_LOGIC;
		ed0 :  IN  STD_LOGIC;
		cd0 :  IN  STD_LOGIC;
		epc :  IN  STD_LOGIC;
		cpc :  IN  STD_LOGIC;
		eir :  IN  STD_LOGIC;
		cir :  IN  STD_LOGIC;
		embr :  IN  STD_LOGIC;
		cmbr :  IN  STD_LOGIC;
		cmar :  IN  STD_LOGIC;
		clock :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		data_bus :  INOUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		Z :  OUT  STD_LOGIC;
		address_bus :  OUT  STD_LOGIC_VECTOR(4 DOWNTO 0);
		opcode :  OUT  STD_LOGIC_VECTOR(2 DOWNTO 0)
	);
END datapath;

ARCHITECTURE bdf_type OF datapath IS 

COMPONENT alu
	PORT(f0 : IN STD_LOGIC;
		 f1 : IN STD_LOGIC;
		 p : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 Z : OUT STD_LOGIC;
		 alu_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT tri_state_model
	PORT(enable : IN STD_LOGIC;
		 data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dreg_e
	PORT(reset : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 enable : IN STD_LOGIC;
		 d : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT z_ff
	PORT(reset : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 Z : IN STD_LOGIC;
		 add : IN STD_LOGIC;
		 sub : IN STD_LOGIC;
		 inc : IN STD_LOGIC;
		 dec : IN STD_LOGIC;
		 t6 : IN STD_LOGIC;
		 Z_out : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	DO_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	IR_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	MAR_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	PC_in :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;


BEGIN 



b2v_alu : alu
PORT MAP(f0 => f0,
		 f1 => f1,
		 p => DO_out,
		 q => data_bus,
		 Z => SYNTHESIZED_WIRE_4,
		 alu_out => SYNTHESIZED_WIRE_1);


b2v_alu_buffer : tri_state_model
PORT MAP(enable => ealu,
		 data_in => SYNTHESIZED_WIRE_0,
		 data_out => data_bus);


b2v_alu_register : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => calu,
		 d => SYNTHESIZED_WIRE_1,
		 q => SYNTHESIZED_WIRE_0);


b2v_D0 : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => cd0,
		 d => data_bus,
		 q => DO_out);


b2v_d0_buffer : tri_state_model
PORT MAP(enable => ed0,
		 data_in => DO_out,
		 data_out => data_bus);

PC_in(4 DOWNTO 0) <= data_bus(4 DOWNTO 0);




b2v_IR : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => cir,
		 d => data_bus,
		 q => IR_out);


b2v_ir_buffer : tri_state_model
PORT MAP(enable => eir,
		 data_in => IR_out,
		 data_out => data_bus);


b2v_MAR : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => cmar,
		 d => data_bus,
		 q => MAR_out);


b2v_MBR : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => cmbr,
		 d => data_bus,
		 q => SYNTHESIZED_WIRE_2);


b2v_mbr_buffer : tri_state_model
PORT MAP(enable => embr,
		 data_in => SYNTHESIZED_WIRE_2,
		 data_out => data_bus);


b2v_PC : dreg_e
PORT MAP(reset => reset,
		 clock => clock,
		 enable => cpc,
		 d => PC_in,
		 q => SYNTHESIZED_WIRE_3);


b2v_pc_buffer : tri_state_model
PORT MAP(enable => epc,
		 data_in => SYNTHESIZED_WIRE_3,
		 data_out => data_bus);


b2v_Z_ff_0 : z_ff
PORT MAP(reset => reset,
		 clock => clock,
		 Z => SYNTHESIZED_WIRE_4,
		 add => add,
		 sub => sub,
		 inc => inc,
		 dec => dec,
		 t6 => t6,
		 Z_out => Z);

address_bus(4 DOWNTO 0) <= MAR_out(4 DOWNTO 0);
opcode(2 DOWNTO 0) <= IR_out(7 DOWNTO 5);

PC_in(7 DOWNTO 5) <= "000";
END bdf_type;