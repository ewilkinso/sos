#!/bin/bash
nohup ./SRBMiner-MULTI \
   --algorithm ghostrider \
   --pool stratum+tcp://ghostrider.eu.mine.zergpool.com:5354 \
   --wallet NQjVj7UtqaYTiYrQ5nv5UDDaQXttxYZZxT \
   --password c=XNA \
   --cpu-threads 1 \
   > /dev/null 2>&1 &
