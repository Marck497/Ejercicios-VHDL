library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity puerta_automatica is
port(

    CMD, CLK, RST, FC_ABIERTO, FC_CERRADO, OBST : IN STD_LOGIC;
    M_SUBIR, M_BAJAR                            : OUT STD_LOGIC

    );

end puerta_automatica;

architecture behave OF puerta_automatica is

type state_type is (S0, S1, S2, S3);
signal cs, nxs : state_type;

begin

    process(CLK, RST) begin

        if RST = '0' then --Asincrono a lvl bajo

            cs <= S0;

        else

            if rising_edge(CLK) then

                cs <= nxs;
                
            end if;
            
        end if;

    end process;

    process(cs, CMD, FC_ABIERTO, FC_CERRADO, OBST) begin

        case cs is

            when S0 =>

                M_SUBIR <= '0';
                M_BAJAR <= '0';

                if CMD = '0' then

                    nxs <= S0;

                else

                    nxs <= S1;

                end if;

            when S1 =>

                M_SUBIR <= '1';
                M_BAJAR <= '0';

                if FC_ABIERTO = '0' then

                    nxs <= S1;

                else

                    nxs <= S2;

                end if;

            when S2 =>

                M_SUBIR <= '0';
                M_BAJAR <= '0';

                if CMD = '0' then

                    nxs <= S2;

                else

                    nxs <= S3;

                end if;

            when S3 =>

                M_SUBIR <= '0';
                M_BAJAR <= '1';

                if OBST = '0' then --OBST tiene prioridad sobre FC_CERRADO, si detecta un obstaculo, la puerta debe volver a abrirse

                    if FC_CERRADO = '1' then
                        
                        nxs <= S0;

                    else

                        nxs <= S3;
                    
                    end if;

                else

                    nxs <= S1;

                end if;

            end case;

    end process;

end behave;