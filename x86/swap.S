/* ---------------------------------------------------------------------------------------------------------------
*
*  void swap(TYPE *a, TYPE *b);
*
*  swap two elements of the array
*
--------------------------------------------------------------------------------------------------------------- */


# swap_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global swap_int
    .type swap_int, @function
    .text


    swap_int:

        # swap the elements
        movl    (%rdi), %eax
        movl    (%rsi), %ebx
        movl    %ebx, (%rdi)
        movl    %eax, (%rsi)

        # exit
        ret

#endif // INT_TYPE


# swap_float()
/* ========================= FLOAT ========================= */
#ifdef FLOAT_TYPE

    .global swap_float
    .type swap_float, @function
    .text


    swap_float:

        # swap the elements
        movss   (%rdi), %xmm0
        movss   (%rsi), %xmm1
        movss   %xmm1, (%rdi)
        movss   %xmm0, (%rsi)

        # exit
        ret

#endif // FLOAT_TYPE