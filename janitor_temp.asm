;----------------------------------------------------------------------------------------------------|
; Name Program: Janitor Temp									 			    				 	 |
; Author: Pinheiro																             		 |
; Version: 0.5																			  			 |
; Quick Description: Deletes files in the %temp% and c:\windows\temp folders					 	 |
; Used DLL's: User32.dll; Shell32.dll; Kernel32.dll;												 |
;----------------------------------------------------------------------------------------------------|
  
  extern GetUserDefaultUILanguage
  extern _MessageBoxA
  extern _ShellExecuteA
  extern Sleep

  section .data
  box_title db "Temp Janitor",0
  box_message db "W-Wait! The Janitor is looking for his broom",0
  box_message_alt db "The Janitor found the broom and now it's time for a magic clean!",0
  box_message_cancel db "Thats OK! Maybe you are a cockroach",0
  box_message_end db "The Janitor cleaned your temporary files but some files were not cleaned because they are currently running.",0
  
  box_message_pt db "Ei-ei espere! O Zelador está em procura da vassoura.",0
  box_message_alt_pt db "O Zelador terminou sua procura e encontrou sua vassoura, agora ele irá voltar ao trabalho!",0
  box_message_cancel_pt db "Éhh tá bom, talvez você seja uma barata ou um ratinho de esgoto",0
  box_message_end_pt db "O Zelador limpou os arquivos temporários, porém nem todos foram limpos porque são necessários para a execução de aplicações!",0
  
  app db "cmd",0
  funct db "runas",0
  parm db "/c cd %temp% && erase *.* /f /s /q ",0
  param db "/c cd c:\windows\temp && erase *.* /f /s /q ",0
  
  section .code
  global _amanto
 
  _amanto:

   call GetUserDefaultUILanguage
   cmp eax, 0x0416
   je translate_pt
   
  ;###########################
  ;	  Initial Message Box  #
  ;###########################
  push 0x30
  push box_title
  push box_message
  push 0
  call _MessageBoxA
  
  
  ;##########################
  ;   Second Message Box  #
  ;##########################
  push 0x40
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
  call GetUserDefaultUILanguage
  cmp eax, 0x0416
  jmp final_pt
  
 
  ;#########################
  ;	  Last Message Box   #
  ;#########################
  push 0x40
  push box_title
  push box_message_end
  push 0
  call _MessageBoxA
  ret
  
  
  ;####################################################################
  ; Translation for Portuguese - Tradução do texto para o Português #
  ;####################################################################
  translate_pt:
  push 0x30
  push box_title
  push box_message_pt
  push 0
  call _MessageBoxA
 
  ;#################################
  ; Caixa de Mensagem Secundário #
  ;#################################
  push 0x40
  push box_title
  push box_message_alt_pt
  push 0
  call _MessageBoxA
  jmp madao
  
  ;############################
  ;	Caixa de Mensagem Final #
  ;############################
  final_pt:
  push 0x40
  push box_title
  push box_message_end_pt
  push 0
  call _MessageBoxA
  ret



