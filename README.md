# 🐳 Docker & Docker Compose Installer for Ubuntu

This is a simple bash script that fully removes any existing Snap-based Docker installation and installs the **official** Docker Engine and **Docker Compose v2** on Ubuntu.

## ✅ Features

- Removes Snap-installed Docker (if exists)
- Adds the official Docker GPG key and repository
- Installs:
  - Docker Engine
  - Docker CLI
  - Docker Compose v2 (plugin-based)
- Enables and starts Docker as a system service
- Adds your current user to the `docker` group
- Verifies installation with version checks

---

## 📦 Usage

```bash
git clone https://github.com/your-username/docker-installer.git
cd docker-installer

chmod +x install_docker.sh
./install_docker.sh
