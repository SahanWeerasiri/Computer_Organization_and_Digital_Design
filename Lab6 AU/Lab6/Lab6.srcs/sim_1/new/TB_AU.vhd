----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/12/2024 04:04:51 PM
-- Design Name: 
-- Module Name: TB_AU - Behavioral
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

entity TB_AU is
--  Port ( );
end TB_AU;

architecture Behavioral of TB_AU is
COMPONENT AU is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           RegSel : in STD_LOGIC;
           Clk : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (3 downto 0);
           Zero : out STD_LOGIC;
           Carry : out STD_LOGIC);
end COMPONENT;
SIGNAL Clk,Zero,Carry,RegSel : STD_LOGIC;
SIGNAL A,S : STD_LOGIC_VECTOR (3 DOWNTO 0);
begin
    UUT : AU 
        PORT MAP(
            A => A,
            RegSel => RegSel,
            Clk => Clk,
            S => S,
            Zero => Zero,
            Carry => Carry
        );
    Clk1 : PROCESS
        BEGIN
            Clk <= '0';WAIT FOR 10 NS;
            CLK <= '1';WAIT FOR 10 NS;
    END PROCESS;
    PROCESS 
        BEGIN
            --bin(220689)
            --'0b11 0101 1110 0001 0001'
            --0001
            A <= "0001";
            RegSel <= '0'; WAIT FOR 50 NS;
            RegSel <= '1'; WAIT FOR 50 NS;            
            
            --1110
            A <= "1110";
            RegSel <= '0'; WAIT FOR 50 NS;
            RegSel <= '1'; WAIT FOR 50 NS;
            
            --0101
            A <= "0101";
            RegSel <= '0'; WAIT FOR 50 NS;
            RegSel <= '1'; WAIT FOR 50 NS;
            
            --0001
            A <= "1111";
            RegSel <= '0'; WAIT FOR 50 NS;
            RegSel <= '1'; WAIT FOR 50 NS;
            
            --0000
            A <= "0000";
            RegSel <= '0'; WAIT FOR 50 NS;
            RegSel <= '1'; WAIT FOR 50 NS;
    END PROCESS;



end Behavioral;
