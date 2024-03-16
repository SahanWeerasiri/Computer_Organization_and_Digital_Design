----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 03:35:39 PM
-- Design Name: 
-- Module Name: TB_Mux_8_to_1 - Behavioral
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

entity TB_Mux_8_to_1 is
--  Port ( );
end TB_Mux_8_to_1;

architecture Behavioral of TB_Mux_8_to_1 is
COMPONENT Mux_8_to_1
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC);
END COMPONENT;
SIGNAL S : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL D : STD_LOGIC_VECTOR (7 DOWNTO 0);
SIGNAL EN,Y : STD_LOGIC;
begin
    UUT : Mux_8_to_1
        PORT MAP(
            D => D,
            S => S,
            EN => EN,
            Y => Y
        );
    PROCESS 
        BEGIN
        EN <='1';
        --bin(220689)
        --'0b 110 101 111 000 010 001'
        D <= "00010001";
        --001
        S <= "001";WAIT FOR 50 NS;
        --010
        S <= "010";WAIT FOR 50 NS;
        --000
        S <= "000";WAIT FOR 50 NS;
        --111
        S <= "111";WAIT FOR 50 NS;
        --101
        S <= "101";WAIT FOR 50 NS;
        --110
        S <= "110";WAIT FOR 50 NS;
        
        D <= "01011110";
        --001
        S <= "001";WAIT FOR 50 NS;
        --010
        S <= "010";WAIT FOR 50 NS;
        --000
        S <= "000";WAIT FOR 50 NS;
        --111
        S <= "111";WAIT FOR 50 NS;
        --101
        S <= "101";WAIT FOR 50 NS;
        --110
        S <= "110";WAIT;

    END PROCESS;

end Behavioral;
