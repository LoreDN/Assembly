/* ---------------------------------------------------------------------------------------------------------------
*
*  void swap(TYPE *a, TYPE *b);
*
*  swap two elements
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
        lw      t0, 0(a0)
        lw      t1, 0(a1)
        sw      t1, 0(a0)
        sw      t0, 0(a1)

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
        flw     ft0, 0(a0)
        flw     ft1, 0(a1)
        fsw     ft1, 0(a0)
        fsw     ft0, 0(a1)

        # exit
        ret

#endif // FLOAT_TYPE