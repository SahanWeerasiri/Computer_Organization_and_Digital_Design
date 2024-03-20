----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2024 03:01:00 PM
-- Design Name: 
-- Module Name: AU - Behavioral
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

entity AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end AU;

architecture Behavioral of AU is
COMPONENT Slow_Clk 
    PORT ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end COMPONENT;
COMPONENT Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end COMPONENT;
COMPONENT RCA_4 is
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
end COMPONENT;
COMPONENT Decorder_1_to_2 is
    Port ( I : in STD_LOGIC;
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (1 downto 0));
end COMPONENT;

SIGNAL Clk_slow : STD_LOGIC; 
SIGNAL In0,In1 : STD_LOGIC_VECTOR (3 DOWNTO 0); -- In0,In1 A inputs
SIGNAL Y : STD_LOGIC_VECTOR (1 DOWNTO 0); --Y Decorder Outputs
SIGNAL s0,s1,s2,s3,c : STD_LOGIC; --Outputs of the adder

begin

    Slow_CLk0 : Slow_Clk 
        PORT MAP(
            Clk_in=>Clk,
            Clk_Out=>Clk_slow
        );
    Decorder_1_to_2_0 : Decorder_1_to_2
        PORT MAP(
            I => RegSel,
            EN => '1',
            Y => Y   
        );
    Reg_A : Reg
        PORT MAP(
            D => A,
            En => Y(0),
            Clk => Clk_slow,
            Q => In0  
        );
    Reg1_B : Reg
        PORT MAP(
            D => A,
            En => Y(1),
            Clk => Clk_slow,
            Q => In1  
        );
    RCA_4_0 : RCA_4
        PORT MAP(
            A0 => In0(0),
            A1 => In0(1),
            A2 => In0(2),
            A3 => In0(3),
            B0 => In1(0),
            B1 => In1(1),
            B2 => In1(2),
            B3 => In1(3),
            C_in => '0',
            S0 => s0,
            S1 => s1,
            S2 => s2,
            S3 => s3,
            C_out => c
        );

    Zero <= NOT(s0 OR s1 OR s2 OR s3 OR c);
    S(0) <= s0;
    S(1) <= s1;
    S(2) <= s2;
    S(3) <= s3;
    Carry <= c;

end Behavioral;
