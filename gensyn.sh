#!/bin/bash

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color



echo "📦 Updating server..."
sudo apt update && sudo apt install -y sudo
sudo npm install -g localtunnel

echo "🔧 Installing required packages..."
sudo apt update && sudo apt install -y python3 python3-venv python3-pip curl wget screen git lsof nano unzip iproute2 build-essential gcc g++
[ -f cuda.sh ] && rm cuda.sh; curl -o cuda.sh https://raw.githubusercontent.com/zunxbt/gensyn-testnet/main/cuda.sh && chmod +x cuda.sh && . ./cuda.sh

echo "🚀 Starting Gensyn script..."
screen -S gensyn

echo "📁 Cloning repository..."
git clone https://github.com/gensyn-ai/rl-swarm.git && cd rl-swarm

echo "🚀 Installing Node..."
bash -c "python3 -m venv .venv && . .venv/bin/activate && ./run_rl_swarm.sh"


