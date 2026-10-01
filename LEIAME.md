<a id="readme-top"></a>
<div align="center">
  <p align="center">
    <a href="https://github.com/musasPI/Temp-Windows-Janitor/blob/main/README.md"><strong>« ENG »</strong></a>
  </p>
</div>
 
# Windows Temp Janitor 32-Bits 
**Limpa** os arquivos e pastas na pasta **%Temp%** e na pasta **C:\Windows\Temp**

##  Tradução
A  tradução em Português está em reformulação após cenários marcados com falha na exibição de acentos e por esse motivo que a tradução foi removida temporariamente do Temp Windows Janitor.

## ☣️ Detecção de Falso Negativo no arquivo executável
O ficheiro executável (.exe) está sendo **sinalizado como malware** erroneamente e é apenas um caso de **FALSO-NEGATIVO**.

## 🏗️ Montando o Executável
Caso queira utilizar a ferramenta, é recomendado montar (compilar) o executável pelo código-fonte (.asm), utilizando do montador (assembler) **NASM** e o ligador (linker) **GoLink**.

*Montador (Assembler)*
```
nasm -f win32 wt-janitor.asm
```
*Ligador (Linker)*
```
golink /entry _amanto windows-temp-janitor.obj Shell32.dll User32.dll Kernel32.dll /mix && rename wt.exe "WT Janitor.exe"
```
*Execução*
```
"WT.exe"
```

### Sou novato na Linguagem Assembly!
Estou evoluindo na sintaxe do código.
