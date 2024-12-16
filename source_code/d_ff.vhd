LIBRARY ieee;
USE ieee.std_logic_1164.all;
LIBRARY work;

ENTITY d_ff IS
	PORT (
		reset	: 	IN STD_LOGIC;
		clock	: 	IN STD_LOGIC;
		d		: 	IN STD_LOGIC;
		q		: 	OUT STD_LOGIC
		);
END d_ff;

ARCHITECTURE rtl of d_ff IS 

begin 

	current_state: process (clock, reset)
	begin
		if (reset = '1') then
			q <= '0';
		elsif rising_edge(clock) then
			q <= d;
		end if;
	end process;
END rtl;