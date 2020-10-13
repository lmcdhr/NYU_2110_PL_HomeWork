with text_io;
use text_io;

package Msort is

    -- set LEGNTH, the length of array to 40
    -- array_value: the value should be between -300 and 300
    -- array_to_sort: the array type
    LENGTH: constant integer := 40;
    type array_value is range -300 .. 300;
    type array_to_sort is array (1 .. LENGTH) of array_value;

    -- the mergesort procedure
    procedure Sort(A : in out array_to_sort; LENGTH : in integer);

end Msort;
