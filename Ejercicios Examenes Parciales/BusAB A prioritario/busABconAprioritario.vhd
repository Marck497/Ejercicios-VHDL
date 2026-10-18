library IEEE;
use IEEE.std_logic_1164.all;

entity maquinaEstadoBusAB is 
port(

    RST, CLK : in std_logic;
    reqAB : in std_logic_vector(1 downto 0); 
    grantAB : out std_logic_vector(1 downto 0);
    Busy    : out std_logic

    );
end entity;

architecture behave of maquinaEstadoBusAB is

type state_type is(IDLE, Busy_A, Busy_B);
signal cs, nxs : state_type;

begin

    process(CLK, RST) begin

        if rising_edge(CLK) then

            if RST = '0' then

                cs <= IDLE;

            else

                cs <= nxs;

            end if;

        end if;

    end process;

    process(cs, reqAB) begin

        case cs is

            when IDLE =>

                Busy <= '0';

                if reqAB(1) = '1' then

                    grantAB <= "10";
                    nxs <= Busy_A;

                elsif reqAB = "01" then

                    grantAB <= "01";
                    nxs <= Busy_B;

                else

                    grantAB <= "00";
                    nxs <= IDLE;

                end if;

            when Busy_A =>

                Busy <= '1';

                if reqAB(1) = '1' then

                    grantAB <= "10";
                    nxs <= Busy_A;

                elsif reqAB = "01" then

                    grantAB <= "01";
                    nxs <= Busy_B;

                else

                    grantAB <= "00";
                    nxs <= IDLE;

                end if;

            when Busy_B =>

                Busy <= '1';

                if reqAB(1) = '1' then

                    grantAB <= "10";
                    nxs <= Busy_A;

                elsif reqAB = "01" then

                    grantAB <= "01";
                    nxs <= Busy_B;

                else

                    grantAB <= "00";
                    nxs <= IDLE;

                end if;

            when others =>

                    grantAB <= "00";
                    nxs <= IDLE;

            end case;
    
    end process;

end behave;