-- Fuzzy finder with centered floating window
return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  cmd = "Telescope",
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>ft", "<cmd>Telescope grep_string<cr>", desc = "Find text under cursor" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
    { "<leader>fc", "<cmd>Telescope git_commits<cr>", desc = "Git commits" },
    { "<leader>fs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>fw", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Find in current buffer" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- Centered floating window layout
        layout_strategy = "center",
        layout_config = {
          center = {
            height = 0.5,
            width = 0.7,
            preview_cutoff = 40,
          },
        },
        borderchars = {
          prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          results = { "─", "│", "─", "│", "╭", "╮", "┤", "├" },
          preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<Esc>"] = actions.close,
          },
          n = {
            ["q"] = actions.close,
          },
        },
        file_ignore_patterns = { "node_modules", ".git/", "%.lock" },
        sorting_strategy = "ascending",
        prompt_prefix = "🔍 ",
        selection_caret = "➤ ",
      },
      pickers = {
        find_files = {
          hidden = true,
          theme = "dropdown",
          previewer = false,
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
        },
        live_grep = {
          -- Use vim previewer instead of treesitter to avoid ft_to_lang error
          previewer = false,
        },
        grep_string = {
          -- Use vim previewer instead of treesitter to avoid ft_to_lang error
          previewer = false,
        },
      },
    })

    -- Load fzf extension for better performance
    telescope.load_extension("fzf")
  end,
}
