return {
  "stevearc/conform.nvim",
  keys = {
    { "<leader>xfa", function() require("conform").format({ async = true }) end,                                    desc = "Format (auto)" },
    { "<leader>xfj", function() require("conform").format({ async = true, formatters = { "jq" } }) end,            desc = "Format JSON",   ft = "json" },
    { "<leader>xfx", function() require("conform").format({ async = true, formatters = { "xmllint" } }) end,       desc = "Format XML",    ft = "xml" },
    { "<leader>xfh", function() require("conform").format({ async = true, formatters = { "prettier" } }) end,      desc = "Format HTML",   ft = "html" },
    { "<leader>xfJ", function() require("conform").format({ async = true, formatters = { "prettier" } }) end,      desc = "Format JS",     ft = "javascript" },
    { "<leader>xfc", function() require("conform").format({ async = true, formatters = { "prettier" } }) end,      desc = "Format CSS",    ft = "css" },
  },
}
