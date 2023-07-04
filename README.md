# asm
*homework

After a few weeks of break, the Formula 1 engineering teams have returned to work. Being very pleased with your previous work, they want you to help them once again.

Task 1 - Simple cipher

The chief engineer at Ferrari needs to transmit encrypted messages to other teammates in order to obtain information about the car. He wants to use a simple cipher to transmit the messages.

This encryption algorithm involves shifting each character to the right within the alphabet a certain number of times. For example, the text "ANABANANA" transforms into "BOBCBOBOB" when the step is 1. Thus, encryption with a step of 26 does not change the letter, as the English alphabet has 26 characters.

For this task, you will need to implement the function simple() in the file simple.asm, which encrypts a string using the method described above.

The function's header is:

void simple(int n, char* plain, char* enc_string, int step)

The meaning of the arguments is:

n - the size of the text

plain - the string to be encrypted

enc_string - the address where the encrypted text will be written

step - the amount by which each character is shifted

For simplicity, only uppercase letters of the English alphabet (A-Z) will be used, and the shifting will be strictly within the English alphabet with a limit of 26 for the step.

Task 4 - Checkers 

Because the mechanics at McLaren are getting bored in the garage, they have decided to play checkers instead of UNO this time.

We want to simulate the game of checkers. We have an 8×8 matrix representing the game board. Given the position of a checker piece on the game board, we want to calculate the new positions it can reach.

For this task, you need to implement the function checkers in the file checkers.asm. The function's header is as follows:

void checkers(int x, int y, char table[8][8])
where:

x - the row where the piece is located for which we want to calculate the positions

y - the column where the piece is located for which we want to calculate the positions

table - the game board where the reachable positions for the game piece will be placed.

There will be no collisions between the game pieces. We assume that there is only one piece on the game board.

The pieces cannot go beyond the boundaries of the game board.
