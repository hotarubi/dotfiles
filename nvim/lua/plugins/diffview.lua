return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  keys = {
    { "<leader>gd", "<cmd>DiffviewOpen<cr>",          desc = "Diff View (all changes)" },
    { "<leader>gD", "<cmd>DiffviewFileHistory %<cr>", desc = "File History" },
  },
}
