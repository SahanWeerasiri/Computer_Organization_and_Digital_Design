----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/05/2024 02:31:28 PM
-- Design Name: 
-- Module Name: D_FF_Sim - Behavioral
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

entity D_FF_Sim is
--  Port ( );
end D_FF_Sim;

architecture Behavioral of D_FF_Sim is
COMPONENT D_FF 
    PORT(
        D,Res,Clk : IN STD_LOGIC;
        Q,Qbar : OUT STD_LOGIC
    ); 
END COMPONENT;
SIGNAL D,Res,Clk,Q,Qbar : STD_LOGIC;
begin
    UUT : D_FF
        PORT MAP(
            D => D,
            Res => Res,
            Clk => Clk,
            Q => Q,
            Qbar => Qbar
        );
    
    Clk1 : PROCESS
        BEGIN
            Clk <= '1';WAIT FOR 5 NS;
            
            Clk <= '0';WAIT FOR 5 NS;           
            
    END PROCESS; 
    PROCESS 
        BEGIN
            Res <= '0';WAIT FOR 100 NS;
            D <= '0';WAIT FOR 100 NS;
            
            D <= '1';WAIT FOR 100 NS;
            
            
            Res <= '1';WAIT FOR 100 NS;
            D <= '0';WAIT FOR 100 NS;
                        
            D <= '1';WAIT FOR 100 NS;
        
    END PROCESS;
end Behavioral;
