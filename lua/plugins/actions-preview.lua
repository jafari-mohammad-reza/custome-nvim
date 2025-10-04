-- Better code actions with preview
return {
  "aznhe21/actions-preview.nvim",
  event = "LspAttach",
  config = function()
    local actions_preview = require("actions-preview")
    
    -- Override the default code action with a prettier preview
    vim.keymap.set({ "v", "n" }, "<leader>ca", actions_preview.code_actions, {
      desc = "Code action with preview",
    })
  end,
}
