----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/19/2024 01:28:00 PM
-- Design Name: 
-- Module Name: LUT_16_7_Sim - Behavioral
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

entity LUT_16_7_Sim is
--  Port ( );
end LUT_16_7_Sim;

architecture Behavioral of LUT_16_7_Sim is
COMPONENT LUT_16_7
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
END COMPONENT;
SIGNAL address : STD_LOGIC_VECTOR (3 DOWNTO 0);
SIGNAL data : STD_LOGIC_VECTOR (6 DOWNTO 0);
begin
    UUT : LUT_16_7 
        PORT MAP(
            address => address,
            data => data
        );
    PROCESS 
        BEGIN
            address <= "0000";WAIT FOR 100 NS; 
            address <= "0110";WAIT FOR 100 NS; 
            address <= "1010";WAIT FOR 100 NS; 
            address <= "1111";WAIT FOR 100 NS; 
    END PROCESS;

end Behavioral;
