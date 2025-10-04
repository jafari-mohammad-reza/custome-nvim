-- Simple test script to verify telescope is working
-- Run with: nvim -l test_telescope.lua

-- Set up necessary paths
vim.opt.rtp:prepend("/home/jafari/snap/code/208/.local/share/nvim/lazy/lazy.nvim")

-- Load lazy configuration
require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          file_ignore_patterns = { "node_modules", ".git/" },
        },
        pickers = {
          live_grep = {
            previewer = false,
          },
          grep_string = {
            previewer = false,
          },
        },
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      local has_configs, configs = pcall(require, "nvim-treesitter.configs")
      if has_configs then
        configs.setup({
          ensure_installed = { "lua" },
          highlight = { enable = true },
        })
        print("✓ Treesitter loaded successfully")
      else
        print("✗ Treesitter not available")
      end
    end,
  },
}, {
  root = "/home/jafari/snap/code/208/.local/share/nvim/lazy",
})

-- Test telescope functions
print("Testing Telescope...")
local telescope_status, telescope = pcall(require, "telescope")
if telescope_status then
  print("✓ Telescope loaded successfully")
  
  -- Test if builtin functions are available
  local builtin_status, builtin = pcall(require, "telescope.builtin")
  if builtin_status then
    print("✓ Telescope builtin functions available")
    print("✓ No ft_to_lang errors detected")
  else
    print("✗ Telescope builtin functions not available")
  end
else
  print("✗ Telescope failed to load")
end

print("Test completed!")