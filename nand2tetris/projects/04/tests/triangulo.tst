load triangulo.hack,
output-file triangulo.out,
compare-to triangulo.cmp,
output-list RAM[4]%D2.6.2;

set RAM[0] 5,
set RAM[1] 8,
set RAM[2] 10,
set RAM[4] 2;
repeat 200 {
    ticktock;
}
output;

set PC 0,
set RAM[0] 50,
set RAM[1] 8,
set RAM[2] 10,
set RAM[4] 2;
repeat 200 {
    ticktock;
}
output;

set PC 0,
set RAM[0] 3,
set RAM[1] 6,
set RAM[2] 5,
set RAM[4] 2;
repeat 200 {
    ticktock;
}
output;

set PC 0,
set RAM[0] 5,
set RAM[1] 80,
set RAM[2] 10,
set RAM[4] 2;
repeat 200 {
    ticktock;
}
output;

set PC 0,
set RAM[0] 3,
set RAM[1] 4,
set RAM[2] 6,
set RAM[4] 2;
repeat 200 {
    ticktock;
}
output;

set PC 0,
set RAM[0] 5,
set RAM[1] 8,
set RAM[2] 100,
set RAM[4] 2;
repeat 200 {
    ticktock;
}
output;

set PC 0,
set RAM[0] 3,
set RAM[1] 3,
set RAM[2] 6,
set RAM[4] 2;
repeat 200 {
    ticktock;
}
output;

set PC 0,
set RAM[0] 3,
set RAM[1] 3,
set RAM[2] 5,
set RAM[4] 2;
repeat 200 {
    ticktock;
}
output;
