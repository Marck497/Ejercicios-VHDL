library IEEE;
use IEEE.std_logic_1164.all;

entity flip_flop_XOR is
port(

    RST, CLK : in std_logic;
    DATA_IN  : in std_logic_vector(1 downto 0);
    DATA_OUT : out std_logic_vector(1 downto 0)

    );
end flip_flop_XOR;

architecture behave of flip_flop_XOR is

signal Q1, Q2 : std_logic;

begin

    process(CLK, RST) begin

        if RST = '0' then

            Q1 <= '0';
            Q2 <= '0';

        else

            if rising_edge(CLK) then

                Q1 <= DATA_IN(0);
                Q2 <= Q1;
            
            end if;

        end if;

    end process;

    DATA_OUT <= Q1 & (Q2 XOR DATA_IN(1));

end behave;