/* ---------------------------------------------------------------------------------------------------------------
*
*  int array_is_sorted(TYPE *array, size_t const start, size_t const end);
*  
*  check if the array is sorted
*
--------------------------------------------------------------------------------------------------------------- */


# array_is_sorted_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global array_is_sorted_int
    .type array_is_sorted_int, @function
    .text


    array_is_sorted_int:

        # load start
        shlq    $2, %rsi

        # load end
        shlq    $2, %rdx

        # check the indexes
        cmp     %rsi, %rdx
        jg      loop_array_is_sorted_int
        je      end_array_is_sorted_int

        # start > end --> return -1 
        mov     $-1, %eax
        ret


    loop_array_is_sorted_int:

        # while (i < end)
        cmp     %rsi, %rdx
        jle     end_array_is_sorted_int

        # load array[i] and array[i+1]
        mov     (%rdi, %rsi), %eax
        add     $4, %rsi
        mov     (%rdi, %rsi), %ebx

        # array[i] > array[i+1] --> return 0
        cmp     %eax, %ebx
        jge     loop_array_is_sorted_int

        xor     %eax, %eax
        ret


    end_array_is_sorted_int:

        # array is sorted --> return 1
        mov     $1, %eax
        ret

#endif // INT_TYPE


# array_is_sorted_float()
/* ========================= FLOAT ========================= */
#ifdef FLOAT_TYPE

    .global array_is_sorted_float
    .type array_is_sorted_float, @function
    .text


    array_is_sorted_float:

        # load start
        shl     $2, %rsi

        # load end
        shl     $2, %rdx

        # check the indexes
        cmp     %rsi, %rdx
        jg      loop_array_is_sorted_float
        je      end_array_is_sorted_float

        # start > end --> return -1
        mov     $-1, %eax
        ret


    loop_array_is_sorted_float:

        # while (i < end)
        cmp     %rsi, %rdx
        jle     end_array_is_sorted_float

        # load array[i] and array[i+1]
        movss   (%rdi, %rsi), %xmm0
        add     $4, %rsi
        movss   (%rdi, %rsi), %xmm1

        # array[i] > array[i+1] --> return 0
        ucomiss %xmm0, %xmm1
        jae     loop_array_is_sorted_float

        xor     %eax, %eax
        ret


    end_array_is_sorted_float:

        # array is sorted --> return 1
        mov     $1, %eax
        ret

#endif // FLOAT_TYPE