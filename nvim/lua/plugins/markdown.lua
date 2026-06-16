return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    ft = { "markdown" },
    opts = {
      render_modes = { "n", "c" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      local plugin_css = vim.fn.stdpath("data") .. "/lazy/markdown-preview.nvim/app/_static/markdown.css"
      local override_css = vim.fn.expand("~/.dotfiles/nvim/markdown-preview-override.css")
      local generated_css = vim.fn.stdpath("cache") .. "/markdown-preview-full.css"
      if vim.fn.filereadable(plugin_css) == 1 then
        vim.fn.system(
          "cat " .. vim.fn.shellescape(plugin_css)
                 .. " " .. vim.fn.shellescape(override_css)
                 .. " > " .. vim.fn.shellescape(generated_css)
        )
        vim.g.mkdp_markdown_css = generated_css
      end
    end,
    keys = {
      { "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", ft = "markdown", desc = "Markdown: preview in browser" },
    },
  },
  {
    "dhruvasagar/vim-table-mode",
    ft = { "markdown" },
    keys = {
      { "<leader>mt", "<cmd>TableModeToggle<cr>", ft = "markdown", desc = "Markdown: table mode" },
    },
  },
}
