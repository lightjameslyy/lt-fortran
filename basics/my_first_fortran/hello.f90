program my_first_program
! purpose: to illustrate some of the basic features of a Fortran program.

    ! declare variables:
    integer :: i, j, k

    ! get i and j
    write(*, *) 'enter the numbers to multiply: '
    read(*, *) i, j

    ! calculate k
    k = i * j

    ! print result k
    write(*, *) 'result: ', k

    ! finish up
    stop
end program my_first_program
