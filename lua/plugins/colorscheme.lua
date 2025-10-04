-- Kanagawa Dragon colorscheme
return {
  "rebelot/kanagawa.nvim",
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      compile = false,
      undercurl = true,
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = false,
      dimInactive = true,
      terminalColors = true,
      theme = "dragon", -- Load "dragon" variant
      background = {
        dark = "dragon",
        light = "lotus",
      },
    })
    vim.cmd.colorscheme("kanagawa-dragon")
  end,
}
