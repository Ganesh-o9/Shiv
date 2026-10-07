FROM python:3.10-slim

WORKDIR /usr/src/app

RUN apt-get update && \
    apt-get install -y ffmpeg git && \
    rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

CMD ["sh", "-c", "gunicorn app:app & python3 main2.py"]
