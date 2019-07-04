FROM python:3.7-slim AS compile-image

RUN apt-get update && apt-get install -y --no-install-recommends build-essential gcc

COPY requirements.txt .
RUN pip install --user -r requirements.txt

FROM python:3.7-slim AS build-image
COPY --from=compile-image /root/.local /root/.local

COPY server.py .
COPY schema.py .
ENV PATH=/root/.local/bin:$PATH

EXPOSE 5000
CMD ["python3", "server.py"]