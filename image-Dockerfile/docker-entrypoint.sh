#!/bin/bash

echo "1. 測試 CPU 效能"
echo "----------------------------------------------"
sysbench --test=cpu --cpu-max-prime=2000 run
echo "----------------------------------------------"
echo "2. 測試 線程 效能"
echo "----------------------------------------------"
sysbench  --test=threads --num-threads=500 --thread-yields=100 --thread-locks=4 run
echo "----------------------------------------------"
echo "3. 測試 Memory 效能"
echo "----------------------------------------------"
sysbench --test=memory --memory-block-size=8K --memory-total-size=1G --memory-oper=read run
echo "----------------------------------------------"
echo "4. 測試 I/O 效能"
echo "----------------------------------------------"
echo "stage-1: 生成2G測試檔案"
sysbench --test=fileio --num-threads=16 --file-total-size=2G --file-test-mode=rndrw prepare
echo "stage-2: 測試效能"
sysbench --test=fileio --num-threads=20 --file-total-size=2G --file-test-mode=rndrw run
echo "stage-3: 清理測試用文件"
sysbench --test=fileio --num-threads=20 --file-total-size=2G --file-test-mode=rndrw cleanup
echo "----------------------------------------------"
echo "5. 測試 mutex 效能"
echo "----------------------------------------------"
sysbench –test=mutex –num-threads=100 –mutex-num=1000 –mutex-locks=100000 –mutex-loops=10000 run
echo "----------------------------------------------"
echo "完成所有已知測試"

sleep inf
