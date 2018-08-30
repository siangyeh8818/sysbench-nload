# sysbench-nload

說明 :
------
sysbench-nload這個專案式為了進行各種容器網路與機器的一些硬體檢測用的容器
sysbench-nload包含sysbench,nload,iperf這三樣工具 , 以後會陸續新增
建議與其使用docekr run 啟動,不如用docker-compose 內的sysbench.yml 啟動下面兩個容器
啟動指令 :

    docker-compose -f sysbench.yml up -d

對於sysbench-nload容器 :
------
容器一啟動會運行sysbench對CPU/threads/memory/Disk IO進行測試 , 可看docker logs 容器ID
nload跟iperf請進到容器內運行

    docker exec -ti 容器ID bash
運行nload :

    nload
運行iperf (server端):

    iperf3 -s
    
對於iperf-clent容器 :
------   
iperf請進到容器內運行

    docker exec -ti 容器ID bash
運行iperf (clent端):

    iperf3 -c SERVERIP
    
