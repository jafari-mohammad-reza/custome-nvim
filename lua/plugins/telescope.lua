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
    -- LSP-related keybindings
    { "<leader>ld", "<cmd>Telescope lsp_definitions<cr>", desc = "LSP definitions" },
    { "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "LSP references" },
    { "<leader>li", "<cmd>Telescope lsp_implementations<cr>", desc = "LSP implementations" },
    { "<leader>lt", "<cmd>Telescope lsp_type_definitions<cr>", desc = "LSP type definitions" },
    { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document symbols" },
    { "<leader>lw", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace symbols" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")

    telescope.setup({
      defaults = {
        -- Centered floating window layout
        layout_strategy = "flex",
        layout_config = {
          horizontal = {
            width = 0.9,
            height = 0.8,
            preview_width = 0.6,
          },
          vertical = {
            width = 0.9,
            height = 0.9,
            preview_height = 0.6,
          },
        },
        borderchars = {
          prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          results = { "─", "│", "─", "│", "╭", "╮", "┤", "├" },
          preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
        -- Configure preview window
        preview = {
          hide_on_startup = false,
          treesitter = false, -- Disable treesitter to avoid ft_to_lang errors
        },
        -- Global safe buffer previewer to prevent ft_to_lang errors
        buffer_previewer_maker = function(filepath, bufnr, opts)
          opts = opts or {}
          
          -- Safely read file content
          local ok, content = pcall(vim.fn.readfile, filepath)
          if not ok or not content then
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "Error reading file: " .. filepath })
            return
          end
          
          -- Check if this is a grep result by looking for line number in the entry
          local preview_content = content
          local line_num = nil
          
          -- Try to extract line number from the telescope entry
          if opts.entry and opts.entry.lnum then
            line_num = tonumber(opts.entry.lnum)
          elseif opts.entry and opts.entry.row then
            line_num = tonumber(opts.entry.row)
          end
          
          -- If we have a line number (from grep), show context around it
          if line_num and line_num > 0 then
            local context_lines = 5
            local start_line = math.max(1, line_num - context_lines)
            local end_line = math.min(#content, line_num + context_lines)
            
            preview_content = {}
            -- Show context with line numbers and highlight the matched line
            for i = start_line, end_line do
              local line = content[i] or ""
              local prefix = (i == line_num) and ">>> " or "    "
              table.insert(preview_content, string.format("%s%4d: %s", prefix, i, line))
            end
            
            -- Set the cursor to the matched line in the preview
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, preview_content)
            vim.schedule(function()
              local match_line_in_preview = line_num - start_line + 1
              if vim.api.nvim_buf_is_valid(bufnr) then
                vim.api.nvim_win_set_cursor(0, {match_line_in_preview, 0})
              end
            end)
          else
            -- For non-grep results, show the whole file
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, preview_content)
          end
          
          -- Set filetype for basic syntax highlighting
          vim.api.nvim_buf_call(bufnr, function()
            local ft = vim.filetype.match({ filename = filepath, buf = bufnr }) or "text"
            vim.bo[bufnr].filetype = ft
          end)
        end,
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
          -- Enable floating preview window for live grep with context
          layout_strategy = "vertical",
          layout_config = {
            width = 0.9,
            height = 0.9,
            preview_height = 0.6,
          },
        },
        grep_string = {
          -- Enable floating preview window for grep string with context
          layout_strategy = "vertical", 
          layout_config = {
            width = 0.9,
            height = 0.9,
            preview_height = 0.6,
          },
        },
        lsp_definitions = {
          theme = "cursor",
          initial_mode = "normal",
        },
        lsp_references = {
          theme = "cursor",
          initial_mode = "normal",
        },
        lsp_implementations = {
          theme = "cursor",
          initial_mode = "normal",
        },
      },
    })

    -- Load fzf extension for better performance
    telescope.load_extension("fzf")
  end,
}
