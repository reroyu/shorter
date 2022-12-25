FROM python:3
COPY requirements.txt .

RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY backend.py .
COPY style.css .
COPY favicon.ico .
COPY config.yaml .
COPY web-page.html .
COPY oops.html .
COPY cert.pem .
COPY privkey.pem .

CMD ["uvicorn", "backend:app", "--host", "0.0.0.0", "--port", "443", "--ssl-keyfile", "./privkey.pem", "--ssl-certfile", "./cert.pem"]
