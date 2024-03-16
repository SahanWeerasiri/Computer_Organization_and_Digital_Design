----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2024 11:55:45 PM
-- Design Name: 
-- Module Name: TB_Multiplier_4 - Behavioral
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

entity TB_Multiplier_4 is
--  Port ( );
end TB_Multiplier_4;

architecture Behavioral of TB_Multiplier_4 is
COMPONENT Multiplier_4 is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

SIGNAL A,B : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL Y : STD_LOGIC_VECTOR (7 DOWNTO 0);

begin
    UUT : Multiplier_4 
        PORT MAP(
            A => A,
            B => B,
            Y => Y           
        );

    PROCESS 
        BEGIN
            --bin(220689)
            --'0b 11 | 0101 1110 | 0001 0001'
            --0001 0001
            A<="0001";B<="0001";WAIT FOR 100 NS;
            
            --0101 1110
            A<="0101";B<="1110";WAIT FOR 100 NS;
            
            --Additional
            --1011 0110
            A<="1011";B<="0110";WAIT FOR 100 NS;
            
            --0101 1010
            A<="0101";B<="1010";WAIT FOR 100 NS;
            
            --1110 0010
            A<="1110";B<="0010";WAIT FOR 100 NS;
            
            --0011 0100
            A<="0011";B<="0100";WAIT;
            
            
    END PROCESS;
end Behavioral;
