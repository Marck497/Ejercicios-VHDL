library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_1 is
port(

    A, B, C, D, EN : in std_logic;
    SEL            : in std_logic_vector(1 downto 0);
    Y              : out std_logic

    );
end mux4_1;

architecture behavior of mux4_1 is
begin

    process(A,B,C,D,SEL,EN)
    begin

        if EN = '1' then 

            case SEL is

                when "00" => 
                    Y <= A;
                when "01" =>
                    Y <= B;
                when "10" =>
                    Y <= C;
                when "11" =>
                    Y <= D;
                when others =>
                    Y <= '0';

            end case;

        else

            Y <= '0';

        end if;

    end process;

end behavior;