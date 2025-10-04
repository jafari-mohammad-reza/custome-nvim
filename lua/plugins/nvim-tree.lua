-- File explorer
return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader><space>", "<cmd>NvimTreeToggle<cr>", desc = "Toggle file explorer" },
    { "<leader>e", "<cmd>NvimTreeFindFile<cr>", desc = "Find current file in tree" },
  },
  config = function()
    -- Disable netrw
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    require("nvim-tree").setup({
      view = {
        width = 35,
        side = "left",
      },
      renderer = {
        group_empty = true,
        icons = {
          git_placement = "after",
        },
      },
      filters = {
        dotfiles = false,
        custom = { "^\\.git$" },  -- Hide .git folder
      },
      git = {
        enable = true,
        ignore = false,
      },
    })
  end,
}
