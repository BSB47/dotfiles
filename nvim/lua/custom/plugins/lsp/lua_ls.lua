vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        pathStrict = false, -- This is where magic happens
      },
      workspace = {
        checkThirdParty = false,
        ignoreDir = {},
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
