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

        # check the indexes
        bgt     a1, a2, end_array_fill_int

        # load start
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # load &array[start]
        add     t0, a0, a1

        # go to the loop
        j       loop_array_fill_int


    loop_array_fill_int:

        # fill array[i] with value
        sw      a3, 0(t0)
        addi    t0, t0, 4

        # i++
        addi    a1, a1, 4

        # while (i <= end)
        ble     a1, a2, loop_array_fill_int
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
        bgt     a1, a2, end_array_fill_float

        # load start
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # load &array[start]
        add     t0, a0, a1

        # go to the loop
        j       loop_array_fill_float
        

    loop_array_fill_float:

        # fill array[i] with value
        fsw     fa0, 0(t0)
        addi    t0, t0, 4

        # i++
        addi    a1, a1, 4

        # while (i <= end)
        ble     a1, a2, loop_array_fill_float
        ret
        

    end_array_fill_float:

        # exit
        ret

#endif // FLOAT_TYPE