# 🎮 Complete Keybindings Reference

## 🤖 Copilot (AI Suggestions)

- **`Tab`** - Accept full Copilot suggestion (MAIN)
- `Ctrl+J` - Accept full suggestion (alternative)
- `Ctrl+Right` - Accept word by word
- `Ctrl+Down` - Accept line by line
- `Alt+]` - Next suggestion
- `Alt+[` - Previous suggestion
- `Ctrl+]` - Dismiss suggestion

**Note:** Suggestions appear as gray text while typing. Just press Tab to accept!

---

## 📁 File Navigation & Explorer

- **`Space + Space`** - Toggle file tree (left sidebar)
- `Space + e` - Find current file in tree
- **`Space + ff`** - Find files (centered popup)
- `Space + fg` - Search text in all files (live grep)
- `Space + ft` - Find text under cursor
- `Space + fw` - Search in current buffer
- `Space + fb` - Find open buffers
- `Space + fr` - Recent files
- `Space + fc` - Git commits
- `Space + fs` - Git status

---

## 🔍 Search & Replace

- **`Space + sr`** - Open search & replace panel
- **`Space + sw`** - Search current word across project
- **`Space + sp`** - Search & replace in current file

**In Spectre panel:**

- `dd` - Toggle line to include/exclude
- `Enter` - Jump to file
- `Space + c` - Replace all
- `Space + rc` - Replace current line
- `Space + R` - Run replace all

---

## 🪟 Window Splits

- **`Space + |`** - Split vertically + pick file (centered popup)
- **`Space + _`** - Split horizontally + pick file (centered popup)
- `Ctrl+h/j/k/l` - Navigate between windows
- `Ctrl+Up/Down/Left/Right` - Resize windows
- `Shift+h/l` - Previous/Next buffer

---

## 💻 Terminal

- **`Space + t`** - Toggle floating terminal
- **`Esc`** or `jk` - Exit terminal insert mode (in terminal)
- `Ctrl+h/j/k/l` - Navigate between windows (works in terminal too)

---

## ⚡ LSP (Code Intelligence)

- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Hover documentation
- **`F2`** or **`Space + Enter`** - Rename symbol (all usages)
- `Space + rn` - Rename symbol (alternative)
- **`Space + ca`** - Code actions (fix, organize imports, etc.)
- `Space + f` - Format file
- `]d` / `[d` - Next/Previous diagnostic (error/warning)
- `Space + e` - Show diagnostic details

---

## 🎯 Git (Gitsigns)

- `]c` / `[c` - Next/Previous changed hunk
- `Space + gs` - Stage hunk
- `Space + gr` - Reset hunk
- `Space + gp` - Preview hunk
- `Space + gb` - Show full git blame
- `Space + gd` - Git diff
- **Git blame shows inline automatically**

---

## ✏️ Editing

- `gcc` - Comment/uncomment line
- `gc` - Comment operator (e.g., `gc2j` comments 2 lines)
- `<` / `>` - Indent left/right (in visual mode, stays selected)
- `J` / `K` - Move selected lines up/down (in visual mode)
- `Ctrl+d` / `Ctrl+u` - Scroll down/up (keeps cursor centered)
- **Format on save is automatic** ✅

---

## 💾 Basic Operations

- `Space + w` - Save file
- `Space + q` - Quit
- `Esc` - Clear search highlight
- `:` - Command mode

---

## 🎨 Status Bar Info

**Top Bar (Winbar):**

```
~/path/to/file.go    E:2 W:5
```

- Full file path
- Error count (E:)
- Warning count (W:)

**Bottom Bar:**

```
NORMAL  main  +3 ~2 -1  E:2 W:5  UTF-8  unix  go  50%  10:25
```

- Mode (NORMAL, INSERT, VISUAL)
- Git branch
- Git diff (+added ~modified -deleted)
- Diagnostics (E:errors W:warnings)
- File encoding
- File format
- File type
- Progress %
- Cursor position

---

## 🚀 Quick Workflows

### Accept AI Suggestion

1. Start typing
2. Gray text appears (Copilot suggestion)
3. Press **`Tab`** to accept ✅

### Rename Variable/Function

1. Put cursor on symbol
2. Press **`F2`** or **`Space + Enter`**
3. Type new name + Enter
4. All usages renamed! ✅

### Search & Replace Across Project

1. Press **`Space + sr`**
2. Type search term
3. Type replacement
4. Press **`Space + c`** to replace all ✅

### Open Terminal

1. Press **`Space + t`**
2. Run commands
3. Press **`Esc`** to exit insert mode
4. Press **`Space + t`** again to close ✅

### Split Window & Open File

1. Press **`Space + |`** (vertical) or **`Space + _`** (horizontal)
2. Centered popup appears
3. Type to search, select file with arrows
4. Press **`Enter`** ✅

### Format Code

- Just save! **`Space + w`** - auto-formats on save ✅
- Or manual: **`Space + f`**

### Fix Errors

1. Press **`]d`** to jump to error
2. Press **`Space + ca`** for code actions
3. Select fix from menu ✅

### Stage Git Changes

1. Press **`]c`** to jump to changed lines
2. Press **`Space + gp`** to preview
3. Press **`Space + gs`** to stage ✅

---

## 💡 Tips

- **Tab completes everything**: Copilot suggestions, autocomplete, snippets
- **Centered popups**: File picker and search appear in center of screen
- **Format on save**: No need to manually format - happens automatically
- **Git blame inline**: Always visible at end of each line
- **Status bars**: Top shows errors/warnings, bottom shows git + diagnostics
- **Terminal is floating**: Appears as overlay, doesn't mess with your layout
- **Search & replace preview**: See exactly what will change before replacing

---

## 🎯 Most Used Keybindings (Start Here!)

1. **`Tab`** - Accept AI suggestion
2. **`Space + Space`** - Toggle file tree
3. **`Space + ff`** - Find files
4. **`Space + fg`** - Search in files
5. **`Space + t`** - Toggle terminal
6. **`Space + sr`** - Search & replace
7. **`F2`** - Rename symbol
8. **`Space + ca`** - Code actions
9. **`gd`** - Go to definition
10. **`Space + w`** - Save (auto-formats)

---

Enjoy your supercharged Neovim! 🚀
