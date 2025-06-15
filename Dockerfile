FROM python:3.12-slim

WORKDIR /app
COPY . /app

RUN apt-get update && apt-get install -y awscli && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]

