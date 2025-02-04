return {
	"rcarriga/nvim-notify",
  config = function ()
    local notify = require("notify")
    notify.setup()
    -- notify("Ram Ram Malik")
    notify.history()
    vim.notify = require("notify")
  end
}
