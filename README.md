<a id="readme-top"></a>
<div align="center">
  <p align="center">
    <a href="https://github.com/musasPI/Temp-Windows-Janitor/blob/main/README.md"><strong>« EN » | </strong></a>
     <a href="https://github.com/musasPI/Temp-Windows-Janitor/blob/main/LEIAME.md"><strong> « PT »</strong></a>
  </p>
</div>

# Windows Temp Janitor 32-Bits
**Cleans** files and folders in the **%temp%** and **C:\Windows\Temp** folders

## ☢️ False Negative in .exe file
The execute file (.exe) can be **flagged as malware** but it's a **false-negative**

## 🏗️ Building the Executable
If you want to use the tool, it is recommended to assemble the executable from the source code (.asm) using the **NASM** assembler and the **GoLink** linker.

*Assembler*
```
nasm -f win32 wt.asm
```
*Linker*
```
golink /entry _amanto windows-temp-janitor.obj Shell32.dll User32.dll Kernel32.dll /mix && rename wt.exe "WT Janitor.exe"
```
*Execution*
```
"WT Janitor.exe"
```

### I'm beginner on Assembly Language
Don't worry about the code!

Adiós 🐱‍👤

Até Logo🐱‍💻
