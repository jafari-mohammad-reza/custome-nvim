-- Plugin setup with lazy.nvim
require("lazy").setup({
  -- Import all plugin specs from lua/plugins/
  spec = {
    { import = "plugins" },
  },
  -- Automatically check for plugin updates
  checker = {
    enabled = true,
    notify = false,
  },
  -- UI settings
  ui = {
    border = "rounded",
  },
  -- Performance
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
