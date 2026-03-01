# Temp Windows Janitor 32-Bits
**Cleans** files in the **%temp%** and **C:\Windows\Temp** folders

## 🚨 Executable flagged as malware
The execute file (.exe) is **flagged as malware** because the code modifies **Temp files** and using **Shell32.dll** and **User32.dll**.

## 🏗️ Building the Executable
If you want to use the tool, it is recommended to assemble the executable from the source code (.asm) using the **NASM** assembler and the **GoLink** linker.

Assembler
```
nasm -f win32 janitor_temp.asm
```
Linker
```
golink /entry _amanto janitor_temp.obj Shell32.dll User32.dll Kernel32.dll /mix
```
Execution
```
janitor_temp.exe
```

### I'm beginner on Assembly Language
Don't worry about code!

Adiós 🐱‍👤


# Temp Windows Janitor 32-Bits 
**Limpa** os arquivos na pasta **%Temp%** e na pasta **C:\Windows\Temp**

## 🚨 Executável sinalizado como Malware
O ficheiro executável (.exe) está sendo **sinalizado como malware** porque ele modifica arquivos **Temporários** e usa **Shell32.dll** e **User32.dll**.

## 🏗️ Montando o Executável
Caso queira utilizar a ferramenta, é recomendado montar (compilar) o executável pelo código-fonte (.asm), utilizando do montador (assembler) **NASM** e o ligador (linker) **GoLink**.

Montador (Assembler)
```
nasm -f win32 janitor_temp.asm
```
Ligador (Linker)
```
golink /entry _amanto janitor_temp.obj Shell32.dll User32.dll Kernel32.dll /mix
```
Execução
```
janitor_temp.exe
```

### Sou novato na Linguagem Assembly!
Não se preocupe por causa da sintaxe do código. (estou saindo do analfabetismo Assembly)

Até Logo🐱‍💻
