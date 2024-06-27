FROM nikolaik/python-nodejs:python3.10-nodejs19

RUN apt-get update \
    && apt-get install -y --no-install-recommends ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app/

RUN pip3 install --no-cache-dir -U -r requirements.txt

# تعريف المنفذ الذي يعمل عليه التطبيق
EXPOSE 8000

# الأمر لتشغيل التطبيق
CMD [ "python3", "ZelzalMusic" ]