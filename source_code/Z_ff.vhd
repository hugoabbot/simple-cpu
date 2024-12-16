LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;

ENTITY Z_ff IS
	PORT (
		reset	: 	IN STD_LOGIC;
		clock	: 	IN STD_LOGIC;
		Z		: 	IN STD_LOGIC;
		add	: 	IN STD_LOGIC;
		sub	: 	IN STD_LOGIC;
		inc	: 	IN STD_LOGIC;
		dec	: 	IN STD_LOGIC;
		t6		: 	IN STD_LOGIC;
		Z_out	: 	OUT STD_LOGIC
		);
END Z_ff;

ARCHITECTURE zff of Z_ff IS 
	COMPONENT d_ff
	PORT (
		reset	: 	IN STD_LOGIC;
		clock	: 	IN STD_LOGIC;
		d		: 	IN STD_LOGIC;
		q		: 	OUT STD_LOGIC
		);
	END COMPONENT;

	SIGNAL not_clock : STD_LOGIC; 
	SIGNAL Z_sel : STD_LOGIC;
	SIGNAL Z_d : STD_LOGIC;
	SIGNAL Z_internal : STD_LOGIC;
	
	BEGIN
	
	-- current state 
	-- you need to determine what to connect to each port 
	d_ff0 : d_ff
	PORT MAP(reset => reset,
			 clock => not_clock,
			 d => Z_d,
			 q => Z_internal
			 );
			 
	-- next state logic 
	-- you need to complete the Z_sel and Z_d lines with combinational logic equations
	not_clock <= not(clock);
	Z_sel <= t6 and (add or sub or inc or dec); 
	Z_d <= (Z_sel and Z) or (not(Z_sel) and Z_internal); -- 2-input MUX logic 
			 
	-- output 
	Z_out <= Z_internal;
	
END zff;