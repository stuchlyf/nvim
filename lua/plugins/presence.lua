local overrides = {
  presence = {},
}

return {
  {
    "andweeb/presence.nvim",
    opts = overrides.presence,
    lazy = false,
  },
}
