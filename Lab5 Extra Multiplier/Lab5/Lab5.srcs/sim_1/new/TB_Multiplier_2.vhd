----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 02:32:29 PM
-- Design Name: 
-- Module Name: TB_Multiplier_2 - Behavioral
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

entity TB_Multiplier_2 is
--  Port ( );
end TB_Multiplier_2;

architecture Behavioral of TB_Multiplier_2 is
COMPONENT Multiplier_2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;

SIGNAL A,B : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL Y : STD_LOGIC_VECTOR(3 DOWNTO 0);
begin

    UUT : Multiplier_2
        PORT MAP(
            A => A,
            B => B,
            Y => Y
        );
        
    PROCESS
        BEGIN
            --bin(220689)
            --'0b 11 | 01 01 | 11 10 | 00 01 | 00 01'
            --00 01
            A<="01";B<="00";WAIT FOR 100 NS;
            
            --00 01 (Duplicate)
            --A<="01";B<="00";WAIT FOR 100 NS;
            
            --11 10
            A<="10";B<="11";WAIT FOR 100 NS;
            
            --01 01
            A<="01";B<="01";WAIT FOR 100 NS;
            
            --Aditional
            --11 11
            A<="11";B<="11";WAIT FOR 100 NS;
            
            --10 11
            A<="10";B<="11";WAIT FOR 100 NS;
            
            --10 10
            A<="10";B<="10";WAIT FOR 100 NS;
            
    END PROCESS;


end Behavioral;
