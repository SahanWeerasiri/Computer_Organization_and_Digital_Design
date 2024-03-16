----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/20/2024 02:21:19 PM
-- Design Name: 
-- Module Name: TB_Decoder_3_to_8 - Behavioral
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

entity TB_Decoder_3_to_8 is
--  Port ( );
end TB_Decoder_3_to_8;

architecture Behavioral of TB_Decoder_3_to_8 is
COMPONENT Decoder_3_to_8
    PORT(
        I : in STD_LOGIC_VECTOR (2 downto 0);
        EN : in STD_LOGIC;
        Y : out STD_LOGIC_VECTOR (7 downto 0)
    );
END COMPONENT;
SIGNAL I : STD_LOGIC_VECTOR (2 DOWNTO 0);
SIGNAL EN : STD_LOGIC;
SIGNAL Y : STD_LOGIC_VECTOR (7 DOWNTO 0);
begin
    UUT : Decoder_3_to_8
        PORT MAP(
            I => I,
            EN => EN,
            Y => Y
        );
    PROCESS
        BEGIN
            --bin(220689)
            --'0b 110 101 111 000 010 001'
            --001
            EN<='1';I(2)<='0';I(1)<='0';I(0)<='1';WAIT FOR 100 NS;
            --010
            EN<='1';I(2)<='0';I(1)<='1';I(0)<='0';WAIT FOR 100 NS;
            --000
            EN<='1';I(2)<='0';I(1)<='0';I(0)<='0';WAIT FOR 100 NS;
            --111
            EN<='1';I(2)<='1';I(1)<='1';I(0)<='1';WAIT FOR 100 NS;
            --101
            EN<='1';I(2)<='1';I(1)<='0';I(0)<='1';WAIT FOR 100 NS;
            --110
            EN<='1';I(2)<='1';I(1)<='1';I(0)<='0';WAIT;
    END PROCESS;

end Behavioral;
