----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 11:56:17 PM
-- Design Name: 
-- Module Name: Slow_Clk_Sim - Behavioral
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

entity Slow_Clk_Sim is
--  Port ( );
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is
COMPONENT Slow_Clk 
    PORT ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end COMPONENT;
SIGNAL Clk_in,Clk_out : STD_LOGIC;
begin
    UUT : Slow_Clk 
        PORT MAP(
            Clk_in => Clk_in,
            Clk_out => Clk_out
        );
    Clk : PROCESS
        BEGIN
            Clk_in <= '0';WAIT FOR 10 NS;
            Clk_in <= '1';WAIT FOR 10 NS;
    END PROCESS;

end Behavioral;
