;----------------------------------------------------------------------------------------------------|
; Name Program: Janitor Temp									 			    				 	 |
; Author: Pinheiro																             		 |
; Version: 0.25																			  			 |
; Quick Description: Deletes files in the %temp% and c:\windows\temp folders					 	 |
; Used DLL's: User32.dll; Shell32.dll; Kernel32.dll;												 |
;----------------------------------------------------------------------------------------------------|
  
;extern GetUserDefaultUILanguage
extern _MessageBoxA
extern _ShellExecuteA
extern _ExitProcess
extern Sleep

section .data
box_title db "Temp Janitor",0
box_ask db "Do you want to erase temporary files?",0
box_message db "W-Wait! The Janitor is looking for his broom",0
box_message_alt db "The Janitor found the broom and now it's time for a magic clean!",0
box_message_cancel db "Thats OK! Maybe you are a cockroach",0
box_message_end db "The Janitor cleaned your temporary files but some files were not cleaned because they are currently running.",0

shell db "cmd",0
mode db "runas",0
paramone db '/c cd /d %temp% && del /s /q /f *.* && for /d %i in (*) do rmdir /s /q "%i"',0
paramtwo db '/c cd /d %windir%\Temp && del /s /q /f *.* && for /d %i in (*) do rmdir /s /q "%i"',0
  
section .code
global _main
 
_main:

  ;call GetUserDefaultUILanguage
  ;cmp eax, 0x0416
  ;je translate_pt
   
 ;###########################
 ;	 Ask Box                #
 ;###########################
   push 0x34 ;1
   push box_title
   push box_ask
   push 0
   call _MessageBoxA
  
 ;#########################
 ;	  Conditional Block   #
 ;#########################
   cmp eax, 6 ; IDYES = 6 | IDNO = 7
   je cleaning_time ; Jump if EAX Equal 6 to the FUNCTION_Y

 ;##########################
 ;   Cancel Message Box    #
 ;##########################
   push 0x40 
   push box_title
   push box_message_cancel
   push 0
   call _MessageBoxA

   jmp exit_of ; Jump to exit function


cleaning_time:
  ;#########################
  ;   Clean temp files    #
  ;#########################

  ;##########################
  ;   First Message Box    #
  ;##########################
    push 0x40 ;1
    push box_title
    push box_message
    push 0
    call _MessageBoxA

  ;##########################
  ;   Second Message Box   #
  ;##########################
    push 0x40 ;1
    push box_title
    push box_message_alt
    push 0
    call _MessageBoxA

 ;###########################
 ;	  Clean %temp% files   #
 ;###########################
   push 0
   push 0
   push paramone
   push shell
   push mode
   push 0
   call _ShellExecuteA
  
 ;###################################
 ;	  Clean C:\Windows\Temp files  #
 ;###################################
   push 0
   push 0
   push paramtwo
   push shell
   push mode
   push 0
   call _ShellExecuteA
  
 ;###################
 ;	   1s Delay    #
 ;###################
   xor eax, eax
   mov eax, 1000
   push eax
   call Sleep
   ;call GetUserDefaultUILanguage
   ;cmp eax, 0x0416
   ;jmp final_pt
  
 ;#########################
 ;	  Last Message Box   #
 ;#########################
   push 0x30
   push box_title
   push box_message_end
   push 0
   call _MessageBoxA
  

exit_of:
 ;#########################
 ;	  Exit Program       #
 ;#########################
   push 0
   call _ExitProcess
