/* ---------------------------------------------------------------------------------------------------------------
*
*  void array_fill(TYPE *array, size_t const start, size_t const end, TYPE const value);
*
*  fill the array with a value
*
--------------------------------------------------------------------------------------------------------------- */


# array_fill_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global array_fill_int
    .type array_fill_int, @function
    .text


    array_fill_int:

        #check the indexes
        cmp     %rsi, %rdx
        jl      end_array_fill_int

        # load start
        shlq   $2, %rsi

        # load end
        shlq   $2, %rdx

        # go to the loop
        jmp     loop_array_fill_int
        

    loop_array_fill_int:

        # fill array[i] with value
        movl    %ecx, (%rdi, %rsi)

        # i++
        add     $4, %rsi

        # while (i <= end)
        cmp     %rsi, %rdx
        jge     loop_array_fill_int
        ret
        

    end_array_fill_int:

        # exit
        ret

#endif // INT_TYPE


# array_fill_float()
/* ========================= FLOAT ========================= */
#ifdef FLOAT_TYPE

    .global array_fill_float
    .type array_fill_float, @function
    .text


    array_fill_float:

        # check the indexes
        cmp     %rsi, %rdx
        jl      end_array_fill_float

        # load start
        shl    $2, %rsi

        # load end
        shl    $2, %rdx

        # go to the loop
        jmp     loop_array_fill_float

        
    loop_array_fill_float:

        # fill array[i] with value
        movss   %xmm0, (%rdi, %rsi)

        # i++
        add     $4, %rsi

        # while (i <= end)
        cmp     %rsi, %rdx
        jge     loop_array_fill_float
        ret
        

    end_array_fill_float:

        # exit
        ret

#endif // FLOAT_TYPE