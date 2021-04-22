load Extra03.hack,
output-file Extra02.out,
compare-to Extra03.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2 RAM[2]%D2.6.2;

set RAM[0] 10,   // Set test arguments
set RAM[1] 5,
set RAM[2] -1;  // Test that program initialized product to 0
set RAM[10] 2,
set RAM[11] 5,
set RAM[12] 6,
set RAM[13] 8,
set RAM[14] 0,
repeat 80 {
  ticktock;
}
set RAM[0] 10,   // Restore arguments in case program used them as loop counter
set RAM[1] 5,
output;

set PC 0;
set RAM[0] 12,   // Set test arguments
set RAM[1] 5,
set RAM[2] -1;  // Test that program initialized product to 0
set RAM[12] 2,
set RAM[13] 5,
set RAM[14] 1,
set RAM[15] 2,
set RAM[16] 9,
repeat 80 {
  ticktock;
}
set RAM[0] 12,   // Restore arguments in case program used them as loop counter
set RAM[1] 5,
output;

set PC 0,
set RAM[0] 20,   // Set test arguments
set RAM[1] 1,
set RAM[2] -1;  // Test that program initialized product to 0
set RAM[20] 18,
repeat 20 {
  ticktock;
}
set RAM[0] 20,   // Restore arguments in case program used them as loop counter
set RAM[1] 1,
output;

set PC 0,
set RAM[0] 25,   // Set test arguments
set RAM[1] 7,
set RAM[2] -1;  // Test that program initialized product to 0
set RAM[25] 2,
set RAM[26] -5,
set RAM[27] -15,
set RAM[28] 0,
set RAM[29] 8,
set RAM[30] 1,
set RAM[31] -8,
repeat 80 {
  ticktock;
}
set RAM[0] 25,   // Restore arguments in case program used them as loop counter
set RAM[1] 7,
output;

