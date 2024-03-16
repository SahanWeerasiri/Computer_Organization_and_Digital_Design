----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2024 12:44:58 PM
-- Design Name: 
-- Module Name: Counter_Sim - Behavioral
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

entity Counter_Sim is
--  Port ( );
end Counter_Sim;

architecture Behavioral of Counter_Sim is
COMPONENT Counter is
    Port ( Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end COMPONENT;
SIGNAL Dir,Res,Clk : STD_LOGIC;
SIGNAL Q : STD_LOGIC_VECTOR (2 DOWNTO 0);
begin
    UUT : Counter 
        PORT MAP(
            Dir => Dir,
            Res => Res,
            Clk => Clk,
            Q => Q        
        );
    Clk1 : PROCESS
        BEGIN
            Clk <= '1';WAIT FOR 10 NS;
            Clk <= '0';WAIT FOR 10 NS;           
        END PROCESS; 
    PROCESS 
        BEGIN
            Res <= '1';
            WAIT FOR 100 NS;
            
            Res <= '0';
            
            Dir <= '0';WAIT FOR 300 NS;
           
           Res <= '1';
           WAIT FOR 100 NS;
           
           Res <= '0';
                       
            Dir <= '1';WAIT FOR 600 NS;
    END PROCESS;

end Behavioral;
