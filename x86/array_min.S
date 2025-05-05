/* ---------------------------------------------------------------------------------------------------------------
*
*  TYPE array_min(TYPE *array, size_t const start, size_t const end);
*
*  get the minimum value of the array
*
--------------------------------------------------------------------------------------------------------------- */


# array_min_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global array_min_int
    .type array_min_int, @function
    .text


    array_min_int:

        # load zero
        xor     %rax, %rax

        # check the indexes
        cmp     %rsi, %rdx
        jl      end_array_min_int

        # push on stack
        push    %rdi
        push    %rsi
        push    %rdx

        # call arry_is_sorted(array, start, end)
        call    array_is_sorted_int

        # pop from stack
        pop     %rdx
        pop     %rsi
        pop     %rdi

        # array_is_sorted --> min = array[start]
        cmp     $1, %rax
        je      sorted_array_min_int

        # load start
        shl     $2, %rsi

        # load end
        shl     $2, %rdx

        # get min
        movl    (%rdi, %rsi), %eax
        add     $4, %rsi

        # go to the loop
        jmp     loop_array_min_int
        

    loop_array_min_int:

        # while (i <= end)
        cmp     %rsi, %rdx
        jl      end_array_min_int

        # load array[i]
        movl    (%rdi, %rsi), %ebx

        # i++
        add     $4, %rsi

        # array[i] < min --> min = array[i]
        cmp     %eax, %ebx
        jge     loop_array_min_int
        mov     %ebx, %eax

        # go to the loop
        jmp     loop_array_min_int
        

    sorted_array_min_int:

        # min = array[end]
        shl     $2, %rsi
        movl    (%rdi, %rsi), %eax
        ret


    end_array_min_int:

        # return min
        ret

#endif // INT_TYPE


# array_min_float()
/* ========================= FLOAT ========================= */
#ifdef FLOAT_TYPE

    .global array_min_float
    .type array_min_float, @function
    .text


    array_min_float:

        # load zero
        xorps   %xmm0, %xmm0

        # check the indexes
        cmp     %rsi, %rdx
        jl      end_array_min_float

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

        # array_is_sorted --> min = array[start]
        cmp     $1, %rax
        je      sorted_array_min_float

        # load start
        shl     $2, %rsi

        # load end
        shl     $2, %rdx

        # get min
        movss   (%rdi, %rsi), %xmm0
        add     $4, %rsi

        # go to the loop
        jmp     loop_array_min_float
        

    loop_array_min_float:

        # while (i <= end)
        cmp     %rsi, %rdx
        jl      end_array_min_float

        # load array[i]
        movss   (%rdi, %rsi), %xmm1

        # i++
        add     $4, %rsi

        # array[i] < min --> min = array[i]
        ucomiss %xmm0, %xmm1
        jae     loop_array_min_float
        movss   %xmm1, %xmm0

        # go to the loop
        jmp     loop_array_min_float
        

    sorted_array_min_float:

        # min = array[start]
        shl     $2, %rsi
        movss   (%rdi, %rsi), %xmm0
        ret
        

    end_array_min_float:

        # return min
        ret

#endif // FLOAT_TYPE