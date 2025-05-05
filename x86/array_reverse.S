/* ---------------------------------------------------------------------------------------------------------------
*
*  void array_reverse(TYPE *array, size_t const start, size_t const end);
*
*  reverse the array
*
--------------------------------------------------------------------------------------------------------------- */


# array_reverse_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global array_reverse_int
    .type array_reverse_int, @function
    .text


    array_reverse_int:

        # check the indexes
        cmp     %rsi, %rdx
        jle     end_array_reverse_int

        # load &array
        mov     %rdi, %r8

        # load start
        mov     %rsi, %r9
        shlq    $2, %r9

        # load end
        mov     %rdx, %r10
        shlq    $2, %r10

        # get the middle
        mov     %r9, %r11
        add     %r10, %r11
        shr     $1, %r11

        # go to the loop
        jmp     loop_array_reverse_int


    loop_array_reverse_int:

        # push on the stack
        push    %r8
        push    %r9
        push    %r10
        push    %r11
           
        # call array_swap_int(&array[i, &array[end - i + start]])
        lea     (%r8, %r9), %rdi
        lea     (%r8, %r10), %rsi
        call     array_swap_int

        # pop from the stack
        pop     %r11
        pop     %r10
        pop     %r9
        pop     %r8

        # i++
        add     $4, %r9

        # j--
        sub     $4, %r10

        # while (i <= middle)
        cmp     %r9, %r11
        jge     loop_array_reverse_int
        ret

        
    end_array_reverse_int:

        # exit
        ret

#endif // INT_TYPE


# array_reverse_float()
/* ========================== FLOAT ========================== */
#ifdef FLOAT_TYPE

    .global array_reverse_float
    .type array_reverse_float, @function
    .text


    array_reverse_float:

        # check the indexes
        cmp     %rsi, %rdx
        jle     end_array_reverse_float

        # load &array
        mov     %rdi, %r8

        # load start
        mov     %rsi, %r9
        shlq    $2, %r9

        # load end
        mov     %rdx, %r10
        shlq    $2, %r10

        # get the middle
        mov     %r9, %r11
        add     %r10, %r11
        shr     $1, %r11

        # go to the loop
        jmp     loop_array_reverse_float


    loop_array_reverse_float:

        # push on the stack
        push    %r8
        push    %r9
        push    %r10
        push    %r11

        # call array_swap_float(&array[i, &array[end - i + start]])
        lea     (%r8, %r9), %rdi
        lea     (%r8, %r10), %rsi
        call     array_swap_float

        # pop from the stack
        pop     %r11
        pop     %r10
        pop     %r9
        pop     %r8

        # i++
        add     $4, %r9

        # j--
        sub     $4, %r10

        # while (i <= middle)
        cmp     %r9, %r11
        jge     loop_array_reverse_float
        ret
        

    end_array_reverse_float:
            
        # exit
        ret

#endif // FLOAT_TYPE