----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/27/2024 02:11:55 PM
-- Design Name: 
-- Module Name: Multiplier_2 - Behavioral
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

entity Multiplier_2 is
    Port ( A : in STD_LOGIC_VECTOR (1 downto 0);
           B : in STD_LOGIC_VECTOR (1 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Multiplier_2;

architecture Behavioral of Multiplier_2 is
COMPONENT FA is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S : out STD_LOGIC;
           C_out : out STD_LOGIC);
end COMPONENT;
SIGNAL b0a0,b1a0,b0a1,b1a1,c_0_1,c_0_2,s_0_1,s_0_2 : STD_LOGIC;

begin

    b0a0 <= B(0) AND A(0);  b1a0 <= B(1) AND A(0);  b0a1 <= B(0) AND A(1);  b1a1 <= B(1) AND A(1);
    
    
    FA_0_0 : FA
        PORT MAP(
            A => b0a1,
            B => b1a0,
            C_in => '0',
            S => s_0_1,
            C_out => c_0_1
        );
    FA_0_1 : FA
        PORT MAP(
            A => c_0_1,
            B => b1a1,
            C_in => '0',
            S => s_0_2,
            C_out => c_0_2
        );   
            
    
    
    Y(0) <= b0a0;    Y(1) <= s_0_1;   Y(2) <= s_0_2;   Y(3) <= c_0_2;
    
    
        

end Behavioral;
