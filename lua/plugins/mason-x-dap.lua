return {
  "jay-babu/mason-nvim-dap.nvim",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason.nvim",
    "mfussenegger/nvim-dap",
  },
  opts = {
    handlers = {
      firefox = function(config)
        require("mason-nvim-dap").default_setup(config) -- don't forget this!
      end,
    },
  },
}
