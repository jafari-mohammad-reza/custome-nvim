-- Font configuration with ligatures
-- Note: You need to install a Nerd Font with ligatures support
-- Recommended fonts:
-- - JetBrains Mono Nerd Font (has ligatures)
-- - Fira Code Nerd Font (popular for ligatures)
-- - Cascadia Code Nerd Font (Microsoft's font with ligatures)
--
-- Install with:
-- brew tap homebrew/cask-fonts
-- brew install --cask font-jetbrains-mono-nerd-font
-- or
-- brew install --cask font-fira-code-nerd-font

-- This file just sets up font settings for GUI neovim
-- For terminal neovim, configure your terminal emulator to use a Nerd Font

-- Set GUI font if using neovide or other GUI
if vim.g.neovide then
  vim.o.guifont = "JetBrainsMono Nerd Font:h14"
  vim.g.neovide_cursor_vfx_mode = "railgun"
end

-- Return empty table to satisfy lazy.nvim (no actual plugin to load)
return {}
