#!/usr/bin/env bash
set -euo pipefail

echo "=== Neovim Setup ==="
echo ""

# Detect OS
if command -v dnf &>/dev/null; then
    OS="fedora"
elif command -v apt-get &>/dev/null; then
    OS="debian"
elif command -v pacman &>/dev/null; then
    OS="arch"
else
    echo "Unsupported OS. Install dependencies manually."
    exit 1
fi

echo "Detected: $OS"
echo ""

# Install dependencies
echo "[1/5] Installing system dependencies..."
case "$OS" in
fedora)
    sudo dnf install -y \
        neovim git curl ripgrep fd-find \
        python3 python3-pip nodejs npm \
        gcc gcc-c++ make
    ;;
debian)
    sudo apt-get update
    sudo apt-get install -y \
        neovim git curl ripgrep fd-find \
        python3 python3-pip python3-venv nodejs npm \
        build-essential
    ;;
arch)
    sudo pacman -Sy --noconfirm \
        neovim git curl ripgrep fd \
        python python-pip nodejs npm \
        base-devel
    ;;
esac

# Install lazygit
echo ""
echo "[2/5] Installing lazygit..."
if ! command -v lazygit &>/dev/null; then
    LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
    curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf /tmp/lazygit.tar.gz -C /tmp lazygit
    sudo install /tmp/lazygit /usr/local/bin
    rm -f /tmp/lazygit /tmp/lazygit.tar.gz
    echo "lazygit installed"
else
    echo "lazygit already installed"
fi

# Sync plugins
echo ""
echo "[3/5] Installing Neovim plugins..."
nvim --headless -c "Lazy sync" -c "sleep 5" -c "qa"

# Install LSP servers
echo ""
echo "[4/5] Installing LSP servers..."
nvim --headless -c "MasonInstall basedpyright ruff lua_ls" -c "sleep 10" -c "qa"

# Update treesitter
echo ""
echo "[5/5] Installing Treesitter parsers..."
nvim --headless -c "TSUpdate" -c "sleep 5" -c "qa"

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Run 'nvim' to start editing!"
echo ""
