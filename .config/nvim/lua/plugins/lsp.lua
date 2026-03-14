return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    servers = {
      rust_analyzer = {
        settings = vim.g.rust_analyzer,
      },
    },
  },
}

