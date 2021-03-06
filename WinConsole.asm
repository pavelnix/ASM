.386                                  ; this gets use to use 386 instruction set 
.model flat, stdcall                  ; this specifies the memory model of the program, flat is for windows
                                      ; stdcall means our parameters are pushed from left to right
option casemap :none                  ; this means our labels will be case sensitive
.stack 4096

includelib kernel32.lib

ExitProcess PROTO, dwExitCode: DWORD

SetConsoleTitleA PROTO :DWORD
GetStdHandle PROTO     :DWORD
WriteConsoleA PROTO    :DWORD,:DWORD,:DWORD,:DWORD,:DWORD
ExitProcess PROTO      :DWORD
Sleep PROTO            :DWORD

.data                                 ; all initialized data must follow the .data directive
	; define you var

	message db "Hello World!", 0
	title db 'My First Console Application',0

.code                                 ; all code must follow the .code directive
main PROC								
    
	;write asm code here 
	LOCAL hStdout :DWORD
	
	invoke SetConsoleTitleA, offset title
	invoke GetStdHandle, -11
	mov hStdout,EAX
	
	invoke WriteConsoleA, hStdout, offset message, 12d, 0, 0
	;or
	;push 0
	;push 0
	;push 12d
	;push offset message
	;push hStdout
	;call WriteConsoleA
	
	invoke Sleep, 2000d
	
	INVOKE ExitProcess, 0			
main ENDP
END main
