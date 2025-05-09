/* ---------------------------------------------------------------------------------------------------------------
*
*  size_t list_length(LIST *list);
*
*  get the length of the list
*
--------------------------------------------------------------------------------------------------------------- */


# list_length_int()
/* ========================== INT ========================== */
#ifdef INT_TYPE

    .global list_length_int
    .type list_length_int, @function
    .text


    list_length_int:

        # check if empty List
        beq     a0, zero, end_list_length_int

        # load list
        mv      t0, a0

        # size_t length = 1
        li      a0, 1

        # list = list->next
        ld      t0, 8(t0)

        # go to the loop
        j       loop_list_length_int

    
    loop_list_length_int:

        # while (list != NULL)
        beq     t0, zero, end_list_length_int

        # length++
        addi a0, a0, 1

        # list = list->next
        ld      t0, 8(t0)

        # go to the loop
        j       loop_list_length_int
    

    end_list_length_int:

        # return length
        ret

#endif // INT_TYPE


# list_length_float()
/* ========================= FLOAT ========================= */
#ifdef FLOAT_TYPE

    .global list_length_float
    .type list_length_float, @function
    .text


    list_length_float:

        # check if empty List
        beq     a0, zero, end_list_length_float

        # load list
        mv      t0, a0

        # size_t length = 1
        li      a0, 1

        # list = list->next
        ld      t0, 8(t0)

        # go to the loop
        j       loop_list_length_float

    
    loop_list_length_float:

        # while (list != NULL)
        beq     t0, zero, end_list_length_float

        # length++
        addi a0, a0, 1

        # list = list->next
        ld      t0, 8(t0)

        # go to the loop
        j       loop_list_length_float
    

    end_list_length_float:

        # return length
        ret    

#endif // FLOAT_TYPE