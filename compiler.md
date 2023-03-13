
# GCC

helpfull flags:
  * -fopt-info-optall-all - показывает результаты оптимизиции, и причины если не удалось их применить. 

```
gcc -O3 -fopt-info-vec-optimized -S -c file.c -o file.s
```

# Optimization

## Clang 

```
clang -O2 -S -fverbose-asm 

clang -O3 -mtune=native -mavx2 -Rpass=loop-vectorize -S -c file.c -o file.s
```

## GCC + llvm-mca 

```
gcc -O3 -mtune=native -fvect-cost-model=unlimited -S -c file.c -o - | llvm-mca -mcpu=native -timeline -bottleneck-analysis | less 
```

# Perf

```
perf record -e branch-misses -g ./benchmark
perf stat -e L1-icache-load-misses ./benchmark


perf record -a -g ./benchmark
perf report -g fractal


perf record -F 99 -g -- ./benchmark
perf script > out.perf
stackcollapse-perf.pl out.perf > out.folded
flamegraph.pl out.folded > ./perf.svg
perf report -g -i perf.data.


perf stat -e cycles,instructions,cache-references,cache-misses,bus-cycles ./benchmark --clocksource=cpu --name=test --bs=4k --filename=/dev/nvme0n1p4 --direct=1 --ioengine=pvsync2 --hipri --rw=randread --filesize=4G --loops=10
```

# Flamegraph

```
stackcollapse-perf.pl ./result | flamegraph.pl > ./result.svg

```





