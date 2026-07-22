FROM python:3.11-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    && rm -rf /var/lib/apt/lists/
    
RUN curl -fsSL https://deb.nodesource.com/setup_22.x | bash \
    && apt-get install -y --no-install-recommends nodejs \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app 

COPY pyproject.toml .
RUN pip install --no-cache-dir fastapi uvicorn[standard] apscheduler sqlalchemy pydantic-settings jinja2 python-multipart httpx

COPY node/package.json node/package-lock.json* ./node/
RUN cd node && npm install --production

COPY . .

EXPOSE 8090

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8090"]