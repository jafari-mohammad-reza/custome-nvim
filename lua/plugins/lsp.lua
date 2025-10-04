-- LSP configuration
return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    -- Setup mason first
    require("mason").setup({
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    -- LSP servers to install
    require("mason-lspconfig").setup({
      ensure_installed = {
        "gopls",           -- Go
        "ts_ls",           -- TypeScript/JavaScript
        "dockerls",        -- Dockerfile
        "docker_compose_language_service", -- Docker Compose
        "yamlls",          -- YAML
        "jsonls",          -- JSON
        "lua_ls",          -- Lua
      },
      automatic_installation = true,
    })

    -- Setup capabilities for autocompletion
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- LSP keymaps
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr }
      
      -- Enhanced go-to-definition mappings using Telescope
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { buffer = bufnr, desc = "Go to definition (Telescope)" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to declaration" })
      vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", { buffer = bufnr, desc = "Go to implementation (Telescope)" })
      vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", { buffer = bufnr, desc = "Go to type definition (Telescope)" })
      vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { buffer = bufnr, desc = "Show references (Telescope)" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Hover documentation" })
      
      -- TypeScript specific keybindings - only add if command is available
      if client.name == "ts_ls" and client.supports_method("workspace/executeCommand") then
        vim.keymap.set("n", "<leader>oi", function()
          -- Check if the command is available before executing
          local commands = client.server_capabilities.executeCommandProvider and client.server_capabilities.executeCommandProvider.commands or {}
          local has_organize_imports = false
          for _, cmd in ipairs(commands) do
            if cmd == "_typescript.organizeImports" then
              has_organize_imports = true
              break
            end
          end
          
          if has_organize_imports then
            vim.lsp.buf.execute_command({
              command = "_typescript.organizeImports",
              arguments = { vim.api.nvim_buf_get_name(0) },
            })
          else
            vim.notify("Organize imports command not available", vim.log.levels.WARN)
          end
        end, { buffer = bufnr, desc = "Organize imports" })
      end
      
      -- Rename with multiple keybindings (F2, leader+rn, leader+CR)
      vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
      vim.keymap.set("n", "<leader><CR>", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename symbol" })
      
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
      vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true }) end, { buffer = bufnr, desc = "Format file" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next diagnostic" })
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { buffer = bufnr, desc = "Show diagnostic" })
      
      -- Format on save
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end
    end

    -- Configure LSP servers
    local lspconfig = require("lspconfig")

    -- Go
    lspconfig.gopls.setup({
      capabilities = capabilities,
      on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        
        -- Organize imports on save for Go
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            local params = vim.lsp.util.make_range_params()
            params.context = { only = { "source.organizeImports" } }
            local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
            for _, res in pairs(result or {}) do
              for _, r in pairs(res.result or {}) do
                if r.edit then
                  vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
                end
              end
            end
          end,
        })
      end,
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    })

    -- TypeScript - Remove auto organize imports on save to prevent errors
    lspconfig.ts_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        typescript = {
          preferences = {
            includePackageJsonAutoImports = "auto",
          },
        },
        javascript = {
          preferences = {
            includePackageJsonAutoImports = "auto",
          },
        },
      },
    })

    -- Docker
    lspconfig.dockerls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- Docker Compose
    lspconfig.docker_compose_language_service.setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- YAML
    lspconfig.yamlls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        yaml = {
          schemas = {
            ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
          },
        },
      },
    })

    -- JSON
    lspconfig.jsonls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    })

    -- Lua
    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        border = "rounded",
        source = "always",
      },
    })

    -- Diagnostic signs
    local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
  end,
}
