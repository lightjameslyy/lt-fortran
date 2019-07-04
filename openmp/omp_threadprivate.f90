program test_threadprivate
    implicit none
    integer a, b, i, tid, omp_get_thread_num
    real*4 x
    integer v
    SAVE

!$OMP THREADPRIVATE(a, x)

    CALL OMP_SET_DYNAMIC(.FALSE.)

    PRINT *, '1st Parallel Region:'

!$OMP PARALLEL PRIVATE(b, tid) COPYIN(a, x)
    tid = omp_get_thread_num()
    a = tid
    b = tid
    x = 1.1 * tid + 1.0
    PRINT *, 'Thread',tid,':   A,B,X=',a,b,x, 'address of a and x:', loc(a),loc(x)
!$OMP END PARALLEL
    PRINT *, '2nd Parallel Region: '

!$OMP PARALLEL PRIVATE(tid)
    ! 因为a和x设为THREADPRIVATE，每次都从master thread中取值copy
    ! 到team threads中，所以下面的a和x都是上面的tid=0那个线程的结果：
    ! a = 0, x = 1.0
    tid = omp_get_thread_num()
    PRINT *, 'Thread',tid,':   A,B,X=',a,b,x, 'address of a and x:', loc(a),loc(x)
!$OMP END PARALLEL

!$OMP PARALLEL PRIVATE(v, tid) 
    tid = omp_get_thread_num()
    PRINT *, 'Thread',tid,':   v=',v
    PRINT *, 'Thread',tid,':   A,B,X=',a,b,x, 'address of a and x:',loc(a),loc(x)
!$OMP END PARALLEL

end program test_threadprivate
