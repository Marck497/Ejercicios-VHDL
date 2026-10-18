library IEEE;
use IEEE.std_logic_1164.all;

entity maquinaEstadoBusAB is
end entity;

architecture testbench of maquinaEstadoBusAB is

    component maquinaEstado is 
    port(

        RST, CLK : in std_logic;
        reqAB : in std_logic_vector(1 downto 0); 
        grantAB : out std_logic_vector(1 downto 0);
        Busy    : out std_logic

        );

    end component;

    signal RST, CLK, Busy : std_logic := '0';
    signal reqAB, grantAB : std_logic_vector(1 downto 0) := "00";
    
    constant clk_p : time := 20 ns;

    begin

        UUT: maquinaEstado port map(

            RST => RST,
            CLK => CLK,
            reqAB => reqAB,
            grantAB => grantAB,
            Busy => Busy

        );

        process begin

            CLK <= '0';
            wait for clk_p/2;
            CLK <= '1';
            wait for clk_p/2;

        end process;

        process begin

            RST <= '0'; 
            wait for clk_p;
            RST <= '1'; 
            wait;

        process begin

            reqAB <= "00";
            wait for clk_p*2;
            reqAB <= "10";
            wait for clk_p*2;
            reqAB <= "01";
            wait for clk_p*2;
            reqAB <= "11";
            wait for clk_p;
            reqAB <= "00";
            wait;

        end process;

end testbench;