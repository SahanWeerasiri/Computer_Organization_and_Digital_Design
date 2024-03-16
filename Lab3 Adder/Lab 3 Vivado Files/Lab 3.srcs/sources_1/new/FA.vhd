----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 06:59:40 PM
-- Design Name: 
-- Module Name: FA - Behavioral
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

entity FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end FA;

architecture Behavioral of FA is
COMPONENT HA
    PORT(
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        S : OUT STD_LOGIC;
        C : OUT STD_LOGIC
    );
END COMPONENT;

SIGNAL HA0_S, HA0_C, HA1_S, HA1_C : STD_LOGIC;

begin
    HA_0 : HA
        PORT MAP(
            A => A,
            B => B,
            S => HA0_S,
            C => HA0_C
        );
     HA_1 : HA
        PORT MAP(
            A => HA0_S,
            B => C_in,
            S => HA1_S,
            C => HA1_C
        );   
        
    S <= A XOR B XOR C_in;
    --S <= HA1_S;
    C_out <= (A AND B) or (C_in and(A XOR B));
    --C_out <= HA1_C;
    
end Behavioral;
