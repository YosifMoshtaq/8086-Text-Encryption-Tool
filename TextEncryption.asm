org 100h
.data
    v equ 0dh
    m equ 0ah
    
    menu_msg db '1.Encrypt Text',v,m,'2.Decrypt Text',v,m,'Choice: $'
    str_msg db v,m,'Enter Text: $'
    key_msg db v,m,'Enter Key (0-9): $'
    res_msg db v,m,'Result: $'
    text_in db 50 dup(?)
    tex_len dw 0
    key_val db 0
    user_choice db 0
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx,menu_msg ;show menu msg
    mov ah,9
    int 21h
    
    mov ah,1  ;read choice (1 or 2)
    int 21h
    mov user_choice,al
    
    cmp user_choice,'1'
    je con
    cmp user_choice,'2'
    je con
    
    jmp exit_prog
    
con:    
    lea dx,str_msg  ;show Enter Text msg
    mov ah,9
    int 21h
    
    mov si,0      ;index for array wca use di bx bp as an index
    
readtxtloop:
    mov ah,1
    int 21h
    
    cmp al,0dh  ;compare if the input = Enter
    je getkey                                
    
    mov text_in[si],al
    inc si
    inc tex_len 
    jmp readtxtloop
    
getkey:
    lea dx,key_msg
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    sub al,30h
    mov key_val,al
    
    cmp user_choice,'1'
    je do_encrypt
    
    cmp user_choice,'2'
    je do_decrypt
    
    
do_encrypt:
    mov cx,tex_len
    cmp cx,0
    je exit_prog
    mov si,0
    
encryptloop:
    mov al,text_in[si]
    add al,key_val
    mov text_in[si],al
    inc si
    loop encryptloop  ;end of loop do 2op 1- (cx-1) 2- (cx!=0)
    
    jmp printresult
    
do_decrypt:
    mov cx,tex_len
    cmp cx,0
    je exit_prog
    mov si,0
    
decryptloop:
    mov al,text_in[si]
    sub al,key_val
    mov text_in[si],al
    inc si
    loop decryptloop
    
    jmp printresult
    
printresult:
    lea dx,res_msg
    mov ah,9
    int 21h
    mov cx,tex_len
    mov si,0
    
printloop:
    mov dl,text_in[si]
    mov ah,2
    int 21h
    inc si
    loop printloop
    
exit_prog:
    mov ah,4ch
    int 21h
main endp

end main
    






