# Neovim Setup Guide

Complete setup instructions to get your nvim config working on any machine.

## 1. Install Homebrew (if not already installed)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Follow the post-install instructions to add brew to your PATH.

## 2. Install System Dependencies

```bash
# Core tools
brew install neovim
brew install git
brew install node          # For LSP servers
brew install python3       # For Python support
brew install ripgrep       # For telescope grep
brew install fd            # For telescope file finding
brew install gcc           # For treesitter compilation

# Optional but recommended
brew install fzf           # Fuzzy finder
brew install lazygit       # Git UI (if using lazygit plugin)
brew install gh            # GitHub CLI
```

## 3. Setup Git Credentials

```bash
# Configure git credential helper
git config --global credential.helper store

# Create credentials file (replace with your info)
echo "https://YOUR_GITHUB_USERNAME:YOUR_GITHUB_PAT@github.com" > ~/.git-credentials
chmod 600 ~/.git-credentials
```

**Get your GitHub PAT:** https://github.com/settings/tokens
- Need `repo` scope for private repos

## 4. Clone Your Neovim Config

```bash
# Backup existing config if it exists
[ -d ~/.config/nvim ] && mv ~/.config/nvim ~/.config/nvim.backup

# Clone your config (replace with your repo if you have one)
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim

# OR copy your config manually
# cp -r /path/to/your/nvim/config ~/.config/nvim
```

## 5. Install Lazy.nvim Plugins

```bash
# Bootstrap lazy.nvim (should auto-install on first nvim launch)
# But if you get credential errors, manually clone problematic plugins:

cd ~/.local/share/nvim/lazy

# Completion plugins
git clone https://github.com/hrsh7th/nvim-cmp.git
git clone https://github.com/hrsh7th/cmp-nvim-lsp.git
git clone https://github.com/hrsh7th/cmp-buffer.git
git clone https://github.com/hrsh7th/cmp-path.git
git clone https://github.com/L3MON4D3/LuaSnip.git
git clone https://github.com/saadparwaiz1/cmp_luasnip.git

# LSP plugins
git clone https://github.com/neovim/nvim-lspconfig.git
git clone https://github.com/williamboman/mason.nvim.git
git clone https://github.com/williamboman/mason-lspconfig.nvim.git

# Treesitter
git clone https://github.com/nvim-treesitter/nvim-treesitter.git

# Telescope
git clone https://github.com/nvim-telescope/telescope.nvim.git
git clone https://github.com/nvim-lua/plenary.nvim.git

# UI
git clone https://github.com/folke/zen-mode.nvim.git
git clone https://github.com/folke/trouble.nvim.git

# Git
git clone https://github.com/tpope/vim-fugitive.git

# Editor
git clone https://github.com/windwp/nvim-autopairs.git
git clone https://github.com/numToStr/Comment.nvim.git

# Colorschemes
git clone https://github.com/sainnhe/gruvbox-material.git
```

## 6. First Launch

```bash
# Launch nvim - lazy should install any missing plugins
nvim

# Inside nvim, run:
:Lazy sync
:Mason

# Install LSP servers via Mason (examples)
:MasonInstall lua-language-server
:MasonInstall typescript-language-server
:MasonInstall pyright
```

## 7. Post-Setup Checks

```bash
# Verify nvim version (should be 0.9+)
nvim --version

# Check if LSPs are working
nvim some_file.lua
# Run :LspInfo inside nvim

# Check treesitter
# Run :TSInstallInfo inside nvim
```

## Troubleshooting

### Git credential errors
- Make sure `~/.git-credentials` exists and has the right format
- Run: `git config --global credential.helper store`
- Test with: `git clone https://github.com/hrsh7th/cmp-buffer.git /tmp/test`

### Plugin errors
- Delete `~/.local/share/nvim/lazy` and restart nvim
- Run `:Lazy sync` to reinstall all plugins

### LSP not working
- Run `:Mason` and manually install language servers
- Check `:LspInfo` for errors
- Make sure node/python are in PATH

## Quick One-Liner Setup (after homebrew is installed)

```bash
brew install neovim git node python3 ripgrep fd gcc && \
git config --global credential.helper store && \
nvim
```

Then manually add git credentials and run `:Lazy sync` inside nvim.
