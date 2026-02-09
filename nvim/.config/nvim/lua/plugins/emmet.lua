return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        emmet_language_server = {
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescriptreact",
            "vue",
            "svelte",
            "astro",
            "php",
          },
          init_options = {
            html = {
              options = {
                ["bem.enabled"] = true,
              },
            },
          },
        },
      },
    },
  },
}
