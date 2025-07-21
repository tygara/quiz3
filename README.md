# Quiz3: Assembly Language 

## Task
Write an Assembly code that calculates a factorial of a pre-defined number. 
For example, set the variable to any number and then calculate the factorial of a set 
number. Let's say the variable x = 5. The factorial of 5 would be 5x4x3x2x1 = 120. 
The factorial of 6 would be 6x5x4x3x2x1 = 720


### Challenges & Method for solving
This quiz tested several core assembly and programming concepts. The main focus was using 
register arithmetic and looping to build a program that computes a number’s factorial and 
prints it to the console. I reused instructions like jmp, cmp, dec, and xor, along with 
basic arithmetic operations, to control the loop and accumulate the product. The biggest 
challenge was extracting the hundreds, tens, and ones digits for printing. Once I realized 
I could use div by 100 and then by 10 to separate each place value’s quotient and remainder,
it was just a matter of sequencing those divisions correctly. Finally, I converted each 
raw numeric digit to its ASCII equivalent by adding '0' so the buffer held printable 
characters.
