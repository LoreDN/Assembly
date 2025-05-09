/* ---------------------------------------------------------------------------------------------------------------
*
*  int array_find(TYPE *array, size_t const start, size_t const end, TYPE const value);
*
*  find the first occurrence of a value in the array by linear search
*
--------------------------------------------------------------------------------------------------------------- */


# array_find_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global array_find_int
    .type array_find_int, @function
    .text


    array_find_int:

        # check the indexes
        cmp     %rsi, %rdx
        jl      end_array_find_int

        # load start
        shlq    $2, %rsi

        # load end
        shlq    $2, %rdx

        # go to the loop
        jmp     loop_array_find_int
        

    loop_array_find_int:

        # while (i <= end)
        cmp     %rsi, %rdx
        jl      end_array_find_int
            
        # load array[i]
        movl    (%rdi, %rsi), %eax

        # i++
        add     $4, %rsi

        # compare array[i] with value
        cmp     %eax, %ecx
        jne     loop_array_find_int

        # value found --> return i
        mov     %rsi, %rax
        shr     $2, %rax
        sub     $1, %rax
        ret
        

    end_array_find_int:

        # value not found --> return -1
        movl    $-1, %eax
        ret

#endif // INT_TYPE


# array_find_float()
/* ========================= FLOAT ========================= */
#ifdef FLOAT_TYPE

    .global array_find_float
    .type array_find_float, @function
    .text


    array_find_float:

        # check the indexes
        cmp     %rsi, %rdx
        jl      end_array_find_float

        # load start
        shlq    $2, %rsi

        # load end
        shlq    $2, %rdx

        # go to the loop
        jmp     loop_array_find_float
        

    loop_array_find_float:

        # while (i <= end)
        cmp     %rsi, %rdx
        jl      end_array_find_float
            
        # load array[i]
        movss  (%rdi, %rsi), %xmm1

        # i++
        add     $4, %rsi

        # compare array[i] with value
        ucomiss %xmm0, %xmm1
        jne     loop_array_find_float

        # value found --> return i
        mov     %rsi, %rax
        shr     $2, %rax
        sub     $1, %rax
        ret
        

    end_array_find_float:

        # value not found --> return -1
        movl    $-1, %eax
        ret

#endif // FLOAT_TYPE