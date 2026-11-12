;----------------------------------------------------------------------------------------------------|
; Name Program: WT Janitor									 			    				 	     |
; Author: musasPI																             		 |
; Version: 1.0																			  			 |
; Quick Description: Deletes files in the %temp% and %windir%\temp folders					 	     |
; Used DLL's: User32.dll; Shell32.dll; Kernel32.dll;												 |
;----------------------------------------------------------------------------------------------------|
 
; Extern Function of WinAPI
extern _MessageBoxA                 ; User32.dll
extern _ShellExecuteA               ; Shell32.dll
extern _ExitProcess                 ; Kernel32.dll
extern Sleep                        ; Kernel32.dll

section .data
title_box db "Temp Janitor",0
ask_box db "Do you want to erase temporary files?",0
initial_box db "W-Wait! The Janitor is looking for his broom",0
middle_box db "The Janitor found the broom and now it's time for a magic clean!",0
cancel_box db "Thats OK! Maybe you are a cockroach",0
end_box db "The Janitor cleaned your temporary files but some files were not cleaned because they are currently running.",0

shell db "cmd",0                    ; Open CMD
mode db "runas",0                   ; Use runas to launch UAC to acess CMD as Administrator 
paramone db '/c cd /d %temp% && del /s /q /f *.* && for /d %i in (*) do rmdir /s /q "%i"',0             ; Change directory to %temp% and delete files  
                                                                                                        ; and subfolders on %temp%
paramtwo db '/c cd /d %windir%\Temp && del /s /q /f *.* && for /d %i in (*) do rmdir /s /q "%i"',0      ; Change directory to %windir%\Temp and delete files 
                                                                                                        ; and subfolders on %windir%\Temp
  
section .code
global _main
 
_main:
   
 ;###########################
 ;	 Ask Box                #
 ;###########################
   push 0x34                        ; push MB_ICONWARNING to memory stack (Fourth push of stack)
   push title_box                   ; Push text of title_box to memory stack (Third push of stack)
   push ask_box                     ; Push text of ask_box to memory stack (Second push of stack)
   push 0                           ; Push 0 to memory stack (First push of stack)
   call _MessageBoxA                ; Call the _MessageBoxA function on WinAPI and
                                    ; Show message box w/ title, icon and text
  
 ;#########################
 ;	  Conditional Block   #
 ;#########################
   cmp eax, 6                       ; ID_YES = 6 | ID_NO = 7 ; Compare the EAX to 6 (ID_YES)
   je cleaning_time                 ; So if EAX Equals 6 jump to the FUNCTION_CLEANING_TIME

 ;##########################
 ;   Cancel Message Box    #
 ;##########################
   push 0x40                        ; Push MB_INFORMATION to memory stack (Fourth push of stack)
   push title_box                   ; Push text of title_box to memory stack (Third push of stack)
   push cancel_box                  ; Push text of cancel_box to memory stack (Second push of stack)
   push 0                           ; Push 0 to memory stack (First push of stack)
   call _MessageBoxA                ; Call the _MessageBoxA function on WinAPI and
                                    ; Show message box w/ title, icon and text

   jmp exit_of                      ; Jump to exit function


cleaning_time:
  ;#########################
  ;   Clean temp files    #
  ;#########################

  ;##########################
  ;   First Message Box    #
  ;##########################
    push 0x40                       ; Push MB_INFORMATION to memory stack (Fourth push of stack)
    push title_box                  ; Push text of title_box to memory stack (Third push of stack)
    push initial_box                ; Push text of initial_box to memory stack (Second push of stack)
    push 0                          ; Push 0 to memory stack (First push of stack)
    call _MessageBoxA ;             ; Call the _MessageBoxA function on WinAPI and
                                    ; Show message box w/ title, icon and text

  ;###################
  ;	   0.75s Delay   #
  ;###################
    xor eax, eax                    ; Clear the register and empty it
    mov eax, 0750                   ; Move the value of 0750 to EAX
    push eax                        ; Push EAX w/ the value of 0750
    call Sleep                      ; Call the Sleep function on WinAPI and
                                    ; Sleeps the program for 0.75 seconds

  ;##########################
  ;   Second Message Box   #
  ;##########################
    push 0x40                       ; Push MB_INFORMATION to memory stack (Fourth push of stack)
    push title_box                  ; Push text of title_box to memory stack (Third push of stack)
    push middle_box                 ; Push text of middle_box to memory stack (Second push of stack)
    push 0                          ; Push 0 to memory stack (First push of stack) 
    call _MessageBoxA               ; Call the _MessageBoxA function on WinAPI and
                                    ; Show message box w/ title, icon and text

 ;###########################
 ;	  Clean %temp% files   #
 ;###########################
   push 0                           ; Push 0 to memory stack (First push of stack)
   push 0                           ; Push 0 to memory stack (Sixth push of stack)
   push paramone                    ; Push text of paramone to memory stack (Fourth push of stack)
   push shell                       ; Push text of shell to memory stack (Third push of stack)
   push mode                        ; Push text of mode to memory stack (Second push of stack)
   push 0                           ; Push 0 to memory stack (First push of stack)
   call _ShellExecuteA              ; Call the _ShellExecuteA function on WinAPI and
                                    ; Open CMD as Administrator w/ UAC request and
                                    ; Erase files and subfolders on %temp%
  
 ;###############################
 ;  Clean %windir%\Temp files  #
 ;###############################
   push 0                           ; Push 0 to memory stack (Sixth push of stack)
   push 0                           ; Push 0 to memory stack (Fifth push of stack)
   push paramtwo                    ; Push text of paramtwo to memory stack (Fourth push of stack)
   push shell                       ; Push text of shell to memory stack (Third push of stack)
   push mode                        ; Push text of mode to memory stack (Second push of stack)
   push 0                           ; Push 0 to memory stack (First push of stack)
   call _ShellExecuteA              ; Call the _ShellExecuteA function on WinAPI and
                                    ; Open CMD as Administrator w/ UAC request and
                                    ; Erase files and subfolders on %windir%\Temp
   
  ;###################
  ;	   2s Delay     #
  ;###################
    xor eax, eax                    ; Clear the register and empty it
    mov eax, 2000                   ; Move the value of 2000 to EAX
    push eax                        ; Push EAX w/ the value of 2000
    call Sleep                      ; Call the Sleep function on WinAPI and
                                    ; Sleeps the program for 2 seconds

 ;#########################
 ;	  Last Message Box   #
 ;#########################
   push 0x30                        ; Push MB_WARNING to memory stack (Fourth push of stack)
   push title_box                   ; Push text of title_box to memory stack (Third push of stack)
   push end_box                     ; Push text of end box_to memory stack (Second push of stack)
   push 0                           ; Push 0 to memory stack (First push of stack)
   call _MessageBoxA                ; Call the _MessageBoxA function on WinAPI and
                                    ; Show message box w/ title, icon and text
  

exit_of:
 ;#########################
 ;	  Exit Program       #
 ;#########################
   push 0                           ; Push 0 to stack memory (sucess operation)
   call _ExitProcess                ; Call the _ExitProcess function on WinAPI and
                                    ; Exit program w/out errors
