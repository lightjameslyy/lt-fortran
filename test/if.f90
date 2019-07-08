program test_if
    implicit none
    integer :: i

    i = 0
    if (i == 0) print *, 'i = ', i; call lt_dt
    if (i == 0) print *, 'i = ', i; call lt_dt
end program test_if

subroutine lt_dt
    implicit none
    integer,dimension(8) :: lt_values
    character(len=24) :: lt_dt_str

    call date_and_time(VALUES=lt_values)
    write (lt_dt_str,'(i4.4,"-",i2.2,"-",i2.2," ",i2.2,":",i2.2,":",i2.2,".",i3.3)') &
    & lt_values(1), lt_values(2), lt_values(3), lt_values(5), lt_values(6),lt_values(7), lt_values(8)
    print *, '[', lt_dt_str, ']'
    print *, '[', trim(lt_dt_str), ']'
end subroutine lt_dt
