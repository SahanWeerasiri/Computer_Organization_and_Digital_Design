----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/13/2024 07:30:53 PM
-- Design Name: 
-- Module Name: RCA_4 - Behavioral
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

entity RCA_4 is
    Port ( A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           A2 : in STD_LOGIC;
           A3 : in STD_LOGIC;
           B0 : in STD_LOGIC;
           B1 : in STD_LOGIC;
           B2 : in STD_LOGIC;
           B3 : in STD_LOGIC;
           C_in : in STD_LOGIC;
           S0 : out STD_LOGIC;
           S1 : out STD_LOGIC;
           S2 : out STD_LOGIC;
           S3 : out STD_LOGIC;
           C_out : out STD_LOGIC);
end RCA_4;

architecture Behavioral of RCA_4 is
COMPONENT FA
    PORT(
        A : IN STD_LOGIC;
        B : IN STD_LOGIC;
        C_in : IN STD_LOGIC;
        S : OUT STD_LOGIC;
        C_out : OUT STD_LOGIC
    );
END COMPONENT;
SIGNAL FA0_C,FA1_C,FA2_C,FA3_C : STD_LOGIC;
begin
    FA0 : FA 
        PORT MAP(
            A => A0,
            B => B0,
            C_in => '0',
            S => S0,
            C_out => FA0_C
        );
    FA1 : FA 
        PORT MAP(
            A => A1,
            B => B1,
            C_in => FA0_C,
            S => S1,
            C_out => FA1_C
        );
    FA2 : FA 
        PORT MAP(
            A => A2,
            B => B2,
            C_in => FA1_C,
            S => S2,
            C_out => FA2_C
        );
    FA3 : FA 
        PORT MAP(
            A => A3,
            B => B3,
            C_in => FA2_C,
            S => S3,
            C_out => FA3_C
        );
        
    C_out <= FA3_C;
    
end Behavioral;
