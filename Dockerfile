# استخدم صورة بايثون 3.10 أساسية
FROM python:3.10-slim

# تحديد مجلد العمل داخل الحاوية
WORKDIR /app

# نسخ ملفات المتطلبات
COPY requirements.txt .

# تثبيت المتطلبات
RUN pip install --no-cache-dir -r requirements.txt

# نسخ باقي ملفات المشروع
COPY . .

# تعيين متغير البيئة لمنع التوليد التلقائي لـ .pyc files
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# أمر تشغيل التطبيق عبر uvicorn على البورت 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
