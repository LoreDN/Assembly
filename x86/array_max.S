/* ---------------------------------------------------------------------------------------------------------------
*
*  TYPE array_max(TYPE *array, size_t const start, size_t const end);
*
*  get the maximum value of the array
*
--------------------------------------------------------------------------------------------------------------- */


# array_max_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global array_max_int
    .type array_max_int, @function
    .text


    array_max_int:

        # load zero
        xor     %rax, %rax

        # check the indexes
        cmp     %rsi, %rdx
        jl      end_array_max_int

        # push on stack
        push    %rdi
        push    %rsi
        push    %rdx

        # call array_is_sorted(array, start, end)
        call    array_is_sorted_int

        # pop from stack
        pop     %rdx
        pop     %rsi
        pop     %rdi

        # array_is_sorted --> max = array[end]
        cmp     $1, %rax
        je      sorted_array_max_int

        # load start
        shl     $2, %rsi

        # load end
        shl     $2, %rdx

        # get max
        movl    (%rdi, %rsi), %eax
        add     $4, %rsi

        # go to the loop
        jmp     loop_array_max_int
        

    loop_array_max_int:

        # while (i <= end)
        cmp     %rsi, %rdx
        jl      end_array_max_int

        # load array[i]
        movl    (%rdi, %rsi), %ebx

        # i++
        add     $4, %rsi

        # array[i] > max --> max = array[i]
        cmp     %eax, %ebx
        jle     loop_array_max_int
        mov     %ebx, %eax

        # go to the loop
        jmp     loop_array_max_int
        

    sorted_array_max_int:

        # max = array[end]
        shl     $2, %rdx
        movl    (%rdi, %rdx), %eax
        ret


    end_array_max_int:

        # return max
        ret

#endif // INT_TYPE


# array_max_float()
/* ========================= FLOAT ========================= */
#ifdef FLOAT_TYPE

    .global array_max_float
    .type array_max_float, @function
    .text


    array_max_float:

        # load zero
        xorps   %xmm0, %xmm0

        # check the indexes
        cmp     %rsi, %rdx
        jl      end_array_max_float

        # push on stack
        push    %rdi
        push    %rsi
        push    %rdx

        # call array_is_sorted(array, start, end)
        call    array_is_sorted_float

        # pop from stack
        pop     %rdx
        pop     %rsi
        pop     %rdi

        # array_is_sorted --> max = array[end]
        cmp     $1, %rax
        je      sorted_array_max_float

        # load start
        shl     $2, %rsi

        # load end
        shl     $2, %rdx

        # get max
        movss   (%rdi, %rsi), %xmm0
        add     $4, %rsi

        # go to the loop
        jmp     loop_array_max_float
        

    loop_array_max_float:

        # while (i <= end)
        cmp     %rsi, %rdx
        jl      end_array_max_float

        # load array[i]
        movss   (%rdi, %rsi), %xmm1

        # i++
        add     $4, %rsi

        # array[i] > max --> max = array[i]
        ucomiss %xmm0, %xmm1
        jbe     loop_array_max_float
        movss   %xmm1, %xmm0

        # go to the loop
        jmp     loop_array_max_float
        

    sorted_array_max_float:

        # max = array[end]
        shl     $2, %rdx
        movss   (%rdi, %rdx), %xmm0
        ret
        

    end_array_max_float:

        # return max
        ret

#endif // FLOAT_TYPE