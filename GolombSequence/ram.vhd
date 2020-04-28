library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ram is
port(clk, wr : in std_logic;
i : in std_logic_vector(3 downto 0);
y : out std_logic_vector(7 downto 0));
end ram;
architecture rtl of ram is
type ram_type is array (0 to 15) of
std_logic_vector(7 downto 0);
signal program: ram_type:= (others => "00000001"); 
component sub is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component minus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component plus1 is
    port (a : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
signal iminus1, iminusdp : std_logic_vector(3 downto 0);
signal dp0, dp1, dp2, add : std_logic_vector(7 downto 0);

begin
    u1 : sub port map (i, dp1(3 downto 0), iminusdp);
    u2 : minus1 port map (i, iminus1);
    u3 : plus1 port map (dp2, add);
    dp0 <= program(conv_integer(unsigned(iminus1)));
    dp1 <= program(conv_integer(unsigned(dp0(3 downto 0))));
    dp2 <= program(conv_integer(unsigned(iminusdp(3 downto 0))));
process(clk)
begin
if (rising_edge(clk)) then
if (wr = '1') then
program(conv_integer(unsigned(i))) <=  add;
end if;
end if;
end process;
y <= program(conv_integer(unsigned(iminus1)));
end rtl;
