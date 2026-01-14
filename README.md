# Neovim Config

Personal Neovim configuration by [lucasdetoledo4](https://github.com/lucasdetoledo4).

## Quick Install

```bash
# Clone config
git clone https://github.com/lucasdetoledo4/nvim ~/.config/nvim

# Run install script
cd ~/.config/nvim && ./install.sh
```

## Manual Install

### 1. Dependencies

**Fedora:**
```bash
sudo dnf install -y neovim git ripgrep fd-find python3 nodejs npm gcc gcc-c++
```

**Ubuntu/Debian:**
```bash
sudo apt install -y neovim git ripgrep fd-find python3 python3-pip nodejs npm build-essential
```

**Arch:**
```bash
sudo pacman -S neovim git ripgrep fd python nodejs npm base-devel
```

### 2. Install lazygit

```bash
LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit && sudo install lazygit /usr/local/bin && rm -f lazygit lazygit.tar.gz
```

### 3. First Launch

```bash
nvim
# Wait for plugins to install, then:
:Lazy sync
:MasonInstall basedpyright ruff lua_ls
:TSUpdate
```

## Keybindings

Leader key: `Space`

### Files & Search
| Key | Action |
|-----|--------|
| `Space f f` | Find files |
| `Space f g` | Live grep |
| `Space f r` | Recent files |
| `Space f b` | Find buffers |
| `Space e` | File explorer (Oil) |

### Buffers
| Key | Action |
|-----|--------|
| `Shift h/l` | Previous/Next buffer |
| `Space 1-5` | Jump to buffer 1-5 |
| `Space b d` | Close buffer |

### LSP
| Key | Action |
|-----|--------|
| `g d` | Go to definition |
| `g r` | Find references |
| `K` | Hover docs |
| `Space r` | Rename |
| `Space c a` | Code actions |
| `Space d` | Show diagnostic |

### Git
| Key | Action |
|-----|--------|
| `Space g g` | LazyGit |
| `Space g d` | Diff view |
| `Space g h` | File history |

### Editing
| Key | Action |
|-----|--------|
| `Space w` | Save |
| `Space q` | Quit |
| `Space h` | Clear search |
| `Alt j/k` | Move line down/up |
| `g c c` | Comment line |

### Python
| Key | Action |
|-----|--------|
| `Space r r` | Run Python file |
| `Space r u` | Run with uv |
| `Space v s` | Select venv |
| `Space n f` | Generate function docstring |
| `Space n c` | Generate class docstring |

## Troubleshooting

### Plugins not installing
```bash
rm -rf ~/.local/share/nvim/lazy
nvim
:Lazy sync
```

### LSP not working
```vim
:LspInfo
:LspRestart
:Mason
```

### Treesitter errors
```vim
:TSUpdate
```

### Clear all cache
```bash
rm -rf ~/.local/state/nvim ~/.cache/nvim
```

## Structure

```
~/.config/nvim/
├── init.lua                 # Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua      # Editor options
│   │   ├── keymaps.lua      # Key mappings
│   │   ├── autocmds.lua     # Auto commands
│   │   └── lazy.lua         # Plugin manager
│   └── plugins/             # Plugin configs
├── install.sh               # Install script
└── README.md                # This file
```

## Updating

```vim
:Lazy sync          " Update plugins
:TSUpdate           " Update treesitter
:Mason              " Update LSPs (press U)
```
