----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2020 04:40:42 PM
-- Design Name: 
-- Module Name: main - calculator
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
use IEEE.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
  port (clk : in std_logic;
        sw : in std_logic_vector (15 downto 0);
        led : out std_logic_vector (15 downto 0);
        btnC: in std_logic;
        btnU: in std_logic;
        btnD: in std_logic;
        btnL: in std_logic;
        btnR: in std_logic);
  signal val1 : std_logic_vector (7 downto 0);
  signal val2 : std_logic_vector (7 downto 0);
end main;


architecture calculator of main is

begin
  process(clk)
  begin
    if rising_edge(clk) then
      if btnC = '1' then
        led <= (15 downto 0 => '0');
      elsif btnU = '1' then
        val1 <= sw(15 downto 8);
        val2 <= sw(7 downto 0);
        led <= (15 downto 8 => '0') & std_logic_vector(unsigned(val1) + unsigned(val2));
      elsif btnD = '1' then
        val1 <= sw(15 downto 8);
        val2 <= sw(7 downto 0);
        led <= (15 downto 8 => '0') & std_logic_vector(unsigned(val1) - unsigned(val2));
      elsif btnL = '1' then
        val1 <= sw(15 downto 8);
        val2 <= sw(7 downto 0);
        led <= (15 downto 8 => '0') & std_logic_vector(unsigned(val1) / unsigned(val2));
      elsif btnR = '1' then
        val1 <= sw(15 downto 8);
        val2 <= sw(7 downto 0);
        led <= std_logic_vector(unsigned(val1) * unsigned(val2));
      end if;
      
    end if;
  end process;
end calculator;

