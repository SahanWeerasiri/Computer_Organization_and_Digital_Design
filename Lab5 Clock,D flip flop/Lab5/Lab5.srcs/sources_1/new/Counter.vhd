----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/06/2024 09:24:32 AM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( Dir : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (2 downto 0));
end Counter;

architecture Behavioral of Counter is
COMPONENT D_FF 
    PORT(
        D,Res,Clk : IN STD_LOGIC;
        Q,Qbar : OUT STD_LOGIC
    ); 
END COMPONENT;
COMPONENT Slow_Clk 
    PORT ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end COMPONENT;
SIGNAL D0,D1,D2,Q0,Q1,Q2,Clk_slow : STD_LOGIC;

begin
    
    
    Slow_Clk0 : Slow_Clk
        PORT MAP(
            Clk_in => Clk, 
            Clk_out => Clk_slow
        );
    D0 <= ((NOT Q2) AND (NOT Dir)) OR (Q1 AND Dir);
    D1 <= ((NOT Dir) AND Q0) OR (Dir AND Q2);
    D2 <= (Dir AND (NOT Q0)) OR ((NOT Dir) AND Q1);
    

    D_FF0 : D_FF
        PORT MAP(
            D => D0,
            Res => Res,
            Clk => Clk_slow,
            Q => Q0
        );
    D_FF1 : D_FF
        PORT MAP(
            D => D1,
            Res => Res,
            Clk => Clk_slow,
            Q => Q1
        );
    D_FF2 : D_FF
        PORT MAP(
            D => D2,
            Res => Res,
            Clk => Clk_slow,
            Q => Q2
        );
        
    Q(0) <= Q0;
    Q(1) <= Q1;
    Q(2) <= Q2;        

end Behavioral;
