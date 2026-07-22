# TERABOX BACKUP MANAGER

Self-hosted backup manager for TeraBox Premium.

## Stack

- Backend: Python 3.11 + FastAPI
- TeraBox SDK: terabox-api (Node.js via subprocess)
- DB: SQLite + SQLalchemy
- Frontend: Jinja2 + HTMX + Tailwind CDN
- Container: Docker

## Setup 

cp.env.example .env
npm install # em node/
pip install -e 