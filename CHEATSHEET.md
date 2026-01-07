# Neovim Cheat Sheet - Quick Reference

**Leader key:** `Space`

---

## 🚀 MODES

| Key | Mode |
|-----|------|
| `Esc` / `Ctrl-[` | Normal mode (from any mode) |
| `i` | Insert mode (before cursor) |
| `a` | Insert mode (after cursor) |
| `I` | Insert at beginning of line |
| `A` | Insert at end of line |
| `o` | Insert new line below |
| `O` | Insert new line above |
| `v` | Visual mode (character) |
| `V` | Visual line mode |
| `Ctrl-v` | Visual block mode |
| `:` | Command mode |

---

## 🧭 NAVIGATION

### Basic Movement
| Key | Action |
|-----|--------|
| `h j k l` | Left, Down, Up, Right |
| `w` | Next word start |
| `b` | Previous word start |
| `e` | Next word end |
| `W B E` | Same, but WORD (includes punctuation) |
| `0` | Beginning of line |
| `^` | First non-blank character |
| `$` | End of line |
| `gg` | First line of file |
| `G` | Last line of file |
| `42G` or `:42` | Go to line 42 |
| `%` | Jump to matching bracket/paren |

### Relative Line Jumps
| Key | Action |
|-----|--------|
| `5j` | Jump 5 lines down |
| `3k` | Jump 3 lines up |

### Screen Movement
| Key | Action |
|-----|--------|
| `Ctrl-u` | Scroll half page up (smooth) |
| `Ctrl-d` | Scroll half page down (smooth) |
| `Ctrl-b` | Scroll full page up (smooth) |
| `Ctrl-f` | Scroll full page down (smooth) |
| `zz` | Center cursor on screen |
| `zt` | Cursor to top of screen |
| `zb` | Cursor to bottom of screen |
| `H` | Move to top of screen |
| `M` | Move to middle of screen |
| `L` | Move to bottom of screen |

### Jump List
| Key | Action |
|-----|--------|
| `Ctrl-o` | Jump to older position |
| `Ctrl-i` | Jump to newer position |

---

## 🔍 SEARCH

### In-File Search
| Key | Action |
|-----|--------|
| `/pattern` | Search forward |
| `?pattern` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `*` | Search word under cursor (forward) |
| `#` | Search word under cursor (backward) |
| `<leader>h` | Clear search highlight |

### Flash (Jump Navigation)
| Key | Action |
|-----|--------|
| `s` + 2 chars | Jump to any location |
| `S` | Jump to Treesitter node |

### Project-wide (Telescope)
| Key | Action |
|-----|--------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search in files) |
| `<leader>fb` | Find buffers |
| `<leader>fh` | Help tags |

---

## 📝 EDITING

### Insert/Delete
| Key | Action |
|-----|--------|
| `x` | Delete character under cursor |
| `X` | Delete character before cursor |
| `dd` | Delete line |
| `D` | Delete to end of line |
| `C` | Change to end of line |
| `cc` | Change entire line |
| `s` | Substitute character (delete + insert) |
| `S` | Substitute line (delete line + insert) |
| `r` | Replace single character |
| `u` | Undo |
| `Ctrl-r` | Redo |
| `.` | Repeat last change |

### Copy/Paste (Yank/Put)
| Key | Action |
|-----|--------|
| `yy` | Yank (copy) line |
| `Y` | Yank line (same as yy) |
| `p` | Put (paste) after cursor |
| `P` | Put before cursor |
| `"+y` | Yank to system clipboard |
| `"+p` | Paste from system clipboard |

### Text Objects (powerful!)
| Key | Action |
|-----|--------|
| `diw` | Delete inner word |
| `daw` | Delete a word (with space) |
| `ciw` | Change inner word |
| `yiw` | Yank inner word |
| `di"` | Delete inside quotes |
| `da"` | Delete around quotes (includes quotes) |
| `di(` / `dib` | Delete inside parentheses |
| `di{` / `diB` | Delete inside braces |
| `dit` | Delete inside HTML/XML tag |
| `dip` | Delete inner paragraph |
| `das` | Delete a sentence |

**Pattern:** `{operator}{i/a}{object}`
- Operators: `d` (delete), `c` (change), `y` (yank), `v` (visual)
- i/a: `i` (inner), `a` (around/including)
- Objects: `w` (word), `"` `'` `` ` `` (quotes), `( ) { } [ ]`, `t` (tag), `p` (paragraph), `s` (sentence)

### Move Lines
| Key | Action |
|-----|--------|
| `Alt-j` | Move line down |
| `Alt-k` | Move line up |
| `Alt-j` (visual) | Move selection down |
| `Alt-k` (visual) | Move selection up |

### Indentation
| Key | Action |
|-----|--------|
| `>>` | Indent line right |
| `<<` | Indent line left |
| `==` | Auto-indent line |
| `5>>` | Indent 5 lines |
| `>` (visual) | Indent selection |
| `<` (visual) | Unindent selection |

### Commenting
| Key | Action |
|-----|--------|
| `gcc` | Toggle comment line |
| `gc` (visual) | Toggle comment selection |
| `gcap` | Toggle comment paragraph |

---

## 🎯 VISUAL MODE / SELECTION

### Enter Visual Mode
| Key | Action |
|-----|--------|
| `v` | Character-wise visual |
| `V` | Line-wise visual |
| `Ctrl-v` | Block-wise visual |
| `gv` | Reselect last selection |

### Select Text Objects
| Key | Action |
|-----|--------|
| `viw` | Select inner word |
| `vaw` | Select a word (with space) |
| `vi"` | Select inside quotes |
| `va"` | Select around quotes |
| `vi(` | Select inside parentheses |
| `vip` | Select inner paragraph |
| `vit` | Select inside tag |

### Operations in Visual
| Key | Action |
|-----|--------|
| `y` | Yank selection |
| `d` | Delete selection |
| `c` | Change selection |
| `~` | Toggle case |
| `u` | Lowercase |
| `U` | Uppercase |
| `>` | Indent right |
| `<` | Indent left |
| `o` | Go to other end of selection |

---

## 🔄 FIND & REPLACE

### Simple Replace
| Command | Action |
|---------|--------|
| `:%s/old/new/g` | Replace all in file |
| `:%s/old/new/gc` | Replace all with confirmation |
| `:%s/old/new/gi` | Replace all (case insensitive) |
| `:s/old/new/g` | Replace in current line |
| `:'<,'>s/old/new/g` | Replace in visual selection |

### LSP Rename (Smart!)
| Key | Action |
|-----|--------|
| `<leader>r` | Rename symbol (works across files!) |

### Advanced Replace with `cgn` (FASTEST!)
**The fastest way to replace multiple occurrences:**

1. `/pattern` - Search for text (e.g., `/str | datetime`)
2. `cgn` - Change next match
3. Type replacement - (e.g., `datetime | None`)
4. `<Esc>` - Back to normal mode
5. `.` - Repeat for each occurrence (just spam dot!)

**Full sequence:**
```
/str | datetime<Enter>
cgndatetime | None<Esc>
...
```

**Pro tips:**
- `.` automatically finds next match and applies the change
- Skip a match: press `n` then `.` to change the next one
- No plugins needed - built into Vim!

---

## 🗑️ BULK LINE OPERATIONS

### Delete/Keep Lines by Pattern
| Key | Action |
|-----|--------|
| `<leader>dd` | Delete all lines matching pattern |
| `<leader>dk` | Keep only lines matching pattern |

**Usage examples:**
```
<leader>dd → name=        → Deletes all lines with "name="
<leader>dk → IndexModel   → Keeps only lines with "IndexModel"
```

### Built-in Commands (Always Available)
| Command | Action |
|---------|--------|
| `:g/pattern/d` | Delete all lines matching pattern |
| `:v/pattern/d` or `:g!/pattern/d` | Keep only lines matching pattern (inverse) |
| `:'<,'>g/pattern/d` | Delete matching lines in visual selection |
| `:g/^$/d` | Delete all empty lines |
| `:g/^\s*$/d` | Delete all blank lines (with whitespace) |
| `:g/name=/d` | Delete all lines containing "name=" |
| `:g/\<name\>/d` | Delete lines with exact word "name" |

**Common patterns:**
- `^` - Start of line (`:g/^#/d` deletes comment lines)
- `$` - End of line (`:g/;$/d` deletes lines ending with `;`)
- `\<word\>` - Exact word (`:g/\<TODO\>/d`)
- `.*` - Any characters (`:g/^.*import.*$/d`)

**Pro workflow:**
1. `<leader>dd` - Quick interactive deletion
2. Or use `:g/pattern/d` for more control
3. For complex patterns, use regex: `:g/\v(pattern1|pattern2)/d`

---

## 📂 FILES & BUFFERS

### File Operations
| Key | Action |
|-----|--------|
| `<leader>w` | Save file |
| `<leader>q` | Quit |
| `:w` | Save |
| `:q` | Quit |
| `:q!` | Quit without saving |
| `:wq` / `:x` / `ZZ` | Save and quit |
| `:e filename` | Edit file |
| `:e!` | Reload file (discard changes) |

### Buffer Navigation
| Key | Action |
|-----|--------|
| `Shift-h` | Previous buffer |
| `Shift-l` | Next buffer |
| `<leader>bb` / `Ctrl-6` | Toggle last buffer |
| `<leader>bd` | Delete/close buffer |
| `<leader>1` to `<leader>5` | Jump to buffer 1-5 |

### Buffer Management Commands
| Command | Action |
|---------|--------|
| `:ls` / `:buffers` | List all buffers |
| `:b 3` / `:buffer 3` | Go to buffer 3 |
| `:bn` / `:bnext` | Next buffer |
| `:bp` / `:bprevious` | Previous buffer |
| `:bd` / `:bdelete` | Close current buffer |
| `:bd!` | Force close without saving |
| `:bd 3` | Close buffer 3 |
| `:bufdo bd` | Close all buffers |
| `:bn \| bd #` | Close buffer, keep window open |

### File Manager (Oil.nvim)
| Key | Action |
|-----|--------|
| `<leader>e` | Open Oil file manager |
| `-` | Open parent directory |
| `Enter` | Open file or enter directory |
| `Ctrl-v` | Open in vertical split |
| `Ctrl-x` | Open in horizontal split |
| `-` (in Oil) | Go to parent directory |

**In Oil buffer (edit like text!):**
| Action | How |
|--------|-----|
| Rename file | `ciw` → type new name → `Esc` → `:w` |
| Delete file | `dd` → `:w` |
| Create file | `o` → type name → `Esc` → `:w` |
| Move file | `dd` → navigate → `p` → `:w` |
| Batch rename | `:%s/old/new/g` → `:w` |
| Toggle hidden | `g.` |
| Show help | `g?` |

**Oil workflow example:**
1. `<leader>e` - Open Oil
2. `ciw` - Change filename
3. Type new name → `Esc`
4. `:w` - Apply changes (renames file!)

See `OIL_TUTORIAL.md` for complete guide.

---

## 🪟 WINDOWS & SPLITS

### Create Splits
| Key | Action |
|-----|--------|
| `:split` / `:sp` | Horizontal split |
| `:vsplit` / `:vs` | Vertical split |
| `Ctrl-w s` | Horizontal split |
| `Ctrl-w v` | Vertical split |

### Navigate Splits
| Key | Action |
|-----|--------|
| `Ctrl-h` | Move to left split |
| `Ctrl-j` | Move to bottom split |
| `Ctrl-k` | Move to top split |
| `Ctrl-l` | Move to right split |
| `Ctrl-w w` | Cycle through splits |

### Resize Splits
| Key | Action |
|-----|--------|
| `Ctrl-w +` | Increase height |
| `Ctrl-w -` | Decrease height |
| `Ctrl-w >` | Increase width |
| `Ctrl-w <` | Decrease width |
| `Ctrl-w =` | Equal size splits |
| `Ctrl-w _` | Maximize height |
| `Ctrl-w |` | Maximize width |

### Close Splits
| Key | Action |
|-----|--------|
| `Ctrl-w q` / `:q` | Close current split |
| `Ctrl-w o` / `:only` | Close all other splits |

---

## 🔧 LSP (Language Server)

| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `K` | Hover documentation |
| `<leader>r` | Rename symbol |
| `<leader>ca` | Code actions |
| `<leader>f` | Format with Ruff |
| `<leader>d` | Show diagnostic float |
| `]d` | Next diagnostic |
| `[d` | Previous diagnostic |
| `<leader>dl` | Diagnostic list |

### LSP Commands
| Command | Action |
|---------|--------|
| `:LspInfo` | Show LSP status |
| `:LspRestart` | Restart LSP server |
| `:Mason` | Open Mason (LSP installer) |

---

## 🌳 GIT

| Key | Action |
|-----|--------|
| `<leader>gg` | Open lazygit |
| `<leader>gd` | Git diff view |
| `<leader>gc` | Close diff view |
| `<leader>gh` | Git file history |

---

## 📐 FOLDING

| Key | Action |
|-----|--------|
| `za` | Toggle fold |
| `zo` | Open fold |
| `zc` | Close fold |
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zr` | Open one fold level |
| `zm` | Close one fold level |
| `z1` | Show only level 1 |
| `z2` | Show levels 1-2 |
| `zj` | Move to next fold |
| `zk` | Move to previous fold |

---

## 🎨 COLORSCHEME

| Key | Action |
|-----|--------|
| `<leader>tc` | Toggle between Gruvbox Material and VSCode themes |
| `:colorscheme gruvbox-material` | Switch to Gruvbox Material |
| `:colorscheme vscode` | Switch to VSCode dark theme |

**Default:** Gruvbox Material (warm, retro colors)
**Alternative:** VSCode (modern, bright colors)

---

## 🎨 MACROS

| Key | Action |
|-----|--------|
| `qa` | Start recording macro in register 'a' |
| `q` | Stop recording |
| `@a` | Play macro 'a' |
| `@@` | Replay last macro |
| `5@a` | Play macro 'a' 5 times |

**Example:**
1. `qa` - start recording
2. Do some edits
3. `q` - stop recording
4. `@a` - replay the macro

---

## 💡 AUTOCOMPLETE

| Key | Action |
|-----|--------|
| `Ctrl-Space` | Trigger completion |
| `Enter` | Confirm selection |
| `Tab` | Next completion |
| `Shift-Tab` | Previous completion |
| `Ctrl-n` | Next item (default) |
| `Ctrl-p` | Previous item (default) |

---

## 🔢 NUMBERS & OPERATORS

### Repeat Commands
| Key | Action |
|-----|--------|
| `5j` | Move down 5 lines |
| `3dd` | Delete 3 lines |
| `10yy` | Yank 10 lines |
| `2w` | Move forward 2 words |
| `d5j` | Delete down 5 lines |

### Math
| Key | Action |
|-----|--------|
| `Ctrl-a` | Increment number |
| `Ctrl-x` | Decrement number |
| `5Ctrl-a` | Increment by 5 |

---

## 🎯 MARKS & JUMPS

### Set Marks
| Key | Action |
|-----|--------|
| `ma` | Set mark 'a' at cursor |
| `mA` | Set global mark 'A' |
| `` `a `` | Jump to mark 'a' |
| `'a` | Jump to line of mark 'a' |
| `:marks` | List all marks |

### Special Marks
| Mark | Meaning |
|------|---------|
| `` `. `` | Last change position |
| `` `" `` | Last exit position |
| `` `[ `` | Start of last change/yank |
| `` `] `` | End of last change/yank |

---

## ⚡ QUICK TIPS

### Most Used Commands
```
h j k l         - Navigate
i a o           - Enter insert mode
Esc             - Exit to normal mode
v               - Visual mode
d y p           - Delete, yank, paste
u Ctrl-r        - Undo, redo
/word           - Search
n N             - Next/previous match
*               - Search word under cursor
ciw diw yiw     - Change/delete/yank word
dd cc yy        - Delete/change/yank line
<leader>ff      - Find files
<leader>fg      - Search in files
gd              - Go to definition
K               - Hover docs
```

### Combine Operators
- `d` + motion = delete
- `c` + motion = change
- `y` + motion = yank
- `v` + motion = select

**Examples:**
- `dw` - delete word
- `d$` - delete to end of line
- `c3w` - change 3 words
- `y5j` - yank 5 lines down

### Pro Workflow
1. Use `*` or `/` to find text
2. Use `n` to jump through matches
3. Use `.` to repeat last change
4. Use `Ctrl-o` / `Ctrl-i` to jump back/forward

---

## 🆘 HELP SYSTEM

| Command | Action |
|---------|--------|
| `:help` | Open help |
| `:help word` | Help for 'word' |
| `:help :command` | Help for command |
| `:help 'option'` | Help for option |
| `Ctrl-]` | Follow help link |
| `Ctrl-o` | Go back |
| `:Tutor` | Interactive Vim tutorial |

---

## 🎓 LEARNING PATH

**Day 1-3: Basics**
- `h j k l` movement
- `i a o` insert modes
- `d y p` delete/yank/paste
- `u .` undo/repeat

**Day 4-7: Motions**
- `w b e` word movement
- `0 $ ^` line movement
- `gg G` file movement
- Combine with operators: `dw` `d$` `y3w`

**Week 2: Text Objects**
- `ciw diw yiw` word operations
- `ci" di" vi"` quote operations
- `dip cip` paragraph operations

**Week 3: Search & Replace**
- `* # n N` search navigation
- `:%s/old/new/g` find/replace
- `<leader>r` LSP rename

**Week 4: Advanced**
- Macros (`qa` ... `q` `@a`)
- Marks (`ma` `` `a ``)
- Splits & windows
- Custom workflow with Telescope/LSP

---

## 📚 EXTERNAL RESOURCES

- `:Tutor` - Built-in interactive tutorial
- `vimtutor` - Command-line tutorial
- https://vim-adventures.com - Game to learn Vim
- https://www.openvim.com - Interactive tutorial

---

**Print this and keep it visible while learning!**

**Most important:** Practice daily. Muscle memory > memorization.
