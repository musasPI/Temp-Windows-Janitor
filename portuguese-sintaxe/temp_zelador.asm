;-------------------------------------------------------------------------------%
; Name Programa: Temp Janitor                                                   ?
; Autor:Pinheiro                                                                !
; Versão: 0.5                                                                   ?
; Descrição Breve: Deleta arquivos na pasta %temp% e na pasta c:\windows\temp   !
; DLL's Usadas: User32.dll; Shell32.dll; Kernel32.dll;                          ?												  
;-------------------------------------------------------------------------------%

  extern _MessageBoxA
  extern _ShellExecuteA

  section .data
  box_title db "Temp Janitor",0
  box_message_pt db "Ei-ei espere! O Zelador está em procura da vassoura.",0
  box_message_alt_pt db "O Zelador terminou sua procura e encontrou sua vassoura, agora ele irá voltar ao trabalho!",0
  box_message_cancel_pt db "Éhh tá bom, talvez você seja uma barata ou um ratinho de esgoto",0
  box_message_end_pt db "O Zelador limpou os arquivos temporários, porém nem todos foram limpos porque são necessários para a execução de aplicações!",0
  
  app db "cmd",0
  funct db "runas",0
  parm db "/c cd %temp% && erase *.* /f /s /q ",0
  param db "/c cd c:\windows\temp && erase *.* /f /s /q ",0
  
  section .code
  global _flaggedware
 
  _flaggedware:
   
  ;#############################
  ; Caixa de Mensagem Inicial #
  ;#############################
  push 0x30
  push box_title
  push box_message_pt
  push 0
  call _MessageBoxA
 
  ;################################
  ; Caixa de Mensagem Secundário #
  ;################################
  push 0x40
  push box_title
  push box_message_alt_pt
  push 0
  call _MessageBoxA

  ;###############################
  ; Limpa os arquivos de %temp% #
  ;###############################
  madao:
  push 0
  push 0
  push parm
  push app
  push funct
  push 0
  call _ShellExecuteA
  
  ;########################################
  ; Limpa os arquivos de C:\Windows\Temp #
  ;########################################
  push 0
  push 0
  push param
  push app
  push funct
  push 0
  call _ShellExecuteA
  
  ;###########################
  ; Caixa de Mensagem Final #
  ;###########################
  push 0x40
  push box_title
  push box_message_end_pt
  push 0
  call _MessageBoxA
  ret
