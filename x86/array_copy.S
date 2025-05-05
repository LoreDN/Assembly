/* ---------------------------------------------------------------------------------------------------------------
*
*  void array_copy(TYPE *array, size_t const start, size_t const end, TYPE *src, size_t const src_idx);
*
*  copy the array from a src
*
--------------------------------------------------------------------------------------------------------------- */


# array_copy_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global array_copy_int
    .type array_copy_int, @function
    .text


    array_copy_int:

        # check the indexes
        cmp     %rsi, %rdx
        jl      end_array_copy_int

        # load start
        shlq    $2, %rsi

        # load end
        shlq    $2, %rdx

        # load src_idx
        shlq    $2, %r8

        # go to the loop
        jmp     loop_array_copy_int

        
    loop_array_copy_int:

        # load src[src_idx]
        mov     (%rcx, %r8), %r9d

        # copy src[src_idx] to array[i]
        mov     %r9d, (%rdi, %rsi)

        # src_idx++
        addq    $4, %r8

        # i++
        addq    $4, %rsi

        # while (i <= end)
        cmp     %rsi, %rdx
        jge     loop_array_copy_int
        ret
        

    end_array_copy_int:

        # exit
        ret

#endif // INT_TYPE


# array_copy_float()
 /* ========================= FLOAT ========================= */
#ifdef FLOAT_TYPE

    .global array_copy_float
    .type array_copy_float, @function
    .text


    array_copy_float:

        # check the indexes
        cmp     %rsi, %rdx
        jl      end_array_copy_float

        # load start
        shlq    $2, %rsi

        # load end
        shlq    $2, %rdx

        # load src_idx
        shlq    $2, %r8

        # go to the loop
        jmp     loop_array_copy_float
        

    loop_array_copy_float:

        # load src[src_idx]
        mov     (%rcx, %r8), %r9d

        # copy src[src_idx] to array[i]
        mov     %r9d, (%rdi, %rsi)

        # src_idx++
        addq    $4, %r8

        # i++
        addq    $4, %rsi

        # while (i <= end)
        cmp     %rsi, %rdx
        jge     loop_array_copy_float
        ret
        

    end_array_copy_float:

        # exit
        ret

#endif // FLOAT_TYPE