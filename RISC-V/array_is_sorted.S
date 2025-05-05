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
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # load &array[start]
        add     t0, a1, a0

        # check the indexes
        blt     a1, a2, loop_array_is_sorted_int
        beq     a1, a2, end_array_is_sorted_int

        # start > end --> return -1
        li      a0, -1
        ret


    loop_array_is_sorted_int:

        # while (i < end)
        bge     a1, a2, end_array_is_sorted_int

        # load array[i] and array[i+1]
        lw      t1, 0(t0)
        lw      t2, 4(t0)
        addi    t0, t0, 4

        # i++
        addi    a1, a1, 4

        # array[i] > array[i+1] --> return 0
        ble     t1, t2, loop_array_is_sorted_int

        li      a0, 0
        ret

        
    end_array_is_sorted_int:

        # array is sorted --> return 1
        li      a0, 1
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
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # load &array[start]
        add     t0, a1, a0

        # check the indexes
        blt     a1, a2, loop_array_is_sorted_float
        beq     a1, a2, end_array_is_sorted_float

        # start > end --> return -1
        li      a0, -1
        ret
        

    loop_array_is_sorted_float:

        # while (i < end)
        bge     a1, a2, end_array_is_sorted_float

        # load array[i] and array[i+1]
        flw     ft0, 0(t0)
        flw     ft1, 4(t0)
        addi    t0, t0, 4

        # i++
        addi    a1, a1, 4

        # array[i] > array[i+1] --> return 0
        fle.s   t1, ft0, ft1
        bne     t1, zero, loop_array_is_sorted_float

        li      a0, 0
        ret
        

    end_array_is_sorted_float:

        # array is sorted --> return 1
        li      a0, 1
        ret

#endif // FLOAT_TYPE