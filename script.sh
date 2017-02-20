#!/bin/bash
>&2 echo "Serial:"
time ./g_serial $1 $2 $3
>&2 echo "Paralel pe 1 thread:"
export OMP_NUM_THREADS=1
time ./g_omp $1 $2 $3
>&2 echo "Paralel pe 2 threaduri:"
export OMP_NUM_THREADS=2
time ./g_omp $1 $2 $3
>&2 echo "Paralel pe 4 threaduri:"
export OMP_NUM_THREADS=4
time ./g_omp $1 $2 $3
>&2 echo "Paralel pe 8 threaduri:"
export OMP_NUM_THREADS=8
time ./g_omp $1 $2 $3
