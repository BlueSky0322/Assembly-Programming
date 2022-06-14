;TP061914 NG LUM THYN - CSLLT SOURCE CODE
jumps	;ensures the jump conditions can reach out of range
.model small
.stack 100h
.data
        banner  db '                          WELCOME TO APU DIGITAL EVENT                        ', 13, 10
                db '   -~-~-~-~$$$$$$$$****************************************$$$$$$$$-~-~-~-~   ', 13, 10
                db '   123APUDE321      This event is all about cool patterns!      A   E A   E   ', 13, 10
		db '   456     654      Venue: APU Computer Lab 1                    P D   P D    ', 13, 10
		db '   #%&     #%&      Date: 10/06/2022                            ==U== ==U==   ', 13, 10
                db '   456     654      Time: 2 - 4 P.M.                             P D   P D    ', 13, 10
                db '   123APUDE321      Organiser: APU Event Management Unit        A   E A   E   ', 13, 10
                db '   -~-~-~-~$$$$$$$$****************************************$$$$$$$$-~-~-~-~   ', 13, 10
                db '                            Press 1 to continue:                              ', 13, 10
	banner_len = $ - banner		;retrieve string length of banner
        menu    db '              Main Menu', 13, 10
                db '--------**********************--------', 13, 10
                db '|      1. Number Patterns            |', 13, 10
                db '|      2. Design Patterns            |', 13, 10
                db '|      3. Box Type Patterns          |', 13, 10
                db '|      4. Nested Loop Patterns       |', 13, 10
                db '|      5. Exit                       |', 13, 10
		db '--------**********************--------', 13, 10
                db 'Select your choice: $'
        color   db 63
	askInput db 10, 'Press 1 to return to Main Menu: $'
        wrongInput db 10, 'Wrong input! Please try again: $'
	
	;declaring temporary values
	char1	dw ?
	space2	dw ?
	char2	dw ?
	char3	dw ?
	space4	dw ?
	char4	dw ?
	
	count dw ?
	
	;declaring constant values
	c1	dw 1
	s2	dw 16
	c2	dw 5
	c3	dw 1
	s4	dw 16
	c4	dw 5

	cnt   dw 7
.code

;usage of MACROs to print message strings
showMsg MACRO msg
        lea dx, msg
        mov ah, 09h
        int 21h
ENDM

MAIN PROC
        mov ax, @data	;retrieves data from data segment
        mov ds, ax 
	mov es, ax	;segment used for banner display
        
	call cls	;clear screen

;banner display, light cyan background + white text + blinking
        
	mov ah, 13h		;service to print string with colour
        lea bp, banner		;load the message
        mov cx, banner_len	;set register to length of string
        mov bl, color		;assign color attribute
        mov al, 0		;intermediary values stored here
        mov bh, 0		;page number
        mov dh, 6		;y coordinate
        mov dl, 0		;x coordinate
        int 10h			;BIOS screen services
        
userInput1:
        mov ah, 1	;retrieves user input
        int 21h

        cmp al, '1'	;compares value
        je mainMenu	;if equal, jump to mainMenu

        showMsg wrongInput	;else, print error message
        jmp userInput1		;loopback to user input prompt

mainMenu:
        call cls	;clear screen
        showMsg menu	;display Main Menu
  
userInput2:
        mov ah, 1
        int 21h
	cmp al, '1'
	je numberPattern	;display number pattern
	cmp al, '2'
	je designPattern	;display design pattern
        cmp al, '3'
	je boxPattern		;display box type pattern
	cmp al, '4'
	je nestedLoopPattern	;display nested loop pattern
        cmp al, '5'
        je exit
                                                                                                               
        showMsg wrongInput	;prompt user input if invalid
        jmp userInput2

;**********************************NUMBER PATTERN CODE********************************
numberPattern:
	call cls
	mov ah, 2
;--------number pattern line 1------
        mov cx, 5	;set cx register to 5
npline1:
        call printSpace ;print space 5 times
        loop npline1

        mov dl, 48	;print '0' char
        int 21h

        call newline	;new line
;--------number pattern line 2------	
        mov cx, 4	;reset cx register to 4
npline2:
        call printSpace ;print space 4 times
        loop npline2

        mov dl, 48	;print '0' char
        int 21h
        inc dl		;increment dl to print '1' char
        int 21h
        dec dl		;decrement dl to print '0' char
        int 21h

        call newline
;--------number pattern line 3------
        mov cx, 3	;reset cx register to 3
npline3:
        call printSpace	;print space 3 times
        loop npline3

        mov dl, 48	;print '0'char        
	mov cx, 2	
incline3:
	call increment	;increment dl 2 times
        loop incline3

        mov cx, 3
decline3:
        call decrement	;decrement dl 3 times
        loop decline3

        call newline	;new line

;the following code comments are similar to the ones above
;so they are ommited to reduce clutter
;--------number pattern line 4------
        mov cx, 2	
npline4:
        call printSpace	
        loop npline4

        mov dl, 48
        mov cx, 3
incline4:
        call increment
        loop incline4

        mov cx, 4
decline4:
        call decrement
        loop decline4
	
	call newline
;--------number pattern line 5------
        mov cx, 1	
npline5:
        call printSpace	
        loop npline5

        mov dl, 48
        mov cx, 4
incline5:
        call increment
        loop incline5

        mov cx, 5
decline5:
        call decrement
        loop decline5
	
	call newline
;--------number pattern line 6------
        mov dl, 48
        mov cx, 5
incline6:
        call increment
        loop incline6

        mov cx, 6
decline6:
        call decrement
        loop decline6
	
	call newline        
;--------number pattern line 7------
        mov cx, 1	
npline7:
        call printSpace	
        loop npline7

        mov dl, 48
        mov cx, 4
incline7:
        call increment
        loop incline7

        mov cx, 5
decline7:
        call decrement
        loop decline7
	
	call newline
;--------number pattern line 8------
        mov cx, 2	
npline8:
        call printSpace	
        loop npline8

        mov dl, 48
        mov cx, 3
incline8:
        call increment
        loop incline8

        mov cx, 4
decline8:
        call decrement
        loop decline8
	
	call newline
;--------number pattern line 9------
        mov cx, 3	
npline9:
        call printSpace	
        loop npline9

        mov dl, 48
        mov cx, 2
incline9:
        call increment
        loop incline9

        mov cx, 3
decline9:
        call decrement
        loop decline9
	
	call newline
;--------number pattern line 10------
        mov cx, 4	
npline10:
        call printSpace	
        loop npline10

        mov dl, 48
        mov cx, 1
incline10:
        call increment
        loop incline10

        mov cx, 2
decline10:
        call decrement
        loop decline10
	
	call newline
;--------number pattern line 11------
        mov cx, 5	
npline11:
        call printSpace	
        loop npline11

        mov dl, 48
	int 21h

	call newline
	jmp userInput3

;**********************************DESIGN PATTERN CODE********************************
designPattern:
	call cls

	mov ah, 2 
    	mov bh, 0 	;page number
    	mov dh, 1 	;set cursor y coordinate
    	mov dl, 1 	;set cursor x coordinate
    	int 10h		;BIOS screen services
    	
    	mov cx, cnt	;retrieve constant value from data segment
	mov count, cx	;store in temp value

	mov cx, count 	;counter variable to track number of slanted lines 
countLoop:
	push cx
	mov cx, 7	;cx register to keep track of rows
printCharDownRight:	;loop to print 1 line of slanted char  	
    	inc dl 		;increment cursor x coordinate 
    	inc dh 		;increment cursor y coordinate 
    	int 10h 	;BIOS screen services
	mov bl, dl 	;temporarily store x coordinate in bl
    	mov dl, 36 	;print char using dl
    	int 21h 	
    	mov dl, bl 	;reassign dl with temp value
    	loop printCharDownRight

	mov cx, 7	
moveToFront:		;reposition the cursor to the front 
	dec dl
	loop moveToFront
	inc dh		;move cursor down once

	mov cx, 7	;cx register to keep track of rows
printCharUpRight:	;loop to print 1 line of slanted char  	
	inc dl 		;increment cursor x coordinate 
    	dec dh 		;increment cursor y coordinate 
    	int 10h 	;BIOS screen services
	mov bl, dl 	;temporarily store x coordinate in bl
    	mov dl, 36 	;print char using dl
    	int 21h 
	mov dl, bl 	;reassign dl with temp value	
    	loop printCharUpRight
	
	dec dh		;move cursor back up

	pop cx
loop countLoop
	
	mov cx, 8
loopNewLine:		;loop to print new line 8 times 
	call newline
	loop loopNewLine
	jmp userInput3

;**********************************BOX PATTERN CODE********************************
;Box Pattern to print initials of APU Digital Event (APUDE)
boxPattern:
	call cls
        mov ah, 2	;print char function

;-------line 1-------------------
        mov cx,10	;set the cx register to 10                    
line1:
        mov dl, 'A'	;print 'A' 10 times
        int 21h
        loop line1

        call newline	;next line
    
;-------line 2-------------------        
        mov dl, 'A'	;at next line print 'A' first
        int 21h

        mov cx, 8	;reset the cx register to 8
line2:
        mov dl, 'P'	;print 'P' 8 times
        int 21h
        loop line2

        mov dl, 'A'	;at end of line print 'A'
        int 21h
	
        call newline  	;next line
          
;-------line 3-------------------        
        mov dl, 'A'	;at next line print 'A' first
        int 21h
        mov dl, 'P'	;followed by 'P'
        int 21h

        mov cx, 6	;reset the cx register to 6
line3:
        mov dl, 'U'	;print 'U' 6 times
        int 21h
        loop line3

        mov dl, 'P'	;at end of line print 'P'
        int 21h   
        mov dl, 'A'	;followed by 'A'
        int 21h

        call newline  	;next line  

;-------line 4------------------- 
        mov dl, 'A'	;at next line print 'A' first
        int 21h
        mov dl, 'P'	;followed by 'P'
        int 21h	
        mov dl, 'U'	;then 'U'
        int 21h

        mov cx, 4	;reset the cx register to 4
line4:
        mov dl,'D'	;print 'D' 4 times
        int 21h
        loop line4

        mov dl,'U'	;at end of line print 'U'
        int 21h
        mov dl,'P'	;followed by 'P'
        int 21h   
        mov dl,'A'	;then 'A'
        int 21h

	call newline	;new line

;-------line 5------------------- 
        mov dl, 'A'	;at next line print 'A' first
        int 21h
        mov dl, 'P'	;followed by 'P'
        int 21h
        mov dl, 'U'	;then 'U'
        int 21h
        mov dl, 'D'	;then 'D' 
        int 21h

        mov cx, 2	;reset the cx register to 2
line5:
        mov dl, 'E'	;print 'E' 2 times
        int 21h
        loop line5

        mov dl, 'D'	;at end of line print 'D'
        int 21h
        mov dl, 'U'	;followed by 'U'
        int 21h
        mov dl, 'P'	;then 'P'
        int 21h   
        mov dl, 'A'	;then 'A'
        int 21h
	
	call newline	;new line
  
;-------line 6-------------------
        mov dl, 'A'	;at next line print 'A' first
        int 21h
        mov dl, 'P'	;followed by 'P'
        int 21h
        mov dl, 'U'	;then 'U'
        int 21h
        mov dl, 'D'	;then 'D' 
        int 21h

        mov cx, 2	;reset the cx register to 2
line6:
        mov dl, 'E'	;print 'E' 2 times
        int 21h
        loop line6

        mov dl, 'D'	;at end of line print 'D'
        int 21h
        mov dl, 'U'	;followed by 'U'
        int 21h
        mov dl, 'P'	;then 'P'
        int 21h   
        mov dl, 'A'	;then 'A'
        int 21h
	
	call newline	;new line

;-------line 7-------------------
        mov dl, 'A'	;at next line print 'A' first
        int 21h
        mov dl, 'P'	;followed by 'P'
        int 21h	
        mov dl, 'U'	;then 'U'
        int 21h

        mov cx, 4	;reset the cx register to 4
line7:
        mov dl, 'D'	;print 'D' 4 times
        int 21h		
        loop line7

        mov dl, 'U'	;at end of line print 'U'
        int 21h
        mov dl, 'P'	;followed by 'P'
        int 21h   
        mov dl, 'A'	;then 'A'
        int 21h

	call newline	;next line

;-------line 8-------------------
        mov dl, 'A'	;at next line print 'A' first
        int 21h
        mov dl, 'P'	;followed by 'P'
        int 21h

        mov cx, 6	;reset the cx register to 6
line8:
        mov dl, 'U'	;print 'U' 6 times
        int 21h
        loop line8

        mov dl, 'P'	;at end of line print 'P'
        int 21h   
        mov dl, 'A'	;followed by 'A'
        int 21h

        call newline  	;next line  
        
;-------line 9-------------------
       	mov dl, 'A'	;at next line print 'A' first
        int 21h

        mov cx, 8	;reset the cx register to 8
line9:
        mov dl, 'P'	;print 'P' 8 times
        int 21h
        loop line9

        mov dl, 'A'	;at end of line print 'A'
        int 21h
	
        call newline  	;next line  

;-------line 10-------------------
       	mov cx,10	;reset the cx register to 10                    
line10:
        mov dl, 'A'	;print 'A' 10 times
        int 21h
        loop line10
	
	call newline
	jmp userInput3

;**********************************NESTED LOOP PATTERN CODE********************************
nestedLoopPattern:
	call cls

;storing temporary values
	mov ah, 2
	mov cx, c1
	mov char1, cx
	
	mov cx, s2
	mov space2, cx	
	mov cx, c2
	mov char2, cx

	mov cx, c3
	mov char3, cx

	mov cx, s4
	mov space4, cx
	mov cx, c4
	mov char4, cx

	mov cx, 5	;number of rows
mainOuterLoop1: 
	push cx		;push value of cx into top of stack

;---------character triangle 1--------------
	mov cx, char1	;assign char1 value to cx register
printCharLoop1:
	mov dl, 35	;loop to print char 
	int 21h		
	loop printCharLoop1
	inc char1	;increment char1 so that next pass it will print +1 char

;---------character triangle 2--------------
	mov cx, space2	;assign space2 value to cx register
printSpaceLoop2:
	mov dl, 32	;loop to print spaces
	int 21h
	loop printSpaceLoop2
	dec space2	;decrement space1 so that next pass it will print -1 space

	mov cx, char2	;assign char2 value to cx register
printCharLoop2:
	mov dl, 35	;loop to print char
	int 21h		
	loop printCharLoop2
	dec char2	;decrement char2 so that next pass it will print -1 char
	
	call newline	;new line
	
	mov cx, bx	;assign cx with bx value
	pop cx		;pop the value at top of stack into cx		
loop mainOuterLoop1

	call newline	;new line

	mov cx, 5	;number of rows
mainOuterLoop2: 
	push cx		;push value of cx into top of stack

;---------number triangle 1--------------
	mov cx, char3	;assign char3 value to cx register
	mov dl, 49	;print '1' 
printCharLoop3:
	int 21h		
	inc dl		;increment dl so that next pass it will print next number	
	loop printCharLoop3
	inc char3	;increment char3 so that next pass it will print +1 char

;---------number triangle 2--------------
	mov cx, space4	;assign space4 value to cx register
printSpaceLoop4:
	mov dl, 32	;loop to print spaces
	int 21h
	loop printSpaceLoop4
	dec space4	;decrement space4 so that next pass it will print -1 space

	mov cx, char4	;assign char4 value to cx register
	mov dl, 53	;print '5'
printCharLoop4:
	int 21h
	dec dl		;decrement dl so that next pass it will print previous number
	loop printCharLoop4
	dec char4	;increment char4 so that next pass it will print +1 char
	
	call newline	;new line

	mov cx, bx	;assign cx with bx value
	pop cx		;pop the value at top of stack into cx		
loop mainOuterLoop2
	
	call newline

	jmp userInput3

userInput3:
        showMsg askInput
        mov ah, 1
        int 21h

        cmp al, '1'
        je mainMenu

        showMsg wrongInput
        jmp userInput3


exit:
        mov ah, 4ch
        int 21h
                                                                                          
MAIN ENDP

;usage of PROCEDURES
cls PROC
        mov ax, 3      ;function to clear screen
        int 10h
        ret
ENDP

newline PROC		
	mov dl, 10	;function to print newline
	int 21h
	mov dl, 13
	int 21h
	ret
ENDP

printSpace PROC
        mov dl, 32	;function to print space
        int 21h
        ret
ENDP
        
increment PROC
	int 21h		;function to increment dl
	inc dl
	ret
ENDP

decrement PROC
	int 21h		;function to decrement dl
        dec dl
	ret
ENDP

END MAIN
                                                                                                                                                                                                                
                                                                                                                                                                                                                                                                                                                
