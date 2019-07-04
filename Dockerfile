FROM python:3.7

COPY requirements.txt .
RUN pip install --user -r requirements.txt

COPY server.py .
COPY schema.py .

EXPOSE 5000
CMD ["python3", "server.py"]