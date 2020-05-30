org 0x7C00 ; ORGANISA O OFFSET

; SETANDO O MODO DE VIDEO
MOV AH, 0x00
MOV AL, 0x13
INT 0x10

; PARAMETROS
MOV AL, 0x01 ; COR DO PIXEL
MOV BH, 0x00 ; PAGINA
MOV CX, 0x00 ; X
MOV DX, 0x00 ; Y

; =======================================================================================================================
; Basicamente a subfunção de AH 0x0C troca a cor pro pixel na posição X armazenada em CX
; e na posição Y amazenada em DX, para a cor de AL
; toda vez que o loop for acionado, vai ocorrer duas coisas, incremento de 1 ou mais registradores e
; comparações dos valores desses registradores
; primeiramente sera checado o valor de CX, se ele tiver chegado ao tamanho maximo da linha 0x140
; ele vai incrementar em 1 o valor de DX, ou seja, da "linha"
; após ele pular uma linha o valor de CX vai voltar a 0x00 e começar a preencher a nova linha pelo primeiro pixel
; e assim por diante até completar a tela
; após isso o valor de AL sera icrementado e a cor trocada
; os registradores CX e DX voltam a ser 0x00 para começar a preencher tudo de novo
; se o valor de AL chegar ao limite 0xFF, é retornado a 0x00
; =======================================================================================================================

LOOP:
	MOV AH, 0x0C
	INT 0x10
	
	INC CX
	CMP CX, 0x140
	JNE LOOP
	
	MOV CX, 0x00
	
	INC DX
	CMP DX, 0xC8
	JNE LOOP
	
	MOV DX, 0x00
	
	INC AL
	CMP AL, 0xFF
	JNE LOOP
	
	MOV AL, 0x00
	
	JMP LOOP
TIMES 510-($-$$) DB 0

; GRAVA OS BYTES NA POSIÇÃO CORRETA, PARA SER RECONHECIDO COMO UMA ISO BOOTAVEL
DB 0x55
DB 0xAA
