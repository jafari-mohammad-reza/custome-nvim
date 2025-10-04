# 🎨 Updated Neovim Configuration Summary

## 🆕 What's New

### 1. **Kanagawa Dragon Theme** 🐉

- Beautiful, dark theme with excellent contrast
- Italics for comments and keywords
- Perfect for long coding sessions

### 2. **Enhanced Status Bar** 📊

Now shows:

- **Top winbar**: File path + Error/Warning counts (e.g., "E:3 W:5")
- **Bottom statusbar**:
  - Git branch
  - Git changes with icons (+ lines added, modified, removed)
  - Detailed diagnostics with counts
  - File info, encoding, type
  - Cursor position

### 3. **Format on Save** 💾

- **Automatic formatting** when you save files
- **Organize imports** automatically for Go and TypeScript
- Works for all LSP-supported languages

### 4. **Better Rename** ✏️

Rename symbols across all usages with **THREE** keybindings:

- `F2` (standard IDE shortcut)
- `<leader>rn` (Space + rn)
- `<leader><CR>` (Space + Enter) - **YOUR REQUESTED BINDING**

All three will rename the symbol everywhere it's used!

### 5. **Font Ligatures** 🎯

- Configuration ready for fonts with ligatures
- Install script provided: `./install-font.sh`
- Recommended: JetBrains Mono Nerd Font

### 6. **Code Actions Preview** 🔍

- Better code action menu with preview
- Shows what will change before applying
- Use `<leader>ca` to see available actions

---

## 🚀 Quick Start

### Install Font with Ligatures

```bash
cd ~/.config/nvim
./install-font.sh
```

Then configure your terminal to use "JetBrainsMono Nerd Font" and enable ligatures.

### Launch Neovim

```bash
nvim
```

Plugins will auto-install on first launch!

---

## 🎯 Key Features Explained

### Format on Save

- Files are **automatically formatted** when you save (`:w`)
- Go files: Runs `gofumpt` + organizes imports
- TypeScript: Organizes imports + formats
- All languages: Uses LSP formatting

### Rename Refactoring

1. Put cursor on a variable/function/method name
2. Press `F2` or `<leader><CR>` (Space + Enter)
3. Type the new name
4. Press Enter
5. **All usages are renamed across all files!**

### Remove Unused Code

Use code actions to remove unused:

1. Put cursor on unused import/variable/function
2. Press `<leader>ca` (Space + ca)
3. Select "Remove unused..." action
4. Done!

### Status Bar Information

**Top Bar (Winbar):**

```
~/project/main.go    E:2 W:5
```

Shows: file path, error count, warning count

**Bottom Bar:**

```
NORMAL  main  +3 ~2 -1  E:2 W:5 I:0  UTF-8  unix  go  50%  10:25
```

Shows: mode, git branch, git diff, diagnostics, encoding, format, filetype, progress, position

---

## ⌨️ All Keybindings

### Window Splits

- `<leader>|` - Split vertically and prompt for file
- `<leader>_` - Split horizontally and prompt for file

### LSP & Code

- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Hover documentation
- `F2` / `<leader><CR>` / `<leader>rn` - **Rename symbol**
- `<leader>ca` - Code actions (fix, refactor, organize imports)
- `<leader>f` - Format file manually
- `[d` / `]d` - Previous/Next diagnostic
- `<leader>e` - Show diagnostic details

### Git

- `]c` / `[c` - Next/Previous changed hunk
- `<leader>gs` - Stage hunk
- `<leader>gr` - Reset hunk
- `<leader>gp` - Preview hunk
- `<leader>gb` - Show full git blame
- Git blame is **always visible** inline

### Files & Navigation

- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Search in files (grep)
- `<leader>fb` - Find buffers
- `<leader>fr` - Recent files
- `<leader>fc` - Git commits
- `<leader>fs` - Git status

### Window Navigation

- `<C-h/j/k/l>` - Move between windows
- `<S-h/l>` - Previous/Next buffer
- `<C-Up/Down/Left/Right>` - Resize windows

### Basic

- `<leader>w` - Save
- `<leader>q` - Quit
- `gcc` - Comment line
- `gc` - Comment operator

### Copilot

- `<C-j>` - Accept suggestion (Insert mode)
- `<M-]>` / `<M-[>` - Next/Previous suggestion
- `<C-]>` - Dismiss suggestion

---

## 🛠️ Common Workflows

### Refactor a Function Name

1. Cursor on function name
2. Press `F2` or `Space + Enter`
3. Type new name → Enter
4. ✅ All usages updated!

### Remove Unused Imports

1. Save file (`:w`) - auto-organizes imports
2. Or manually: `<leader>ca` → select "Organize Imports"

### Fix Errors

1. `]d` to jump to error
2. `<leader>ca` to see fixes
3. Select fix from menu

### Stage Git Changes

1. Navigate hunks with `]c` / `[c`
2. `<leader>gp` to preview
3. `<leader>gs` to stage hunk

---

## 📦 Installed Features

✅ Kanagawa Dragon theme  
✅ Format on save  
✅ Organize imports on save (Go, TS)  
✅ Git blame inline  
✅ Git change indicators  
✅ LSP for Go, TypeScript, Docker, YAML, JSON  
✅ Copilot integration  
✅ Enhanced status bars (top + bottom)  
✅ Multiple rename keybindings  
✅ Code actions with preview  
✅ Font ligatures support  
✅ Auto-completion  
✅ Fuzzy finder  
✅ File explorer

---

## 🎨 Font Setup

### Recommended Fonts (with ligatures):

1. **JetBrains Mono Nerd Font** ⭐ (recommended)
2. Fira Code Nerd Font
3. Cascadia Code Nerd Font

### Installation:

```bash
# Run the provided script
./install-font.sh

# Or manually:
brew tap homebrew/cask-fonts
brew install --cask font-jetbrains-mono-nerd-font
```

### Terminal Configuration:

**iTerm2:**

1. Preferences → Profiles → Text
2. Font → Change → JetBrainsMono Nerd Font
3. ✅ Check "Use ligatures"

**Alacritty** (`~/.config/alacritty/alacritty.yml`):

```yaml
font:
  normal:
    family: JetBrainsMono Nerd Font
    style: Regular
  size: 14.0
```

**WezTerm** (`~/.wezterm.lua`):

```lua
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.harfbuzz_features = { 'calt=1', 'clig=1', 'liga=1' }
```

---

## 🐛 Troubleshooting

### Ligatures not showing?

1. Verify font is installed: `brew list --cask | grep font`
2. Set terminal font to a Nerd Font with ligatures
3. Enable ligatures in terminal settings
4. Restart terminal and Neovim

### Format on save not working?

1. Check LSP is attached: `:LspInfo`
2. Check formatting is supported: `:lua print(vim.lsp.buf.server_ready())`
3. Install formatters via Mason: `:Mason`

### Rename not working?

1. Ensure LSP is attached: `:LspInfo`
2. Cursor must be on a symbol (variable, function, etc.)
3. Try `<leader>ca` to see if rename is in code actions

### Status bar not showing git info?

1. Make sure you're in a git repository
2. Check gitsigns is loaded: `:Lazy`
3. Stage a change and see if it appears

---

## 📝 Notes

- **Format on save** runs automatically - no need to manually format!
- **Git blame** is always visible at the end of each line
- **Organize imports** happens automatically for Go and TypeScript
- **Rename** works across multiple files in your project
- Use **code actions** (`<leader>ca`) to remove unused code, fix errors, etc.

---

Enjoy your feature-rich, beautifully themed Neovim! 🎉
