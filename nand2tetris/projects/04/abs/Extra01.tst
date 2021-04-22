load Extra01.hack,
output-file Extra01.out,
compare-to Extra01.cmp,
output-list RAM[0]%D2.6.2 RAM[1]%D2.6.2;

set RAM[0] 0,
set RAM[1] -1;
repeat 20{
    ticktock;
}
set RAM[0] 0,
output;

set PC 0,
set RAM[0] 3,
set RAM[1] -1,
repeat 20{
    ticktock;
}
set RAM[0] 3,
output;

set PC 0,
set RAM[0] 1000,
set RAM[1] -1,
repeat 20{
    ticktock;
}
set RAM[0] 1000,
output;


set PC 0,
set RAM[0] -8,
set RAM[1] -1,
repeat 20{
    ticktock;
}
set RAM[0] -8,
output;
