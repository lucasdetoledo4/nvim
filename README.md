# Neovim Configuration

A modern, feature-rich Neovim setup optimized for Python development with FastAPI, Pydantic, and general programming.

## 📋 Prerequisites

### Required Dependencies

1. **Neovim** (>= 0.9.0)
   ```bash
   # Check version
   nvim --version

   # Install/upgrade with Homebrew
   brew install neovim
   ```

2. **Git**
   ```bash
   git --version
   ```

3. **ripgrep** (for Telescope live grep)
   ```bash
   brew install ripgrep
   ```

4. **lazygit** (for Git TUI)
   ```bash
   brew install lazygit
   ```

5. **Python 3.12+** (for LSP servers)
   ```bash
   python3 --version
   ```

### Optional but Recommended

- **fd** (faster file finding for Telescope)
  ```bash
  brew install fd
  ```

- **Node.js** (some LSP servers may need it)
  ```bash
  brew install node
  ```

---

## 🚀 Installation

### 1. Clone This Config

```bash
# Backup your existing config if you have one
mv ~/.config/nvim ~/.config/nvim.backup

# Clone or copy this config to ~/.config/nvim
# (Assuming you already have it in place)
```

### 2. Configure Git

Fix line ending issues and enable credential storage:

```bash
git config --global core.autocrlf input
git config --global credential.helper store
```

### 3. First Launch

```bash
nvim
```

On first launch:
- **lazy.nvim** will automatically install
- All plugins will be downloaded and installed
- Wait for everything to complete

### 4. Install LSP Servers

After Neovim opens, run:

```vim
:Mason
```

The following servers should auto-install (configured in init.lua):
- **pyright** - Python type checker
- **ruff** - Python linter/formatter
- **lua_ls** - Lua language server

If they don't auto-install, manually install them in Mason with `i`.

### 5. Install Treesitter Parsers

Treesitter parsers should auto-install on first use. To manually trigger:

```vim
:TSInstall python lua vim markdown
```

---

## 🎨 Features

### Color Scheme
- **Gruvbox Material** (hard background, material foreground)

### File Navigation
- **Telescope** - Fuzzy file/text finder
- **Bufferline** - Tab-like buffer display at the top

### Code Intelligence
- **LSP** via Mason + nvim-lspconfig
  - Pyright for Python type checking
  - Ruff for Python linting and formatting
  - Lua LS for Lua/Neovim config
- **nvim-cmp** - Autocompletion with LSP integration
- **Treesitter** - Advanced syntax highlighting

### Git Integration
- **lazygit.nvim** - Full Git TUI
- **diffview.nvim** - Side-by-side diff viewer and file history

### Editor Enhancements
- **flash.nvim** - Jump to any location instantly
- **neoscroll.nvim** - Smooth scrolling
- **nvim-ufo** - Code folding
- **nvim-autopairs** - Auto-close brackets/quotes
- **Comment.nvim** - Easy commenting
- **lualine** - Status line

---

## ⌨️ Keybindings

### Leader Key
- `<Space>` - Leader key

### File Navigation
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |

### Buffer/Tab Navigation
| Key | Action |
|-----|--------|
| `Shift-h` | Previous buffer |
| `Shift-l` | Next buffer |
| `<leader>1-5` | Jump to buffer 1-5 |
| `<leader>bd` | Delete/close buffer |
| `<leader>bb` | Toggle to last buffer |
| `Ctrl-6` | Toggle to last buffer (built-in) |

### Window Navigation
| Key | Action |
|-----|--------|
| `Ctrl-h/j/k/l` | Move between windows |

### LSP
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `K` | Hover documentation |
| `<leader>rn` | Rename symbol |
| `<leader>ca` | Code actions |
| `gr` | Find references |
| `<leader>f` | Format with Ruff |
| `<leader>d` | Show diagnostic float |
| `]d` | Next/previous diagnostic |
| `<leader>dl` | Diagnostic list |

### Git
| Key | Action |
|-----|--------|
| `<leader>gg` | Open lazygit |
| `<leader>gd` | Open diff view |
| `<leader>gc` | Close diff view |
| `<leader>gh` | Git file history |

### Flash (Jump Navigation)
| Key | Action |
|-----|--------|
| `s` + 2 chars | Jump to any location |
| `S` | Jump to Treesitter node |

### Editing
| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `<leader>h` | Clear search highlight |
| `Alt-j/k` | Move line down/up |
| `gcc` | Comment line (Comment.nvim) |
| `gc` (visual) | Comment selection |

### Scrolling
| Key | Action |
|-----|--------|
| `Ctrl-u/d` | Scroll half page (smooth) |
| `Ctrl-b/f` | Scroll full page (smooth) |

---

## 📝 Python Project Setup

For Python projects using `uv`, create a `pyproject.toml` in your project root with:

```toml
[tool.pyright]
venvPath = "."
venv = ".venv"
exclude = [".venv", "**/__pycache__", ".git"]
typeCheckingMode = "basic"
reportMissingImports = true
reportMissingTypeStubs = false
pythonVersion = "3.13"  # or your version
pythonPlatform = "Linux"
```

This tells Pyright where to find your virtual environment and dependencies (FastAPI, Pydantic, etc.).

---

## 🔧 Troubleshooting

### Plugins won't install automatically

If you see "Could not read Username from github" errors:

```bash
# Fix Git config
git config --global credential.helper store
git config --global core.autocrlf input

# Manually sync plugins
nvim
:Lazy sync
```

### LSP warnings: "Module could not be resolved"

Make sure `pyproject.toml` has the `[tool.pyright]` section (see above).

Then restart LSP:
```vim
:LspRestart
```

### Treesitter syntax highlighting not working

```vim
:TSUpdate
:TSInstall python lua vim markdown
```

### Plugin errors with CRLF line endings (WSL)

Already fixed with `git config --global core.autocrlf input`.

If you still see issues:
```bash
find ~/.local/share/nvim/lazy -name "*.vim" -exec sed -i 's/\r$//' {} \;
```

---

## 📦 Plugin List

| Plugin | Purpose |
|--------|---------|
| lazy.nvim | Plugin manager |
| gruvbox-material | Color scheme |
| telescope.nvim | Fuzzy finder |
| nvim-treesitter | Syntax highlighting |
| nvim-lspconfig | LSP client |
| mason.nvim | LSP server installer |
| nvim-cmp | Autocompletion |
| LuaSnip | Snippet engine |
| bufferline.nvim | Buffer tabs |
| lualine.nvim | Status line |
| nvim-autopairs | Auto-close pairs |
| Comment.nvim | Commenting |
| nvim-ufo | Code folding |
| lazygit.nvim | Git TUI wrapper |
| diffview.nvim | Git diff viewer |
| neoscroll.nvim | Smooth scrolling |
| flash.nvim | Jump navigation |

---

## 🎯 Designed For

- **Python development** (FastAPI, Pydantic, uv package manager)
- **Lua/Neovim config editing**
- **General programming**
- **WSL2/Linux environments**

---

## 📄 File Structure

```
~/.config/nvim/
├── init.lua              # Main config file (all-in-one)
├── README.md             # This file
└── lazy-lock.json        # Plugin versions (auto-generated)

~/.local/share/nvim/
└── lazy/                 # Installed plugins
```

---

## 🔄 Updating

### Update all plugins
```vim
:Lazy sync
```

### Update Treesitter parsers
```vim
:TSUpdate
```

### Update LSP servers
```vim
:Mason
# Press 'U' to update all
```

---

## 💡 Tips

1. **First time using Neovim?** Run `:Tutor` for a basic tutorial
2. **Explore keybindings:** Most use `<leader>` (Space) prefix
3. **Check LSP status:** `:LspInfo`
4. **Check Treesitter:** `:TSInstallInfo`
5. **View plugin status:** `:Lazy`
6. **Format on save** is enabled for Python files (via Ruff)

---

## 🤝 Contributing

This is a personal config. Feel free to fork and customize!

## 📜 License

MIT - Do whatever you want with it!
