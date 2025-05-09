/* ---------------------------------------------------------------------------------------------------------------
*
*  TYPE array_sum(TYPE *array, size_t const start, size_t const end);
*
*  get the sum of the elements of the array
*
--------------------------------------------------------------------------------------------------------------- */


# array_sum_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global array_sum_int
    .type array_sum_int, @function
    .text


    array_sum_int:

        # load zero
        xor     %rax, %rax

        # check indexes
        cmp     %rsi, %rdx
        jl      end_array_sum_int

        # load start
        shl     $2, %rsi

        # load end
        shl     $2, %rdx

        # get the sum
        movl    (%rdi, %rsi), %eax
        add     $4, %rsi

        # go to the loop
        jmp     loop_array_sum_int
        

    loop_array_sum_int:

        # while (i <= end)
        cmp     %rsi, %rdx
        jl      end_array_sum_int

        # sum += array[i]
        addl   (%rdi, %rsi), %eax

        # i++
        add     $4, %rsi

        # go to the loop
        jmp     loop_array_sum_int

        
    end_array_sum_int:

        # return the sum
        ret

#endif // INT_TYPE


# array_sum_float()
/* ========================== FLOAT ========================== */
#ifdef FLOAT_TYPE

    .global array_sum_float
    .type array_sum_float, @function
    .text


    array_sum_float:

        # load zero
        xorps   %xmm0, %xmm0

        # check indexes
        cmp     %rsi, %rdx
        jl      end_array_sum_float

        # load start
        shl     $2, %rsi

        # load end
        shl     $2, %rdx

        # get the sum
        movss   (%rdi, %rsi), %xmm0
        add     $4, %rsi

        # go to the loop
        jmp     loop_array_sum_float
        

    loop_array_sum_float:

        # while (i <= end)
        cmp     %rsi, %rdx
        jl      end_array_sum_float

        # sum += array[i]
        addss   (%rdi, %rsi), %xmm0

        # i++
        add     $4, %rsi

        # go to the loop
        jmp     loop_array_sum_float
        

    end_array_sum_float:

        # return the sum
        ret

#endif // FLOAT_TYPE