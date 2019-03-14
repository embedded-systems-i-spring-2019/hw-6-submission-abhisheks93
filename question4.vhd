----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2019 03:10:32 AM
-- Design Name: 
-- Module Name: question4 - Behavioral
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

entity question4 is
--  Port ( );
Port(
    INIT : in std_logic;
    clk : in std_logic;
    X1, X2 : in std_logic;
    Z1, Z2 : out std_logic;
    Y : out std_logic_vector(1 downto 0));
end question4;

architecture Behavioral of question4 is
type state_type is (a, b, c);
signal ps, ns : state_type;
begin

process(clk, INIT, ps)
begin
    
     if (INIT = '1') then
        ps <= a;
    elsif(rising_edge(clk)) then
                ps <= ns;
    end if;
end process;

process (ps, X1, X2)
begin
    if (ps = a and X1 = '1') then
        ns <= b;
        Z2 <= '1';
        Z1 <= '1'; 
    elsif (ps = b and X2 = '1') then
        ns <= a;
        Z1 <= '0';
        Z2 <= '0';
    elsif(ps = b and X2 = '0') then
        ns <= c;
        Z1 <= '1';
        Z2 <= '1';
    elsif(ps = c and X1 = '1') then
        ns <= b;
        Z2 <= '1';
        Z1 <= '1';
    elsif(ps = c and X1 = '0') then
        ns <= a;
        Z1 <= '0';
        Z2 <= '1';
    elsif (ps = a and X1 ='0') then
         ns <= c;
         Z1 <= '1';
         Z2 <= '0';
    end if;
end process;    
    

end Behavioral;
