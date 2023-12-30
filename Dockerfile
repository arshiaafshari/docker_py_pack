# Build stage
FROM python:3.9 as builder

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Production stage
FROM python:3.9-alpine

WORKDIR /app

COPY --from=builder /app .

ENV FLASK_APP=app.py

EXPOSE 5000

CMD ["flask", "run", "--host=0.0.0.0"]