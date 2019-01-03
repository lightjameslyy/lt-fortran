!******************************************************************************
! FILE: omp_getEnvInfo.f
! DESCRIPTION:
!   OpenMP Example - Get Environment Information - Fortran Version
!   The master thread queries and prints selected environment information.
! AUTHOR: Blaise Barney  7/06
! LAST REVISED: 06/04/17
!******************************************************************************

PROGRAM GETINFO

INTEGER NTHREADS, TID, OMP_GET_NUM_THREADS, PROCS, MAXT, OMP_GET_THREAD_NUM, OMP_GET_NUM_PROCS, OMP_GET_MAX_THREADS

LOGICAL INPAR, DYNAMIC, NESTED, OMP_IN_PARALLEL, OMP_GET_DYNAMIC, OMP_GET_NESTED

!$OMP PARALLEL PRIVATE(NTHREADS, TID)

    TID = OMP_GET_THREAD_NUM()

    IF (TID .EQ. 0) THEN

        PRINT *, 'Thread',tid,'getting environment information'

        PROCS = OMP_GET_NUM_PROCS() 
        NTHREADS = OMP_GET_NUM_THREADS()
        MAXT = OMP_GET_MAX_THREADS()
        INPAR = OMP_IN_PARALLEL()
        DYNAMIC = OMP_GET_DYNAMIC()
        NESTED = OMP_GET_NESTED()

        PRINT *, 'Number of processors = ', PROCS
        PRINT *, 'Number of threads = ', NTHREADS
        PRINT *, 'Max threads = ', MAXT
        PRINT *, 'In parallel? = ', INPAR
        PRINT *, 'Dynamic threads enabled? = ', DYNAMIC
        PRINT *, 'Nested parallelism enabled? = ', NESTED

    END IF

!$OMP END PARALLEL
END PROGRAM GETINFO


