----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/14/2019 04:31:53 AM
-- Design Name: 
-- Module Name: question13 - Behavioral
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

entity question13 is
--  Port ( );
Port(
    clk : in std_logic;
    CS, RD : out std_logic;
    X1, X2 : in std_logic;
    Y : out std_logic_vector(2 downto 0) 
);
end question13;

architecture Behavioral of question13 is
type state_type is (A,B,C);
attribute ENUM_ENCODING: STRING;
attribute ENUM_ENCODING of state_type: type
is "001 010 100";
signal ps,ns : state_type;
begin

process(clk)
begin
    if(rising_edge(clk)) then
       ps <= ns;
    end if;
end process;


process(X1, X2, ps)
begin
    if (ps = A and X1 = '0') then
        ns <= B;
        CS <= '0';
        RD <= '1';
    elsif(ps = B) then
        ns <= C;
        CS <= '1';
        RD <= '1';
    elsif(ps = C and X2 = '0')then
        ns <= A;
        CS <= '0';
        RD <= '0';
    elsif(ps = C and X2 = '1') then
        ns <= C;
        CS <= '0';
        RD <= '0';
    elsif(ps =A and X1 = '1') then
        ns <= C;
        CS <= '1';
        RD <= '0';
    end if;
end process;
         
with PS select
Y <= "001" when A,
     "010" when B,
     "100" when C,   
     "001" when others;
     
end Behavioral;
