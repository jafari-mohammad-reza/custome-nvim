# Neovim Configuration

A simple, feature-rich Neovim configuration with modern LSP support and Git integration.

## Features

### 🎨 UI & Themes

- **Colorscheme**: Catppuccin (Mocha flavor)
- **Statusline**: Lualine with git info and diagnostics
- **File Explorer**: nvim-tree
- **Fuzzy Finder**: Telescope

### 🔧 Language Support (LSP)

- **Go** (gopls)
- **TypeScript/JavaScript** (ts_ls)
- **Docker** (dockerls)
- **Docker Compose** (docker_compose_language_service)
- **YAML** (yamlls)
- **JSON** (jsonls)
- **Lua** (lua_ls)

### 🔥 Git Integration

- **Gitsigns**: Shows changed lines in the sign column
- **Git Blame**: Inline git blame (enabled by default)
- **Hunk Navigation**: Jump between changes
- **Stage/Reset**: Stage or reset hunks directly from Neovim

### 🤖 AI Integration

- **GitHub Copilot**: AI-powered code suggestions

### ⚡ Other Features

- Treesitter for better syntax highlighting
- Auto-completion with nvim-cmp
- Auto-pairs for brackets
- Easy commenting with Comment.nvim
- Which-key for keybinding hints

## Installation

1. Make sure you have Neovim >= 0.9.0 installed
2. Backup your existing config if you have one
3. This config will auto-install plugins on first launch
4. Run `:checkhealth` to verify everything is working

## First Time Setup

1. Open Neovim: `nvim`
2. Wait for lazy.nvim to install plugins (automatic)
3. Run `:Mason` to verify LSP servers are installed
4. For Copilot: Run `:Copilot setup` and authenticate

## Key Mappings

### Leader Key

`<Space>` is the leader key

### General

- `<leader>w` - Save file
- `<leader>q` - Quit
- `<Esc>` - Clear search highlight

### Navigation

- `<C-h/j/k/l>` - Navigate between windows
- `<S-h/l>` - Previous/Next buffer
- `<C-d/u>` - Scroll down/up (centered)

### File Operations

- `<leader>e` - Toggle file explorer
- `<leader>ff` - Find files
- `<leader>fg` - Live grep (search in files)
- `<leader>fb` - Find buffers
- `<leader>fr` - Recent files

### LSP

- `gd` - Go to definition
- `gD` - Go to declaration
- `gr` - Go to references
- `gi` - Go to implementation
- `K` - Hover documentation
- `<leader>rn` - Rename symbol
- `<leader>ca` - Code action
- `<leader>f` - Format file
- `[d` / `]d` - Previous/Next diagnostic
- `<leader>e` - Show diagnostic float

### Git (Gitsigns)

- `]c` / `[c` - Next/Previous hunk
- `<leader>gs` - Stage hunk
- `<leader>gr` - Reset hunk
- `<leader>gp` - Preview hunk
- `<leader>gb` - Show full git blame
- `<leader>gd` - Git diff

### Copilot

- `<C-j>` - Accept Copilot suggestion (in insert mode)
- `<M-]>` - Next suggestion
- `<M-[>` - Previous suggestion
- `<C-]>` - Dismiss suggestion

### Commenting

- `gcc` - Toggle line comment
- `gbc` - Toggle block comment
- `gc` - Comment operator (e.g., `gc2j` to comment 2 lines)

### Completion (Insert Mode)

- `<Tab>` - Next completion item / expand snippet
- `<S-Tab>` - Previous completion item
- `<CR>` - Confirm selection
- `<C-Space>` - Trigger completion
- `<C-e>` - Abort completion

## Plugin Management

- `:Lazy` - Open plugin manager
- `:Lazy update` - Update all plugins
- `:Mason` - Open LSP server manager
- `:MasonUpdate` - Update LSP servers

## File Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lua/
│   ├── config/
│   │   ├── options.lua        # Editor settings
│   │   ├── keymaps.lua        # Key mappings
│   │   └── lazy.lua           # Plugin manager setup
│   └── plugins/               # Plugin configurations
│       ├── colorscheme.lua
│       ├── treesitter.lua
│       ├── gitsigns.lua
│       ├── lsp.lua
│       ├── cmp.lua
│       ├── copilot.lua
│       ├── telescope.lua
│       ├── nvim-tree.lua
│       ├── lualine.lua
│       └── ...
└── README.md
```

## Customization

Each plugin is configured in its own file under `lua/plugins/`. To customize:

1. Edit the relevant plugin file
2. Restart Neovim or run `:source %` to reload
3. Run `:Lazy sync` if needed

## Troubleshooting

- Run `:checkhealth` to diagnose issues
- Check `:Lazy` for plugin errors
- Check `:Mason` for LSP server status
- View logs: `:messages` or `~/.local/share/nvim/`

## Requirements

- Neovim >= 0.9.0
- Git
- Node.js (for some LSP servers)
- Go (for gopls)
- ripgrep (for Telescope grep)
- A Nerd Font (for icons)

## Notes

- Git blame is shown inline by default (toggle with gitsigns commands)
- Changed lines are shown in the sign column
- LSP servers auto-install on first use
- Copilot requires authentication on first use
