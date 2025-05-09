/* ---------------------------------------------------------------------------------------------------------------
*
*  LIST *list_copy(LIST *src);
*
*  copy the List from a src
*
--------------------------------------------------------------------------------------------------------------- */


# list_copy_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global list_copy_int
    .type list_copy_int, @function
    .extern list_add_Node_int
    .text

    
    list_copy_int:

        # check the src
        xor     %rax, %rax
        cmp     %rdi, %rax
        je      end_list_copy_int

        # load %src
        mov     %rdi, %r8

        # push on stack
        push    %r8

        # call LIST *list = list_add_Node_int(src->value)
        mov     (%rdi), %edi
        call    list_add_Node_int

        # pop from stack
        pop     %r8

        # load current_src = src->next
        mov     8(%r8), %rdi

        # load current_list = list
        mov     %rax, %r8

        # go to the loop
        jmp     loop_list_copy_int 

    
    loop_list_copy_int:

        # while (current_src != NULL)
        xor     %r9, %r9
        cmp     %rdi, %r9
        je      end_list_copy_int

        # push on stack
        push    %rdi
        push    %rax
        push    %r8

        # call current_list->next = list_add_Node_int(src->value)
        mov     (%rdi), %rdi
        call    list_add_Node_int
        mov     %rax, %r9

        # pop from stack
        pop     %r8
        pop     %rax
        pop     %rdi

        # current_list->next = list_add_Node_int(src->value)
        mov     %r9, 8(%r8)

        # current_src = current_src->next
        mov     8(%rdi), %rdi

        # current_list = current_list->next
        mov     8(%r8), %r8

        # go to the loop
        jmp     loop_list_copy_int

        
    end_list_copy_int:

        # return list
        ret

#endif // INT_TYPE


# list_copy_float()
/* ========================= FLOAT ========================= */
#ifdef FLOAT_TYPE

    .global list_copy_float
    .type list_copy_float, @function
    .extern list_add_Node_float
    .text

    
    list_copy_float:

        # check the src
        xor     %rax, %rax
        cmp     %rdi, %rax
        je      end_list_copy_float

        # load %src
        mov     %rdi, %r8

        # push on stack
        push    %r8

        # call LIST *list = list_add_Node_float(src->value)
        movss   (%rdi), %xmm0
        call    list_add_Node_float

        # pop from stack
        pop     %r8

        # load current_src = src->next
        mov     8(%r8), %rdi

        # load current_list = list
        mov     %rax, %r8

        # go to the loop
        jmp     loop_list_copy_float 

    
    loop_list_copy_float:

        # while (current_src != NULL)
        xor     %r9, %r9
        cmp     %rdi, %r9
        je      end_list_copy_float

        # push on stack
        push    %rdi
        push    %rax
        push    %r8

        # call current_list->next = list_add_Node_float(src->value)
        movss   (%rdi), %xmm0
        call    list_add_Node_float
        mov     %rax, %r9

        # pop from stack
        pop     %r8
        pop     %rax
        pop     %rdi

        # current_list->next = list_add_Node_float(src->value)
        mov     %r9, 8(%r8)

        # current_src = current_src->next
        mov     8(%rdi), %rdi

        # current_list = current_list->next
        mov     8(%r8), %r8

        # go to the loop
        jmp     loop_list_copy_float

        
    end_list_copy_float:

        # return list
        ret

#endif // FLOAT_TYPE