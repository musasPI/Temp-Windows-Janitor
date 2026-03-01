# Temp Windows Janitor 32-Bits
**Cleans** files in the **%temp%** and **C:\Windows\Temp** folders

# .EXE flagged as malware
> [!WARNING]
> The execute file (.exe) is **flagged as malware** because the code modifies **Temp files** and using **Shell32.dll** and **User32.dll**.

## Building the Executable
If you want to use the tool, it is recommended to assemble the executable from the source code (.asm) using the **NASM** assembler and the **GoLink** linker.

Assembling: *nasm -f win32 janitor_temp.asm*

Linking: *golink /entry _amanto janitor_temp.obj Shell32.dll User32.dll Kernel32.dll /mix*

## I'm beginner on Assembly Language
Don't worry about code!

Adiós 🐱‍👤


# Temp Windows Janitor 32-Bits 
**Limpa** os arquivos na pasta **%Temp%** e na pasta **C:\Windows\Temp**

# .EXE sinalizado como Malware
> [!WARNING]
> O ficheiro executável (.exe) está sendo **sinalizado como malware** porque ele modifica arquivos **Temporários** e usa **Shell32.dll** e **User32.dll**.

## Montando o Executável
Caso queira utilizar a ferramenta, é recomendado montar (compilar) o executável pelo código-fonte (.asm), utilizando do montador (assembler) **NASM** e o ligador (linker) **GoLink**.

Montar: *nasm -f win32 janitor_temp.asm*

Ligar: *golink /entry _amanto janitor_temp.obj Shell32.dll User32.dll Kernel32.dll /mix*

## Sou novato na Linguagem Assembly!
Não se preocupe por causa da sintaxe do código. (estou saindo do analfabetismo Assembly)

Até Logo🐱‍💻
