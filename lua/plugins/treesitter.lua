-- Treesitter for better syntax highlighting
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- Safely check if treesitter configs module is available
    local has_configs, configs = pcall(require, "nvim-treesitter.configs")
    if not has_configs then
      vim.notify("nvim-treesitter.configs not available, skipping setup", vim.log.levels.WARN)
      return
    end

    configs.setup({
      ensure_installed = {
        "go",
        "typescript",
        "javascript",
        "tsx",
        "json",
        "yaml",
        "dockerfile",
        "lua",
        "vim",
        "vimdoc",
        "markdown",
        "markdown_inline",
        "bash",
        "c",
        "html",
        "css",
        "python",
        "rust",
      },
      auto_install = true,
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
