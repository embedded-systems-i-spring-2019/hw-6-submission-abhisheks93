----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/13/2019 10:21:04 PM
-- Design Name: 
-- Module Name: question2 - Behavioral
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

entity question2 is
--  Port ( );
Port(
     Z : out std_logic;
     X1,X2 : in std_logic;
     clk : in std_logic;
     Y: out std_logic_vector(1 downto 0));
end question2;

architecture Behavioral of question2 is
type state_type is (A, B, C);
attribute ENUM_ENCODING: STRING;
attribute ENUM_ENCODING of state_type: type is "10 11 01";
signal ps,ns: state_type;
begin
process(clk)
begin
    if (rising_edge(clk)) then
        ps<=ns;
    end if;
end process;

process(ps, X1, X2)
begin
    if(ps = A and X1 = '0') then
        Z <= '0';
        ns<=A;
    elsif (ps = A and X1 = '1') then
        Z <= '0';
        ns <= C;
    elsif (ps = C and X2 = '0') then
        Z <= '1';
        ns <= A;
    elsif (ps = C and X2 = '1') then
        Z <= '0';
        ns <= B;
    elsif (ps = B and X2 = '1') then
        Z<= '0';
        ns <= B;
    elsif (ps = B and X2 = '0') then
        Z <= '1';
        ns <= A;
    end if;
end process;
with ps select
    Y <= "10" when A,
         "01" when C,
         "11" when B,
         "10" when others;
         

end Behavioral;
