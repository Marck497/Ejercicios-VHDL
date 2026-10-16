library IEEE;
use IEEE.std_logic_1164.all;

entity mux4_2 is
port
    (

    A, B, C, D, EN : in std_logic;
    SEL            : in std_logic_vector(1 downto 0);
    Y, YN          : out std_logic

    );
end mux4_2;

architecture behavior of mux4_2 is
signal Y_AUX : std_logic;  -- NO SE PUEDEN LEER SALIDAS, hay que crear un cable auxiliar para poder asignarla luego a las salida negada
begin

    process(EN, SEL, A, B, C, D)
    begin

        if EN = '1' then

            case SEL is

                when "00" =>
                    Y_AUX <= A;
                when "01" =>
                    Y_AUX <= B;
                when "10" =>
                    Y_AUX <= C;
                when "11" =>
                    Y_AUX <= D;
                when others =>
                    Y_AUX <= '0';

            end case;

        else

            Y_AUX <= '0'; 

        end if;
    end process;
    
    YN <= NOT Y_AUX;
    Y <= Y_AUX;

end behavior;

