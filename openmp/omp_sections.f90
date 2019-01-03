program test_sections
    
    implicit none
    integer n, i, omp_get_thread_num
    parameter (n=8)
    integer a(n)

    do i = 1, n
        a(i) = 1
    enddo

!$OMP PARALLEL SHARED(a)

!$OMP SECTIONS

!$OMP SECTION
    print *, 'thread ', omp_get_thread_num()
    a(1) = a(1) + 1

!$OMP SECTION
    print *, 'thread ', omp_get_thread_num()
    a(2) = a(2) + 2

!$OMP SECTION
    print *, 'thread ', omp_get_thread_num()
    a(3) = a(3) + 3
    
!$OMP SECTION
    print *, 'thread ', omp_get_thread_num()
    a(4) = a(4) + 4

!$OMP SECTION
    print *, 'thread ', omp_get_thread_num()
    a(5) = a(5) + 5
    
!$OMP SECTION
    print *, 'thread ', omp_get_thread_num()
    a(6) = a(6) + 6

!$OMP SECTION
    print *, 'thread ', omp_get_thread_num()
    a(7) = a(7) + 7

!$OMP SECTION
    print *, 'thread ', omp_get_thread_num()
    a(8) = a(8) + 8

!$OMP END SECTIONS NOWAIT

!$OMP END PARALLEL

    do i = 1, n
        print *, a(i)
    enddo
    
end program test_sections
