----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 01:55:45 PM
-- Design Name: 
-- Module Name: TB_Decoder_2_to_4 - Behavioral
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

entity TB_Decoder_2_to_4 is
--  Port ( );
end TB_Decoder_2_to_4;

architecture Behavioral of TB_Decoder_2_to_4 is
COMPONENT Decoder_2_to_4
    PORT(
        I : IN STD_LOGIC_VECTOR (1 DOWNTO 0);
        EN : IN STD_LOGIC;
        Y : OUT STD_LOGIC_VECTOR (3 DOWNTO 0)
    );
END COMPONENT;
SIGNAL I:STD_LOGIC_VECTOR (1 DOWNTO 0);
SIGNAL EN:STD_LOGIC;
SIGNAL Y:STD_LOGIC_VECTOR (3 DOWNTO 0);
begin
    UUT : Decoder_2_to_4
        PORT MAP(
            I=>I,
            EN=>EN,
            Y=>Y
        );
    PROCESS 
        BEGIN
            EN<='0';I(1)<='0';I(0)<='0';WAIT FOR 100 NS;
            
            EN<='0';I(1)<='0';I(0)<='1';WAIT FOR 100 NS;
            
            EN<='0';I(1)<='1';I(0)<='0';WAIT FOR 100 NS;
            
            EN<='0';I(1)<='1';I(0)<='1';WAIT FOR 100 NS;
            
            EN<='1';I(1)<='0';I(0)<='0';WAIT FOR 100 NS;
            
            EN<='1';I(1)<='0';I(0)<='1';WAIT FOR 100 NS;
            
            EN<='1';I(1)<='1';I(0)<='0';WAIT FOR 100 NS;
            
            EN<='1';I(1)<='1';I(0)<='1';WAIT;
            
    END PROCESS;
            
        

end Behavioral;
