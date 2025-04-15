#!/bin/bash

echo "🚀 Starting Docker clean install..."

# 🔥 Remove Docker if installed via Snap
if snap list | grep -q docker; then
    echo "❌ Removing Snap version of Docker..."
    sudo snap remove docker
fi

# ✅ Install required packages
echo "📦 Installing dependencies..."
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release

# ✅ Add Docker’s official GPG key
echo "🔑 Adding Docker GPG key..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
  sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# ✅ Set up the Docker repository
echo "📁 Adding Docker repo..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
  https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# ✅ Install Docker Engine + Compose
echo "🔧 Installing Docker Engine and Compose..."
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# ✅ Enable and start Docker
sudo systemctl enable docker
sudo systemctl start docker

# ✅ Add current user to docker group (optional)
sudo usermod -aG docker $USER

# ✅ Test Docker
echo "✅ Docker version:"
docker --version

echo "✅ Docker Compose version:"
docker compose version

echo "🎉 Docker installation complete! You may need to logout and login again to use Docker without sudo."
