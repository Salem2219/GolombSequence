library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port(clk, rst, ld, sel : in std_logic;
    n : in std_logic_vector(3 downto 0);
    x : out std_logic;
    y : out std_logic_vector(7 downto 0));
end dp;

architecture rtl of dp is
component comp is
    port (
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;

component mux4 is
    port (s : in std_logic;
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;

component reg4 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end component;


component ram is
port(clk, wr : in std_logic;
i : in std_logic_vector(3 downto 0);
y : out std_logic_vector(7 downto 0));
end component;
component plus1 is
    port (a : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
signal i, i_in : std_logic_vector(3 downto 0);
signal iplus1, i2 : std_logic_vector(7 downto 0);
begin
    i2 <= "0000" & i;
    i_reg : reg4 port map (clk, rst, ld, i_in, i);
    i_mux : mux4 port map (sel, "0010", iplus1(3 downto 0), i_in);
    i_operation : plus1 port map (i2, iplus1);
    ik_comp : comp port map(i, n, x);
    dp_ram : ram port map (clk, sel, i, y);
end rtl;