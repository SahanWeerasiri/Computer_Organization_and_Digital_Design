----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 11:44:19 PM
-- Design Name: 
-- Module Name: Slow_Clk - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Slow_Clk is
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end Slow_Clk;

architecture Behavioral of Slow_Clk is
SIGNAL count : INTEGER := 1;
SIGNAL clk_state : STD_LOGIC := '0';

begin
    PROCESS (Clk_in) 
        BEGIN
            IF (rising_edge(Clk_in)) THEN
                count <= count+1;
                IF (count <= 100000000 ) THEN --count 50M pulses (1/2 of period) ; 100 MHz / 2 = 50 MHz
                    clk_state <= NOT clk_state;
                    count <= 1;
                END IF;
            END IF;
            Clk_out <= clk_state;
    END PROCESS;


end Behavioral;
