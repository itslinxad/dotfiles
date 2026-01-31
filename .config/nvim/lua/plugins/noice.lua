return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = true,
        view = "cmdline", -- Use classic cmdline at bottom
      },
      messages = {
        enabled = false, -- Must be false to avoid overriding cmdline
      },
    },
  },
}
