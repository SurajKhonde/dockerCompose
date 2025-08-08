# 🐳 Local Dev Databases with Docker Compose

This project sets up **MongoDB**, **MySQL**, **Redis**, and web UIs like **phpMyAdmin** using Docker Compose. It helps developers quickly spin up databases locally with persistent storage and browser-based access for testing and development.

---

## 📦 What's Included?

| Service       | Description                     | Access/Port                      |
|---------------|----------------------------------|----------------------------------|
| MongoDB       | NoSQL database                  | MongoDB Compass → `localhost:27017` |
| MySQL         | Relational database             | Port `3306`                      |
| Redis         | Key-value store (cache)         | Port `6379`                      |
| phpMyAdmin    | Web UI for MySQL                | [http://localhost:8081](http://localhost:8081) |

---

## 🛠 Prerequisites

Make sure the following are installed on your machine:

- [Docker](https://www.docker.com/products/docker-desktop)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Git](https://git-scm.com/downloads)
- (Optional) [MongoDB Compass](https://www.mongodb.com/products/compass) — GUI for MongoDB

---

## 🚀 Setup Instructions

### 1. Clone the Repository

```bash 
git clone https://github.com/SurajKhonde/dockerCompose.git
cd dockerCompose
```
### 2. Use the Setup Script
📝 Make the script executable (only once)
```bash
chmod +x setup.sh
```
### ▶️ Run the Script
```bash
./setup.sh
```
Follow the prompts to:

 - Select which service(s) to run

 - Choose foreground or background mode

 - Automatically start Docker Compose for the selected service(s)

---
 
🧪 Explore the Services
🔹 MongoDB
  - Port: 27017
  - UI Tool: MongoDB Compass
  - Connection String:
```bash
mongodb://localhost:27017/yourDBname
```
🔹 MySQL
  - Port: 3306
  - Default Credentials:
     - User: devuser
     - Password: devpass
     - Database: devdb

Access via phpMyAdmin:
```bash
URL: http://localhost:8081
```
- Server: mysql
   - User: devuser
   - Password: devpass
 🔹 Redis
   - Port: 6379
You can connect to Redis using Redis CLI, code, or tools like RedisInsight.

### 📦 Directory Structure
```bash
dockerCompose/
├── Mongodb/
│   └── docker-compose.yml
├── Mysql/
│   └── docker-compose.yml
├── phpMyAdmin/
│   └── docker-compose.yml
├── Redis/
│   └── docker-compose.yml
├── setup.sh
└── README.md

```
## 🛑 Stopping Containers
  **To stop all running containers started via Docker Compose:**
  ```bash
docker ps     # View running containers
docker stop <container_id>
```
**Or to stop all services cleanly:**
```bash
docker compose down
```
> [!WARNING]
> This setup is meant **only for local development**.  
> Do **not expose** these containers or credentials to the internet in production environments.

## 📬 Maintainer

Crafted with ❤️ by [Suraj Khonde](https://github.com/SurajKhonde)

If you find this project helpful, feel free to ⭐ star the repo, fork it, or contribute.  
Pull requests and suggestions are always welcome!

> 💡 This stack is designed to kickstart your local development — customize it freely to fit your workflow!


git clone https://github.com/SurajKhonde/dockerCompose.git
cd dockerCompose
