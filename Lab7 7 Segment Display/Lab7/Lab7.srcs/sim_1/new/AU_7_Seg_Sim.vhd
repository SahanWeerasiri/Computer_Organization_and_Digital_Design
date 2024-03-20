----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2024 02:14:50 PM
-- Design Name: 
-- Module Name: AU_7_Seg_Sim - Behavioral
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

entity AU_7_Seg_Sim is
--  Port ( );
end AU_7_Seg_Sim;

architecture Behavioral of AU_7_Seg_Sim is
COMPONENT AU_7_Seg is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           Clk : in STD_LOGIC;
           RegSel : in STD_LOGIC;
           S_LED : out STD_LOGIC_VECTOR (3 downto 0);
           S_7Seg : out STD_LOGIC_VECTOR (6 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end COMPONENT;
SIGNAL A : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL RegSel,Clk,Zero,Carry : STD_LOGIC;
SIGNAL S_7Seg : STD_LOGIC_VECTOR (6 downto 0);
SIGNAL S_LED : STD_LOGIC_VECTOR (3 downto 0);

begin
    UUT : AU_7_Seg 
        PORT MAP(
            A => A,
            RegSel => RegSel,
            Clk => Clk,
            S_LED => S_LED,
            S_7Seg => S_7Seg,
            Carry => Carry,
            Zero => Zero
        );
    clock : PROCESS 
            BEGIN
            Clk <= '0';WAIT FOR 10 NS;
            Clk <= '1';WAIT FOR 10 NS;
        END PROCESS;
    PROCESS 
        BEGIN
            --bin(220689)
            --'0b11 0101 1110 0001 0001'
            --0001
            A <= "0001";
            RegSel <= '0'; WAIT FOR 50 NS;
            --1110
            A <= "1110";
            RegSel <= '1'; WAIT FOR 50 NS;            
            
                   
            --0101
            A <= "0101";
            RegSel <= '0'; WAIT FOR 50 NS;
            --0001
            A <= "1111";
            RegSel <= '1'; WAIT FOR 50 NS;
                    
            --1111
            A <= "1111";
            RegSel <= '0'; WAIT FOR 50 NS;
            RegSel <= '1'; WAIT FOR 50 NS;
    END PROCESS;

end Behavioral;
