<h1 align="center">InfraWatch</h1>

<p align="center">
  <img src="https://img.shields.io/badge/languages-5-green" />
  <img src="https://img.shields.io/github/repo-size/ThLuz/InfraWatch?color=blue" />
  <img src="https://img.shields.io/badge/made%20by-ThLuz-success" />
  <img src="https://img.shields.io/github/last-commit/ThLuz/InfraWatch?color=orange" />
  <img src="https://img.shields.io/github/stars/ThLuz/InfraWatch?style=social" />
</p>

---

## ℹ️ About

**InfraWatch** is a robust **hardware monitoring system** developed by [ThLuz](https://github.com/ThLuz), with a focus on performance, automation, and infrastructure observability.  
It aggregates system metrics (CPU, memory, disk, and more) across distributed environments, using efficient scripting and modern web technologies.

Ideal for **DevOps teams**, **SysAdmins**, and **developers** who need real-time visibility into hardware resources.

---

## 💻 Technologies

<p align="center">
  <img src="https://img.shields.io/badge/PHP-777BB4?style=for-the-badge&logo=php&logoColor=white" alt="PHP" />
  <img src="https://img.shields.io/badge/Laravel-FF2D20?style=for-the-badge&logo=laravel&logoColor=white" alt="Laravel" />
  <img src="https://img.shields.io/badge/Vue.js-35495E?style=for-the-badge&logo=vue.js&logoColor=4FC08D" alt="Vue.js" />
  <img src="https://img.shields.io/badge/PowerShell-5391FE?style=for-the-badge&logo=powershell&logoColor=white" alt="PowerShell" />
  <img src="https://img.shields.io/badge/Shell%20Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white" alt="Shell Script" />
</p>

---

## 📁 Project Structure

```
InfraWatch/
├── api-laravel/      # Laravel backend API
├── web-vue/          # Vue.js frontend
└── scripts/          # PowerShell and Shell monitoring scripts
```

---

## 📊 Features

- Real-time hardware monitoring (CPU, RAM, Disk, Network)
- Cross-platform support (Linux/Windows)
- RESTful API for data collection and visualization
- Modular and extensible scripts
- Clean and responsive UI

---

## ▶️ Getting Started

```bash
# Clone the repository
git clone https://github.com/ThLuz/InfraWatch.git
cd InfraWatch
```

### 🔧 Backend (Laravel API)

```bash
cd api-laravel

# Install dependencies
composer install

# Set up environment
cp .env.example .env
php artisan key:generate

# (Optional) Run migrations
php artisan migrate

# Start the API server
php artisan serve
```

### 💻 Frontend (Vue.js)

```bash
cd ../web-vue

# Install dependencies
npm install

# Start development server
npm run dev
```

### 🖥️ Scripts

```bash
cd ../scripts

# Run scripts depending on your OS
# Example:
./monitor.sh         # For Linux/macOS
.\monitor.ps1        # For Windows (PowerShell)
```

---

## 🎨 Preview

<p align="center">
  <img src="https://i.imgur.com/placeholder.png" alt="InfraWatch layout preview (replace this with your screenshot)" />
</p>

---

## 🧠 Author

Developed and maintained by [ThLuz](https://github.com/ThLuz) 💻
