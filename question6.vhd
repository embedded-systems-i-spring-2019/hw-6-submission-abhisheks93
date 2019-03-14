----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2019 03:45:07 AM
-- Design Name: 
-- Module Name: question6 - Behavioral
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

entity question6 is
--  Port ( );
Port(
    clk : in std_logic;
    X : in std_logic;
    Z1, Z2 : out std_logic;
    Y : out std_logic_vector(1 downto 0)
    );
end question6;

architecture Behavioral of question6 is
type state_type is (A,B,C,D);

signal ps,ns : state_type;

begin

process(clk)
begin
    if(rising_edge(clk)) then
       ps <= ns;
    end if;
end process;
    
process(ps ,X)
begin
    if(ps = A and X = '1') then
        
        Z1 <= '1';
        Z2 <= '0';
        ns <= A;
    elsif(ps = A and X = '0') then
        
        Z2 <= '0';
        Z1 <= '1';
        ns <= C;
    elsif(ps = C and X = '1') then
        
        Z1 <= '1';
        Z2 <= '0';
        ns <= A;
    elsif(ps = C and X = '0') then
        
        Z1 <= '0';
        Z2 <= '0';
        ns<= B;
    elsif(ps = B and X = '1') then
        
        Z1 <= '0';
        Z2 <= '0';
        ns <= B;
    elsif(ps = B and X = '0') then
        
        Z1 <= '0';
        Z2 <= '0';
        ns <= D;
    elsif(ps = D and X = '1') then
        
        Z1 <= '0';
        Z2 <= '0';
        ns <= B;
    elsif(ps = D and X = '0') then
        
        Z1 <= '1';
        Z2 <= '1';
        ns <= A;
   end if;
end process;    
with PS select
Y <= "00" when A,
"01" when B,
"10" when C,
"11" when D,
"00" when others;
end Behavioral;
