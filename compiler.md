
# GCC

helpfull flags:
  * -fopt-info-optall-all - показывает результаты оптимизиции, и причины если не удалось их применить. 

gcc -O3 -fopt-info-vec-optimized -S -c file.c -o file.s

# Optimization

## Clang 

clang -O2 -S -fverbose-asm 

clang -O3 -mtune=native -mavx2 -Rpass=loop-vectorize -S -c file.c -o file.s

## GCC + llvm-mca 

gcc -O3 -mtune=native -fvect-cost-model=unlimited -S -c file.c -o - | llvm-mca -mcpu=native -timeline -bottleneck-analysis | less 


# Perf

perf record -e branch-misses -g ./benchmark
perf stat -e L1-icache-load-misses ./benchmark


