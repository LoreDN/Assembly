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
        bgt    a1, a2, end_array_copy_int

        # load start
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # load &array[start]
        add     t0, a0, a1

        # load src_idx
        slli    a4, a4, 2

        # load &src[src_idx]
        add     t1, a3, a4

        # go to the loop
        j     loop_array_copy_int


    loop_array_copy_int:

        # load src[src_idx]
        lw      t2, 0(t1)

        # copy src[src_idx] to array[i]
        sw      t2, 0(t0)
        addi    t0, t0, 4
        addi    t1, t1, 4

        # i++
        addi    a1, a1, 4

        # while (i <= end)
        ble     a1, a2, loop_array_copy_int
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
        bgt    a1, a2, end_array_copy_float

        # load start
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # load &array[start]
        add     t0, a0, a1

        # load src_idx
        slli    a4, a4, 2

        # load &src[src_idx]
        add     t1, a3, a4

        # go to the loop
        j     loop_array_copy_float
        

    loop_array_copy_float:

        # load src[src_idx]
        flw     ft0, 0(t1)

        # copy src[src_idx] to array[i]
        fsw     ft0, 0(t0)
        addi    t0, t0, 4
        addi    t1, t1, 4

        # i++
        addi    a1, a1, 4

        # while (i <= end)
        ble     a1, a2, loop_array_copy_float
        ret
        

    end_array_copy_float:

        # exit
        ret

#endif // FLOAT_TYPE