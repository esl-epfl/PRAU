--------------------------------------------------------------------------------
--                        Normalizer_ZO_6_6_6_F50_uid6
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, (2007-2020)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X OZb
-- Output signals: Count R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Normalizer_ZO_6_6_6_F50_uid6 is
    port (clk : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          OZb : in  std_logic;
          Count : out  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of Normalizer_ZO_6_6_6_F50_uid6 is
signal level3 :  std_logic_vector(5 downto 0);
signal sozb :  std_logic;
signal count2 :  std_logic;
signal level2 :  std_logic_vector(5 downto 0);
signal count1 :  std_logic;
signal level1 :  std_logic_vector(5 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(5 downto 0);
signal sCount :  std_logic_vector(2 downto 0);
begin
   level3 <= X ;
   sozb<= OZb;
   count2<= '1' when level3(5 downto 2) = (5 downto 2=>sozb) else '0';
   level2<= level3(5 downto 0) when count2='0' else level3(1 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(5 downto 4) = (5 downto 4=>sozb) else '0';
   level1<= level2(5 downto 0) when count1='0' else level2(3 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(5 downto 5) = (5 downto 5=>sozb) else '0';
   level0<= level1(5 downto 0) when count0='0' else level1(4 downto 0) & (0 downto 0 => '0');

   R <= level0;
   sCount <= count2 & count1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                       PositFastDecoder_8_2_F50_uid4
-- Version: 2023.04.19 - 130639
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Raul Murillo (2021-2022)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X
-- Output signals: Sign SF Frac NZN

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity PositFastDecoder_8_2_F50_uid4 is
    port (clk : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          Sign : out  std_logic;
          SF : out  std_logic_vector(5 downto 0);
          Frac : out  std_logic_vector(2 downto 0);
          NZN : out  std_logic   );
end entity;

architecture arch of PositFastDecoder_8_2_F50_uid4 is
   component Normalizer_ZO_6_6_6_F50_uid6 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             OZb : in  std_logic;
             Count : out  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(5 downto 0)   );
   end component;

signal sgn :  std_logic;
signal pNZN :  std_logic;
signal rc :  std_logic;
signal regPosit :  std_logic_vector(5 downto 0);
signal regLength :  std_logic_vector(2 downto 0);
signal shiftedPosit :  std_logic_vector(5 downto 0);
signal k :  std_logic_vector(3 downto 0);
signal sgnVect :  std_logic_vector(1 downto 0);
signal exp :  std_logic_vector(1 downto 0);
signal pSF :  std_logic_vector(5 downto 0);
signal pFrac :  std_logic_vector(2 downto 0);
begin
--------------------------- Start of vhdl generation ---------------------------
--------------------------- Sign bit & special cases ---------------------------
   sgn <= X(7);
   pNZN <= '0' when (X(6 downto 0) = "0000000") else '1';
-------------- Count leading zeros/ones of regime & shift it out --------------
   rc <= X(6);
   regPosit <= X(5 downto 0);
   RegimeCounter: Normalizer_ZO_6_6_6_F50_uid6
      port map ( clk  => clk,
                 OZb => rc,
                 X => regPosit,
                 Count => regLength,
                 R => shiftedPosit);
----------------- Determine the scaling factor - regime & exp -----------------
   k <= "0" & regLength when rc /= sgn else "1" & NOT(regLength);
   sgnVect <= (others => sgn);
   exp <= shiftedPosit(4 downto 3) XOR sgnVect;
   pSF <= k & exp;
------------------------------- Extract fraction -------------------------------
   pFrac <= shiftedPosit(2 downto 0);
   Sign <= sgn;
   SF <= pSF;
   Frac <= pFrac;
   NZN <= pNZN;
---------------------------- End of vhdl generation ----------------------------
end architecture;

--------------------------------------------------------------------------------
--                       Normalizer_ZO_6_6_6_F50_uid10
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, (2007-2020)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X OZb
-- Output signals: Count R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Normalizer_ZO_6_6_6_F50_uid10 is
    port (clk : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          OZb : in  std_logic;
          Count : out  std_logic_vector(2 downto 0);
          R : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of Normalizer_ZO_6_6_6_F50_uid10 is
signal level3 :  std_logic_vector(5 downto 0);
signal sozb :  std_logic;
signal count2 :  std_logic;
signal level2 :  std_logic_vector(5 downto 0);
signal count1 :  std_logic;
signal level1 :  std_logic_vector(5 downto 0);
signal count0 :  std_logic;
signal level0 :  std_logic_vector(5 downto 0);
signal sCount :  std_logic_vector(2 downto 0);
begin
   level3 <= X ;
   sozb<= OZb;
   count2<= '1' when level3(5 downto 2) = (5 downto 2=>sozb) else '0';
   level2<= level3(5 downto 0) when count2='0' else level3(1 downto 0) & (3 downto 0 => '0');

   count1<= '1' when level2(5 downto 4) = (5 downto 4=>sozb) else '0';
   level1<= level2(5 downto 0) when count1='0' else level2(3 downto 0) & (1 downto 0 => '0');

   count0<= '1' when level1(5 downto 5) = (5 downto 5=>sozb) else '0';
   level0<= level1(5 downto 0) when count0='0' else level1(4 downto 0) & (0 downto 0 => '0');

   R <= level0;
   sCount <= count2 & count1 & count0;
   Count <= sCount;
end architecture;

--------------------------------------------------------------------------------
--                       PositFastDecoder_8_2_F50_uid8
-- Version: 2023.04.19 - 130639
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Raul Murillo (2021-2022)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X
-- Output signals: Sign SF Frac NZN

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity PositFastDecoder_8_2_F50_uid8 is
    port (clk : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          Sign : out  std_logic;
          SF : out  std_logic_vector(5 downto 0);
          Frac : out  std_logic_vector(2 downto 0);
          NZN : out  std_logic   );
end entity;

architecture arch of PositFastDecoder_8_2_F50_uid8 is
   component Normalizer_ZO_6_6_6_F50_uid10 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             OZb : in  std_logic;
             Count : out  std_logic_vector(2 downto 0);
             R : out  std_logic_vector(5 downto 0)   );
   end component;

signal sgn :  std_logic;
signal pNZN :  std_logic;
signal rc :  std_logic;
signal regPosit :  std_logic_vector(5 downto 0);
signal regLength :  std_logic_vector(2 downto 0);
signal shiftedPosit :  std_logic_vector(5 downto 0);
signal k :  std_logic_vector(3 downto 0);
signal sgnVect :  std_logic_vector(1 downto 0);
signal exp :  std_logic_vector(1 downto 0);
signal pSF :  std_logic_vector(5 downto 0);
signal pFrac :  std_logic_vector(2 downto 0);
begin
--------------------------- Start of vhdl generation ---------------------------
--------------------------- Sign bit & special cases ---------------------------
   sgn <= X(7);
   pNZN <= '0' when (X(6 downto 0) = "0000000") else '1';
-------------- Count leading zeros/ones of regime & shift it out --------------
   rc <= X(6);
   regPosit <= X(5 downto 0);
   RegimeCounter: Normalizer_ZO_6_6_6_F50_uid10
      port map ( clk  => clk,
                 OZb => rc,
                 X => regPosit,
                 Count => regLength,
                 R => shiftedPosit);
----------------- Determine the scaling factor - regime & exp -----------------
   k <= "0" & regLength when rc /= sgn else "1" & NOT(regLength);
   sgnVect <= (others => sgn);
   exp <= shiftedPosit(4 downto 3) XOR sgnVect;
   pSF <= k & exp;
------------------------------- Extract fraction -------------------------------
   pFrac <= shiftedPosit(2 downto 0);
   Sign <= sgn;
   SF <= pSF;
   Frac <= pFrac;
   NZN <= pNZN;
---------------------------- End of vhdl generation ----------------------------
end architecture;

--------------------------------------------------------------------------------
--                           DSPBlock_5x5_F50_uid16
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: 
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity DSPBlock_5x5_F50_uid16 is
    port (clk : in std_logic;
          X : in  std_logic_vector(4 downto 0);
          Y : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(9 downto 0)   );
end entity;

architecture arch of DSPBlock_5x5_F50_uid16 is
signal Mint :  std_logic_vector(9 downto 0);
signal M :  std_logic_vector(9 downto 0);
signal Rtmp :  std_logic_vector(9 downto 0);
begin
   Mint <= std_logic_vector(signed(X) * signed(Y)); -- multiplier
   M <= Mint(9 downto 0);
   Rtmp <= M;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                          IntMultiplier_F50_uid12
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Martin Kumm, Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X Y
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity IntMultiplier_F50_uid12 is
    port (clk : in std_logic;
          X : in  std_logic_vector(4 downto 0);
          Y : in  std_logic_vector(4 downto 0);
          R : out  std_logic_vector(9 downto 0)   );
end entity;

architecture arch of IntMultiplier_F50_uid12 is
   component DSPBlock_5x5_F50_uid16 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(4 downto 0);
             Y : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(9 downto 0)   );
   end component;

signal XX_m13 :  std_logic_vector(4 downto 0);
signal YY_m13 :  std_logic_vector(4 downto 0);
signal tile_0_X :  std_logic_vector(4 downto 0);
signal tile_0_Y :  std_logic_vector(4 downto 0);
signal tile_0_output :  std_logic_vector(9 downto 0);
signal tile_0_filtered_output :  signed(9-0 downto 0);
signal bh14_w0_0 :  std_logic;
signal bh14_w1_0 :  std_logic;
signal bh14_w2_0 :  std_logic;
signal bh14_w3_0 :  std_logic;
signal bh14_w4_0 :  std_logic;
signal bh14_w5_0 :  std_logic;
signal bh14_w6_0 :  std_logic;
signal bh14_w7_0 :  std_logic;
signal bh14_w8_0 :  std_logic;
signal bh14_w9_0 :  std_logic;
signal tmp_bitheapResult_bh14_9 :  std_logic_vector(9 downto 0);
signal bitheapResult_bh14 :  std_logic_vector(9 downto 0);
begin
   XX_m13 <= X ;
   YY_m13 <= Y ;
   tile_0_X <= X(4 downto 0);
   tile_0_Y <= Y(4 downto 0);
   tile_0_mult: DSPBlock_5x5_F50_uid16
      port map ( clk  => clk,
                 X => tile_0_X,
                 Y => tile_0_Y,
                 R => tile_0_output);

   tile_0_filtered_output <= signed(tile_0_output(9 downto 0));
   bh14_w0_0 <= tile_0_filtered_output(0);
   bh14_w1_0 <= tile_0_filtered_output(1);
   bh14_w2_0 <= tile_0_filtered_output(2);
   bh14_w3_0 <= tile_0_filtered_output(3);
   bh14_w4_0 <= tile_0_filtered_output(4);
   bh14_w5_0 <= tile_0_filtered_output(5);
   bh14_w6_0 <= tile_0_filtered_output(6);
   bh14_w7_0 <= tile_0_filtered_output(7);
   bh14_w8_0 <= tile_0_filtered_output(8);
   bh14_w9_0 <= tile_0_filtered_output(9);

   -- Adding the constant bits 
      -- All the constant bits are zero, nothing to add

   tmp_bitheapResult_bh14_9 <= bh14_w9_0 & bh14_w8_0 & bh14_w7_0 & bh14_w6_0 & bh14_w5_0 & bh14_w4_0 & bh14_w3_0 & bh14_w2_0 & bh14_w1_0 & bh14_w0_0;
   bitheapResult_bh14 <= tmp_bitheapResult_bh14_9;
   R <= bitheapResult_bh14(9 downto 0);
end architecture;

--------------------------------------------------------------------------------
--                            IntAdder_7_F50_uid19
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_7_F50_uid19 is
    port (clk : in std_logic;
          X : in  std_logic_vector(6 downto 0);
          Y : in  std_logic_vector(6 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(6 downto 0)   );
end entity;

architecture arch of IntAdder_7_F50_uid19 is
signal Rtmp :  std_logic_vector(6 downto 0);
begin
   Rtmp <= X + Y + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                            IntAdder_7_F50_uid22
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_7_F50_uid22 is
    port (clk : in std_logic;
          X : in  std_logic_vector(6 downto 0);
          Y : in  std_logic_vector(6 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(6 downto 0)   );
end entity;

architecture arch of IntAdder_7_F50_uid22 is
signal Rtmp :  std_logic_vector(6 downto 0);
begin
   Rtmp <= X + Y + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                            IntAdder_6_F50_uid24
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_6_F50_uid24 is
    port (clk : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          Y : in  std_logic_vector(5 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of IntAdder_6_F50_uid24 is
signal Rtmp :  std_logic_vector(5 downto 0);
begin
   Rtmp <= X + Y + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                     RightShifter56_by_max_48_F50_uid26
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca (2008-2011), Florent de Dinechin (2008-2019)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X S padBit
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity RightShifter56_by_max_48_F50_uid26 is
    port (clk : in std_logic;
          X : in  std_logic_vector(55 downto 0);
          S : in  std_logic_vector(5 downto 0);
          padBit : in  std_logic;
          R : out  std_logic_vector(55 downto 0)   );
end entity;

architecture arch of RightShifter56_by_max_48_F50_uid26 is
signal ps :  std_logic_vector(5 downto 0);
signal level0 :  std_logic_vector(55 downto 0);
signal level1 :  std_logic_vector(56 downto 0);
signal level2 :  std_logic_vector(58 downto 0);
signal level3 :  std_logic_vector(62 downto 0);
signal level4 :  std_logic_vector(70 downto 0);
signal level5 :  std_logic_vector(86 downto 0);
signal level6 :  std_logic_vector(118 downto 0);
begin
   ps<= S;
   level0<= X;
   level1 <=  (0 downto 0 => padBit) & level0 when ps(0) = '1' else    level0 & (0 downto 0 => '0');
   level2 <=  (1 downto 0 => padBit) & level1 when ps(1) = '1' else    level1 & (1 downto 0 => '0');
   level3 <=  (3 downto 0 => padBit) & level2 when ps(2) = '1' else    level2 & (3 downto 0 => '0');
   level4 <=  (7 downto 0 => padBit) & level3 when ps(3) = '1' else    level3 & (7 downto 0 => '0');
   level5 <=  (15 downto 0 => padBit) & level4 when ps(4) = '1' else    level4 & (15 downto 0 => '0');
   level6 <=  (31 downto 0 => padBit) & level5 when ps(5) = '1' else    level5 & (31 downto 0 => '0');
   R <= level6(118 downto 63);
end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_128_F50_uid28
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2016)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: X Y Cin
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_128_F50_uid28 is
    port (clk : in std_logic;
          X : in  std_logic_vector(127 downto 0);
          Y : in  std_logic_vector(127 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(127 downto 0)   );
end entity;

architecture arch of IntAdder_128_F50_uid28 is
signal Rtmp :  std_logic_vector(127 downto 0);
begin
   Rtmp <= X + Y + Cin;
   R <= Rtmp;
end architecture;

--------------------------------------------------------------------------------
--                                  PositMAC
--                     (PositMAC_8_2_Quire_128_F50_uid2)
-- Version: 2023.04.19 - 130639
-- Inputs: this FMA computes A*B+C
-- VHDL generated for Kintex7 @ 50MHz
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Raul Murillo (2021-2022)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles
-- Clock period (ns): 20
-- Target frequency (MHz): 50
-- Input signals: A B C
-- Output signals: R

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity PositMAC is
    port (clk : in std_logic;
          A : in  std_logic_vector(7 downto 0);
          B : in  std_logic_vector(7 downto 0);
          C : in  std_logic_vector(127 downto 0);
          R : out  std_logic_vector(127 downto 0)   );
end entity;

architecture arch of PositMAC is
   component PositFastDecoder_8_2_F50_uid4 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(7 downto 0);
             Sign : out  std_logic;
             SF : out  std_logic_vector(5 downto 0);
             Frac : out  std_logic_vector(2 downto 0);
             NZN : out  std_logic   );
   end component;

   component PositFastDecoder_8_2_F50_uid8 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(7 downto 0);
             Sign : out  std_logic;
             SF : out  std_logic_vector(5 downto 0);
             Frac : out  std_logic_vector(2 downto 0);
             NZN : out  std_logic   );
   end component;

   component IntMultiplier_F50_uid12 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(4 downto 0);
             Y : in  std_logic_vector(4 downto 0);
             R : out  std_logic_vector(9 downto 0)   );
   end component;

   component IntAdder_7_F50_uid19 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(6 downto 0);
             Y : in  std_logic_vector(6 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(6 downto 0)   );
   end component;

   component IntAdder_7_F50_uid22 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(6 downto 0);
             Y : in  std_logic_vector(6 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(6 downto 0)   );
   end component;

   component IntAdder_6_F50_uid24 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             Y : in  std_logic_vector(5 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(5 downto 0)   );
   end component;

   component RightShifter56_by_max_48_F50_uid26 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(55 downto 0);
             S : in  std_logic_vector(5 downto 0);
             padBit : in  std_logic;
             R : out  std_logic_vector(55 downto 0)   );
   end component;

   component IntAdder_128_F50_uid28 is
      port ( clk : in std_logic;
             X : in  std_logic_vector(127 downto 0);
             Y : in  std_logic_vector(127 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(127 downto 0)   );
   end component;

signal A_sgn :  std_logic;
signal A_sf :  std_logic_vector(5 downto 0);
signal A_f :  std_logic_vector(2 downto 0);
signal A_nzn :  std_logic;
signal B_sgn :  std_logic;
signal B_sf :  std_logic_vector(5 downto 0);
signal B_f :  std_logic_vector(2 downto 0);
signal B_nzn :  std_logic;
signal AB_nzn :  std_logic;
signal AB_nar :  std_logic;
signal AA_f :  std_logic_vector(4 downto 0);
signal BB_f :  std_logic_vector(4 downto 0);
signal AB_f :  std_logic_vector(9 downto 0);
signal AB_sgn :  std_logic;
signal AB_ovfExtra :  std_logic;
signal AB_ovf :  std_logic;
signal AB_normF :  std_logic_vector(6 downto 0);
signal AA_sf :  std_logic_vector(6 downto 0);
signal BB_sf :  std_logic_vector(6 downto 0);
signal AB_sf_tmp :  std_logic_vector(6 downto 0);
signal AB_sf :  std_logic_vector(6 downto 0);
signal neg_sf :  std_logic;
signal AB_effectiveSF :  std_logic_vector(5 downto 0);
signal adderInput :  std_logic_vector(5 downto 0);
signal adderBias :  std_logic_vector(5 downto 0);
signal ob :  std_logic;
signal AB_sfBiased :  std_logic_vector(5 downto 0);
signal paddedFrac :  std_logic_vector(55 downto 0);
signal fixedPosit :  std_logic_vector(55 downto 0);
signal quirePosit :  std_logic_vector(96 downto 0);
signal AB_quire :  std_logic_vector(127 downto 0);
signal zb :  std_logic;
signal ABC_add :  std_logic_vector(127 downto 0);
signal zeros :  std_logic_vector(126 downto 0);
signal C_nar :  std_logic;
signal ABC_nar :  std_logic;
signal result, result_d1 :  std_logic_vector(127 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            result_d1 <=  result;
         end if;
      end process;
--------------------------- Start of vhdl generation ---------------------------
---------------------------- Decode A & B operands ----------------------------
   A_decoder: PositFastDecoder_8_2_F50_uid4
      port map ( clk  => clk,
                 X => A,
                 Frac => A_f,
                 NZN => A_nzn,
                 SF => A_sf,
                 Sign => A_sgn);
   B_decoder: PositFastDecoder_8_2_F50_uid8
      port map ( clk  => clk,
                 X => B,
                 Frac => B_f,
                 NZN => B_nzn,
                 SF => B_sf,
                 Sign => B_sgn);
-------------------------------- Multiply A & B --------------------------------
   -- Sign and Special Cases Computation
   AB_nzn <= A_nzn AND B_nzn;
   AB_nar <= (A_sgn AND NOT(A_nzn)) OR (B_sgn AND NOT(B_nzn));
   -- Multiply the fractions
   AA_f <= A_sgn & NOT(A_sgn) & A_f;
   BB_f <= B_sgn & NOT(B_sgn) & B_f;
   FracMultiplier: IntMultiplier_F50_uid12
      port map ( clk  => clk,
                 X => AA_f,
                 Y => BB_f,
                 R => AB_f);
   AB_sgn <= AB_f(9);
   AB_ovfExtra <= NOT(AB_sgn) AND AB_f(8);
   AB_ovf <= AB_ovfExtra OR (AB_sgn XOR AB_f(7));
   AB_normF <= AB_f(6 downto 0) when AB_ovf = '1' else (AB_f(5 downto 0) & '0');
   -- Add the exponent values
   AA_sf <= A_sf(A_sf'high) & A_sf;
   BB_sf <= B_sf(B_sf'high) & B_sf;
   SFAdder: IntAdder_7_F50_uid19
      port map ( clk  => clk,
                 Cin => AB_ovfExtra,
                 X => AA_sf,
                 Y => BB_sf,
                 R => AB_sf_tmp);
   RoundingAdder: IntAdder_7_F50_uid22
      port map ( clk  => clk,
                 Cin => AB_ovf,
                 X => AB_sf_tmp,
                 Y => "0000000",
                 R => AB_sf);
-------------- Shift AB fraction into corresponding quire format --------------
   neg_sf <= AB_sf(6);
   AB_effectiveSF <= AB_sf(5 downto 0);
   adderInput <= NOT(AB_effectiveSF);
   adderBias <= "110000" when neg_sf='0' else "111111";
   ob <= '1';
   BiasedSFAdder: IntAdder_6_F50_uid24
      port map ( clk  => clk,
                 Cin => ob,
                 X => adderInput,
                 Y => adderBias,
                 R => AB_sfBiased);
   paddedFrac <= (NOT(AB_sgn) & AB_normF & "000000000000000000000000000000000000000000000000") when neg_sf='0' else ((55 downto 48 => AB_sgn) & NOT(AB_sgn) & AB_normF & "0000000000000000000000000000000000000000");
   Frac_RightShifter: RightShifter56_by_max_48_F50_uid26
      port map ( clk  => clk,
                 S => AB_sfBiased,
                 X => paddedFrac,
                 padBit => AB_sgn,
                 R => fixedPosit);
   quirePosit <= (fixedPosit & "00000000000000000000000000000000000000000") when neg_sf='0' else ((96 downto 56 => AB_sgn) & fixedPosit);
   AB_quire <= ((127 downto 97 => AB_sgn) & quirePosit) when AB_nzn='1' else AB_nar & (126 downto 0 => '0');
---------------------------------- Add quires ----------------------------------
   zb <= '0';
   QuireAdder: IntAdder_128_F50_uid28
      port map ( clk  => clk,
                 Cin => zb,
                 X => AB_quire,
                 Y => C,
                 R => ABC_add);
   zeros <= (others => '0');
   C_nar <= C(127) when (C(126 downto 0) = zeros) else '0';
   ABC_nar <= AB_nar OR C_nar;
   result <= ABC_add when ABC_nar='0' else ('1' & zeros);
   R <= result_d1;
---------------------------- End of vhdl generation ----------------------------
end architecture;

