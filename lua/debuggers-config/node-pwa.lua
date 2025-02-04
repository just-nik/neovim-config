-- require("debuggers-config.javascript.adapters")
require("dap").adapters["pwa-node"] = {
  type = "server",
  host = "localhost",
  port = "${port}",
  executable = {
    command = "node",
    -- 💀 Make sure to update this path to point to your installation
    args = {
      vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
      "${port}",
    },
  },
}

-- require("dap").adapters.firefox = {
--   type = "executable",
--   command = "node",
--   args = { vim.fn.stdpath("data") .. "/mason/packages/firefox-debug-adapter/dist/adapter.bundle.js" },
-- }
--
-- require("dap").configurations.javascript = {
--   {
--     type = "pwa-node",
--     request = "launch",
--     name = "Launch file",
--     program = "${file}",
--     cwd = "${workspaceFolder}",
--   },
-- }
---@diagnostic disable-next-line: missing-fields
require("dap-vscode-js").setup({
  debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
  adapters = { "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
})

for _, language in ipairs({ "typescript", "javascript", "svelte" }) do
  require("dap").configurations[language] = {
    -- attach to a node process that has been started with
    -- `--inspect` for longrunning tasks or `--inspect-brk` for short tasks
    -- npm script -> `node --inspect-brk ./node_modules/.bin/vite dev`
    {
      -- use nvim-dap-vscode-js's pwa-node debug adapter
      type = "pwa-node",
      -- attach to an already running node process with --inspect flag
      -- default port: 9222
      request = "attach",
      -- allows us to pick the process using a picker
      processId = require("dap.utils").pick_process,
      -- name of the debug action you have to select for this config
      name = "Attach debugger to existing `node --inspect` process",
      -- for compiled languages like TypeScript or Svelte.js
      sourceMaps = true,
      -- resolve source maps in nested locations while ignoring node_modules
      resolveSourceMapLocations = {
        "${workspaceFolder}/**",
        "!**/node_modules/**",
      },
      -- path to src in vite based projects (and most other projects as well)
      cwd = "${workspaceFolder}/src",
      -- we don't want to debug code inside node_modules, so skip it!
      skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
    },
    {
      type = "pwa-chrome",
      name = "Launch Chrome to debug client",
      request = "launch",
      url = "http://localhost:5173",
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}/src",
      -- skip files from vite's hmr
      skipFiles = { "**/node_modules/**/*", "**/@vite/*", "**/src/client/*", "**/src/*" },
    },
    -- only if language is javascript, offer this debug action
    language == "javascript"
    and {
      {
        -- use nvim-dap-vscode-js's pwa-node debug adapter
        type = "pwa-node",
        -- launch a new process to attach the debugger to
        request = "launch",
        -- name of the debug action you have to select for this config
        name = "Launch file in new node process",
        -- launch current file
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
      {
        name = "Debug with Firefox",
        type = "firefox",
        request = "launch",
        reAttach = true,
        url = "http://localhost:3000",
        webRoot = "${workspaceFolder}",
        firefoxExecutable = "/usr/bin/firefox",
      },
    }
    or nil,
  }
end

