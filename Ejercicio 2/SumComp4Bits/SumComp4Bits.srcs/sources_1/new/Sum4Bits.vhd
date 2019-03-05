library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Adder is
  port (
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    Ci : in std_logic;
    S : out std_logic_vector(3 downto 0);
    Co : out std_logic
    );
end Adder;

architecture FullSum of Adder is
signal i_c0 : std_logic;
signal i_c1 : std_logic;
signal i_c2 : std_logic;
begin

i_c0 <= ((A(0) xor B(0)) and Ci) or (A(0) and B(0));  
i_c1 <= ((A(1) xor B(1)) and i_c0) or (A(1) and B(1));
i_c2 <= ((A(2) xor B(2)) and i_c1) or (A(2) and B(2));
S(0) <= A(0) xor B(0) xor Ci; 
S(1) <= A(1) xor B(1) xor i_c0;
S(2) <= A(2) xor B(2) xor i_c1;
S(3) <= A(3) xor B(3) xor i_c2;
Co <= ((A(3) xor B(3)) and i_c2) or (A(3) and B(3));

end FullSum;


