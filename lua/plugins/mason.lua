-- Mason for managing LSP servers, formatters, and linters
return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
}
