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
  extern Sleep

  section .data
  box_title db "Temp Janitor",0
  box_message db "W-Wait! The Janitor is looking for his broom",0
  box_message_alt db "The Janitor found the broom and now it's time for a magic clean!",0
  box_message_cancel db "Thats OK! Maybe you are a cockroach",0
  box_message_end db "The Janitor cleaned your temporary files but some files were not cleaned because they are currently running.",0

  app db "cmd",0
  funct db "runas",0
  parm db "/c cd %temp% && erase *.* /s /f /q && rmdir /s /q ; %temp%",0
  param db "/c cd c:\windows\temp && erase *.* /s /f /q && rmdir /s /q ; c:\windows\temp",0
  
  section .code
  global _amanto
 
  _amanto:

   ;call GetUserDefaultUILanguage
   ;cmp eax, 0x0416
   ;je translate_pt
   
  ;###########################
  ;	  Initial Message Box  #
  ;###########################
  push 0x30 ;1
  push box_title
  push box_message
  push 0
  call _MessageBoxA
  
  
  ;##########################
  ;   Second Message Box  #
  ;##########################
  push 0x40 ;1
  push box_title
  push box_message_alt
  push 0
  call _MessageBoxA

  
  ;###########################
  ;	  Clean %temp% files  #
  ;###########################
  madao:
  push 0
  push 0
  push parm
  push app
  push funct
  push 0
  call _ShellExecuteA
  
  
  ;###################################
  ;	  Clean C:\Windows\Temp files  #
  ;###################################
  push 0
  push 0
  push param
  push app
  push funct
  push 0
  call _ShellExecuteA
  

  ;###################
  ;	   1s Delay   #
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
  push 0x40
  push box_title
  push box_message_end
  push 0
  call _MessageBoxA
  ret
