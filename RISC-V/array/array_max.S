/* ---------------------------------------------------------------------------------------------------------------
*
*  TYPE array_max(TYPE *array, size_t const start, size_t const end);
*
*  get the maximum value of the array
*
--------------------------------------------------------------------------------------------------------------- */


# array_max_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global array_max_int
    .type array_max_int, @function
    .text


    array_max_int:

        # load zero
        li      t0, 0

        # check the indexes
        bgt     a1, a2, end_array_max_int

        # push on stack
        addi    sp, sp, -24
        sd      a0, 0(sp)
        sw      a1, 8(sp)
        sw      a2, 12(sp)
        sd      ra, 16(sp)

        # call array_is_sorted(array, start, end)
        jal     array_is_sorted_int
        li      t0, 1
        mv      t1, a0

        # pop from stack
        ld      a0, 0(sp)
        lw      a1, 8(sp)
        lw      a2, 12(sp)
        ld      ra, 16(sp)
        addi    sp, sp, 24

        # array_is_sorted --> max = array[end]
        beq     t0, t1, sorted_array_max_int

        # load start
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # get max
        add     t1, a0, a1
        lw      t0, 0(t1)
        addi    a1, a1, 4

        # go to the loop
        j       loop_array_max_int
        

    loop_array_max_int:

        # while (i <= end)
        bgt     a1, a2, end_array_max_int

        # load array[i]
        add     t1, a0, a1
        lw      t2, 0(t1)

        # i++
        addi    a1, a1, 4

        # array[i] > max --> max = array[i]
        bge     t0, t2, loop_array_max_int
        mv      t0, t2

        # go to the loop
        j       loop_array_max_int
        

    sorted_array_max_int:

        # max = array[end]
        slli    a2, a2, 2
        add     a0, a0, a2
        lw      a0, 0(a0)
        ret


    end_array_max_int:

        # return max
        mv      a0, t0
        ret            

#endif // INT_TYPE


# array_max_float()
/* ========================= FLOAT ========================= */
#ifdef FLOAT_TYPE

    .global array_max_float
    .type array_max_float, @function
    .text


    array_max_float:

        # load zero
        fmv.w.x     fa0, zero

        # check the indexes
        bgt     a1, a2, end_array_max_float

        # push on stack
        addi    sp, sp, -24
        sd      a0, 0(sp)
        sw      a1, 8(sp)
        sw      a2, 12(sp)
        sd      ra, 16(sp)

        # call array_is_sorted(array, start, end)
        jal     array_is_sorted_float
        li      t0, 1
        mv      t1, a0

        # pop from stack
        ld      a0, 0(sp)
        lw      a1, 8(sp)
        lw      a2, 12(sp)
        ld      ra, 16(sp)
        addi    sp, sp, 24

        # array_is_sorted --> max = array[end]
        beq     t0, t1, sorted_array_max_float

        # load start
        slli    a1, a1, 2

        # load end
        slli    a2, a2, 2

        # get max
        add     t0, a0, a1
        flw     fa0, 0(t0)
        addi    a1, a1, 4

        # go to the loop
        j       loop_array_max_float

        
    loop_array_max_float:

        # while (i <= end)
        bgt     a1, a2, end_array_max_float

        # load array[i]
        addi    t0, t0, 4
        flw     ft0, 0(t0)

        # i++
        addi    a1, a1, 4
            
        # array[i] > max --> max = array[i]
        fge.s   t1, fa0, ft0
        bne     t1, zero, loop_array_max_float
        fmv.s   fa0, ft0

        # go to the loop
        j       loop_array_max_float

        
    sorted_array_max_float:

        # max = array[end]
        slli    a2, a2, 2
        add     a0, a0, a2
        flw     fa0, 0(a0)
        ret
        
    end_array_max_float:

        # return max
        ret

#endif // FLOAT_TYPE