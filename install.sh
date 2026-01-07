#!/bin/bash
# Neovim dependency installer for WSL/Linux

set -e

echo "Installing Neovim dependencies..."

# Detect package manager
if command -v apt-get &>/dev/null; then
    PKG="apt-get"
    sudo apt-get update -qq 2>/dev/null || true
    sudo apt-get install -y git curl wget build-essential libssl-dev pkg-config unzip 2>/dev/null || true

    # Add Neovim PPA and install
    sudo add-apt-repository -y ppa:neovim-ppa/unstable 2>/dev/null || true
    sudo apt-get update -qq 2>/dev/null || true
    sudo apt-get install -y neovim ripgrep fd-find 2>/dev/null || true
    sudo ln -sf $(which fdfind) /usr/local/bin/fd 2>/dev/null || true

elif command -v dnf &>/dev/null; then
    PKG="dnf"
    sudo dnf install -y git curl wget gcc gcc-c++ make openssl-devel unzip neovim ripgrep fd-find

elif command -v pacman &>/dev/null; then
    PKG="pacman"
    sudo pacman -Sy --noconfirm git curl wget base-devel openssl unzip neovim ripgrep fd
fi

# Install lazygit
if ! command -v lazygit &>/dev/null; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    curl -sLo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit /usr/local/bin
    rm lazygit lazygit.tar.gz
fi

# Install Node.js
if ! command -v node &>/dev/null; then
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - 2>/dev/null || true
    sudo $PKG install -y nodejs 2>/dev/null || true
fi

# Install Python 3
if ! command -v python3 &>/dev/null; then
    sudo $PKG install -y python3 python3-pip python3-venv
fi

# Install Go
if ! command -v go &>/dev/null; then
    wget -q https://go.dev/dl/go1.23.4.linux-amd64.tar.gz
    sudo rm -rf /usr/local/go
    sudo tar -C /usr/local -xzf go1.23.4.linux-amd64.tar.gz
    rm go1.23.4.linux-amd64.tar.gz
    echo 'export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin' >> ~/.bashrc
    export PATH=$PATH:/usr/local/go/bin:$HOME/go/bin
fi

# Install Rust
if ! command -v rustc &>/dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi

# Configure Git
git config --global core.autocrlf input
git config --global credential.helper store

# Install Neovim plugins
echo "Installing Neovim plugins..."
nvim --headless "+Lazy! sync" +qa

# Install LSP servers and formatters
echo "Installing LSP servers and formatters..."
nvim --headless "+MasonInstall pyright ruff prettier goimports gofumpt rustfmt taplo" "+sleep 20" +qa
echo "LSP servers will auto-install on first use..."

# Install Treesitter parsers
echo "Installing Treesitter parsers..."
nvim --headless "+TSUpdateSync" +qa

echo ""
echo "✓ Installation complete!"
echo ""
echo "Next steps:"
echo "  1. Run: source ~/.bashrc"
echo "  2. Launch: nvim"
echo "  3. Check: :checkhealth"
