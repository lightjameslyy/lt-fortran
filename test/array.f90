program test_array
    implicit none
    integer, allocatable, target :: arr(:), arr_cpy(:)

    allocate(arr(10)); arr = 1

    allocate(arr_cpy(10)); arr_cpy = arr

    print *, 'arr:', arr
    print *, 'arr_cpy:', arr_cpy


end program test_array
