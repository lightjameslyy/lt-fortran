program test_tasks
    
    implicit none
    integer n, i, omp_get_thread_num
    parameter (n=8)
    integer a(n)

    do i = 1, n
        a(i) = 1
    enddo

!$OMP PARALLEL SHARED(a)

!$OMP SINGLE

!$OMP TASK
    print *, 'thread ', omp_get_thread_num()
    a(1) = a(1) + 1
!$OMP END TASK

!$OMP TASK
    print *, 'thread ', omp_get_thread_num()
    a(2) = a(2) + 2
!$OMP END TASK

!$OMP TASK
    print *, 'thread ', omp_get_thread_num()
    a(3) = a(3) + 3
!$OMP END TASK
    
!$OMP TASK
    print *, 'thread ', omp_get_thread_num()
    a(4) = a(4) + 4
!$OMP END TASK

!$OMP TASK
    print *, 'thread ', omp_get_thread_num()
    a(5) = a(5) + 5
!$OMP END TASK
    
!$OMP TASK
    print *, 'thread ', omp_get_thread_num()
    a(6) = a(6) + 6
!$OMP END TASK

!$OMP TASK
    print *, 'thread ', omp_get_thread_num()
    a(7) = a(7) + 7
!$OMP END TASK

!$OMP TASK
    print *, 'thread ', omp_get_thread_num()
    a(8) = a(8) + 8
!$OMP END TASK

!$OMP END SINGLE NOWAIT

!$OMP END PARALLEL

!$OMP TASKWAIT

!$OMP BARRIER

    do i = 1, n
        print *, a(i)
    enddo
    
end program test_tasks
