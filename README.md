## Simple Laravel/Symfony/React API Container


# ⚙️ Features

- NGINX
- PHP 8
- Mailpit
- CloudBeaver - Database UI
- Adminer - Dabatabase UI

---

# 📁 Folder Structure

Project/

 ├── backend/ - Symfony .. after app bootstrap by a script in the below section
 ├── frontend/ - React .. after app bootstrap by a script in the below section

 ├── docker/
 │    ├── nginx/
 │    └── php/
 
 ├── scripts/
 │    
 │    └── setup.sh

 ├── docker-compose.yml


# 📥 Installation

## 1. Clone main app - docker container

```bash
$ git clone git@github.com:mokgosi/aedea-app.git
$ cd aedea-app
```

## 1. Setup Application - Docker Container

This script bootstraps your application into a structure shown above in section Folder Structure.
NOTE: You may be required to refer to each repository documentation for specific and unique settings required.

```bash
$ ./scripts/setup.sh
```


✅ Setup completed successfully!"


🌐 Frontend: http://localhost:5173

📦 Backend API: http://localhost:8000/api

📚 Cloudbeaver - Database UI: http://localhost:8978/

📚 Adminer - Database UI: http://localhost:8978/

✉️ Mailpit - SMTP Server: http://localhost:1025

- Host: db
- Username: app
- Password: password
- Database: app


# ⚙️ Complete setup important with important values:

