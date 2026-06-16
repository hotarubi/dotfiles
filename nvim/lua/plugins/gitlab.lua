return {
  "harrisoncramer/gitlab.nvim",
  pin = true,  -- patched middleware.go: skip SourceBranch filter when ChosenMrIID is set
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "stevearc/dressing.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  build = "make",
  config = function()
    require("gitlab").setup({
      discussion_tree = { winwidth = 60 },
      reviewer = "diffview",
      -- binary_provided skips the version-check rebuild cycle in build_and_start,
      -- which would otherwise do a second server.start() with chosen_mr_iid reset to 0
      server = {
        binary = vim.fn.expand("~/.local/share/nvim/gitlab.nvim/bin/server"),
        binary_provided = true,
      },
    })
    vim.api.nvim_create_user_command("MrOpen", function(opts)
      local nr = tonumber(opts.args)
      if not nr then vim.notify("Usage: :MrOpen <number>", vim.log.levels.ERROR); return end
      local state = require("gitlab.state")
      state.chosen_mr_iid = nr
      require("gitlab.server").restart(function()
        require("gitlab").review()
      end)
    end, { nargs = 1, desc = "Open GitLab MR by number" })
  end,
  keys = {
    { "<leader>Mo", "<cmd>lua require('gitlab').review()<cr>",           desc = "MR: open review" },
    { "<leader>Mc", "<cmd>lua require('gitlab').create_comment()<cr>",   desc = "MR: create comment" },
    { "<leader>Mn", "<cmd>lua require('gitlab').move_to_discussion_tree_from_diagnostic()<cr>", desc = "MR: next discussion" },
    { "<leader>Ma", "<cmd>lua require('gitlab').approve()<cr>",          desc = "MR: approve" },
    { "<leader>Mm", "<cmd>lua require('gitlab').merge()<cr>",            desc = "MR: merge" },
    { "<leader>Ms", "<cmd>lua require('gitlab').summary()<cr>",          desc = "MR: summary" },
  },
}
